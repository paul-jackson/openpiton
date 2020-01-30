/*
Copyright (c) 2018 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`include "iop.h"
module tinyrv2_l15_transducer (
    input                           clk,
    input                           rst_n,

    // tinyrv2 -> Transducer
    input [77:0]                    tinyrv2_transducer_imemreq_msg,
    input                           tinyrv2_transducer_imemreq_val,
    input                           tinyrv2_transducer_imemresp_rdy,
    input [77:0]                    tinyrv2_transducer_dmemreq_msg,
    input                           tinyrv2_transducer_dmemreq_val,
    input                           tinyrv2_transducer_dmemresp_rdy,

    // L1.5 -> Transducer
    input                           l15_transducer_ack,
    input                           l15_transducer_header_ack,

    // outputs tinyrv2 uses
    // Transducer -> L1.5
    output reg [4:0]                    transducer_l15_rqtype,
    output     [`L15_AMO_OP_WIDTH-1:0]  transducer_l15_amo_op,
    output reg [2:0]                    transducer_l15_size,
    output                              transducer_l15_val,
    output     [`PHY_ADDR_WIDTH-1:0]    transducer_l15_address,
    output     [63:0]                   transducer_l15_data,
    output                              transducer_l15_nc,


    // outputs tinyrv2 doesn't use
    output [0:0]                    transducer_l15_threadid,
    output                          transducer_l15_prefetch,
    output                          transducer_l15_blockstore,
    output                          transducer_l15_blockinitstore,
    output [1:0]                    transducer_l15_l1rplway,
    output                          transducer_l15_invalidate_cacheline,
    output [32:0]                   transducer_l15_csm_data,
    output [63:0]                   transducer_l15_data_next_entry,


    // L1.5 -> Transducer
    input                           l15_transducer_val,
    input [3:0]                     l15_transducer_returntype,
    input [63:0]                    l15_transducer_data_0,
    input [63:0]                    l15_transducer_data_1,

    // Transducer -> tinyrv2
    output reg                      transducer_tinyrv2_imemreq_rdy,
    output reg [47:0]               transducer_tinyrv2_imemresp_msg,
    output reg                      transducer_tinyrv2_imemresp_val,
    output reg                      transducer_tinyrv2_dmemreq_rdy,
    output reg [47:0]               transducer_tinyrv2_dmemresp_msg,
    output reg                      transducer_tinyrv2_dmemresp_val,

    output                          transducer_l15_req_ack,
    output reg                      tinyrv2_int
);

    localparam ACK_IDLE = 1'b0;
    localparam ACK_WAIT = 1'b1;
    localparam D_TYPE   = 1'b0;
    localparam I_TYPE   = 1'b1;
    localparam OFFSET_0 = 2'b00;
    localparam OFFSET_1 = 2'b01;
    localparam OFFSET_2 = 2'b10;
    localparam OFFSET_3 = 2'b11;
    localparam WORD     = 2'b00;
    localparam HALF     = 2'b10;
    localparam BYTE     = 2'b01;

    // Variable Declarations //

    // Taking requests from tinyrv2 core
    reg         cur_memreq_type;
    reg  [77:0] my_tinyrv2_memreq_msg;
    wire [1:0]  tinyrv2_memreq_len;
    wire        tinyrv2_memreq_type;
    wire [31:0] tinyrv2_memreq_addr;
    wire [31:0] tinyrv2_memreq_data;
    reg         tinyrv2_memreq_pending;

    // Responding back to tinyrv2
    reg  [31:0] rdata_part;
    wire [31:0] tinyrv2_memresp_data;
    wire        tinyrv2_memresp_type;
    wire [1:0]  tinyrv2_memresp_len;
    reg         tinyrv2_memresp_val;
    wire [34:0] tinyrv2_memresp_msg;

    // tinyrv2 -> L1.5
    /*******************************DECODER!!!!!**************************************/

    //reg read_i;
    //reg read_d;
    always @ (posedge clk) begin

      // Reset to idle state. Refuse instruction requests from core until interrupt is received.
      if (!rst_n) begin
        transducer_tinyrv2_imemreq_rdy  <= 1'b0;
        transducer_tinyrv2_imemresp_msg <= 48'b0;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy  <= 1'b0;
        transducer_tinyrv2_dmemresp_msg <= 48'b0;
        transducer_tinyrv2_dmemresp_val <= 1'b0;

        tinyrv2_memresp_val             <= 1'b0;

        //read_i <= 1'b0;
        //read_d <= 1'b0;
      end

      // Start accepting instruction and data fetch requests
      else if (tinyrv2_int) begin
        transducer_tinyrv2_imemreq_rdy <= 1'b1;
        transducer_tinyrv2_dmemreq_rdy <= 1'b1;
      end

      // Prioritize data requests over instruction requests since they are later in the pipeline
      // Set current state to handle data request. Stall all other memory requests.
      else if (tinyrv2_transducer_dmemreq_val && transducer_tinyrv2_dmemreq_rdy) begin
        cur_memreq_type                 <= D_TYPE;
        my_tinyrv2_memreq_msg           <= tinyrv2_transducer_dmemreq_msg;

        transducer_tinyrv2_imemreq_rdy  <= 1'b0;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy  <= 1'b0;
        transducer_tinyrv2_dmemresp_val <= 1'b0;
      end

      // Set current state to handle instruction request. Stall all other memory requests.
      else if (tinyrv2_transducer_imemreq_val && transducer_tinyrv2_imemreq_rdy) begin
        cur_memreq_type                 <= I_TYPE;
        my_tinyrv2_memreq_msg           <= tinyrv2_transducer_imemreq_msg;

        transducer_tinyrv2_imemreq_rdy  <= 1'b0;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy  <= 1'b0;
        transducer_tinyrv2_dmemresp_val <= 1'b0;
      end

      // When l15 responds with a store ack or load return, pass the message to the core
      else if (tinyrv2_memresp_val) begin

        // response to dcache port
        if (cur_memreq_type == D_TYPE) begin
          transducer_tinyrv2_imemresp_msg <= 48'b0;
          transducer_tinyrv2_imemresp_val <= 1'b0;

          transducer_tinyrv2_dmemresp_msg <= tinyrv2_memresp_msg;
          transducer_tinyrv2_dmemresp_val <= 1'b1;
        end

        // response to icache port
        else if (cur_memreq_type == I_TYPE) begin
          transducer_tinyrv2_imemresp_msg <= tinyrv2_memresp_msg;
          transducer_tinyrv2_imemresp_val <= 1'b1;

          transducer_tinyrv2_dmemresp_msg <= 48'b0;
          transducer_tinyrv2_dmemresp_val <= 1'b0;
        end

        // not ready to take new requests since we're preparing a response to
        // the core
        transducer_tinyrv2_imemreq_rdy <= 1'b0;
        transducer_tinyrv2_dmemreq_rdy <= 1'b0;
      end

      // On cycle after instruction is sent to core, prepare for new memory request
      else if (transducer_tinyrv2_imemresp_val && tinyrv2_transducer_imemresp_rdy) begin
        transducer_tinyrv2_imemreq_rdy  <= 1'b1;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy  <= 1'b1;
        transducer_tinyrv2_dmemresp_val <= 1'b0;
      end

      // On cycle after data is returned to core, prepare for new memory request
      else if (transducer_tinyrv2_dmemresp_val && tinyrv2_transducer_dmemresp_rdy) begin
        transducer_tinyrv2_imemreq_rdy  <= 1'b1;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy  <= 1'b1;
        transducer_tinyrv2_dmemresp_val <= 1'b0;
      end
    end

    assign  tinyrv2_memreq_type  = my_tinyrv2_memreq_msg[73];
    assign  tinyrv2_memreq_addr  = my_tinyrv2_memreq_msg[65:34];
    assign  tinyrv2_memreq_len   = my_tinyrv2_memreq_msg[33:32];
    assign  tinyrv2_memreq_data  = my_tinyrv2_memreq_msg[31:0];

    always @ (posedge clk) begin
      if (!rst_n) begin
        tinyrv2_memreq_pending <= 1'b0;
      end
      // Set new pending memory request if val/rdy says so and no request is currently pending
      else if (((tinyrv2_transducer_imemreq_val && transducer_tinyrv2_imemreq_rdy) || (tinyrv2_transducer_dmemreq_val && transducer_tinyrv2_dmemreq_rdy)) && !tinyrv2_memreq_pending) begin
        tinyrv2_memreq_pending <= 1'b1;
      end
      // Current request completes when memresp is valid
      else if (tinyrv2_memreq_pending && tinyrv2_memresp_val) begin
        tinyrv2_memreq_pending <= 1'b0;
      end
      // When transducer
      // else if (transducer_tinyrv2_dmemresp_val) begin
      //   tinyrv2_memreq_pending <= 1'b1;
      // end
      /*else if (transducer_tinyrv2_imemresp_val || transducer_tinyrv2_dmemresp_val) begin
        transducer_tinyrv2_imemreq_rdy <= 1'b1;
        transducer_tinyrv2_imemresp_val <= 1'b0;

        transducer_tinyrv2_dmemreq_rdy <= 1'b1;
        transducer_tinyrv2_dmemresp_val <= 1'b0;
      end*/
    end

    reg current_val;
    reg prev_val;

    // is this a new request from tinyrv2?
    wire new_request = current_val & ~prev_val;
    always @ (posedge clk)
    begin
        if (!rst_n) begin
           current_val <= 0;
           prev_val <= 0;
        end
        else begin
           current_val <= tinyrv2_memreq_pending;
           prev_val <= current_val;
        end
    end

    // are we waiting for an ack
    reg ack_reg;
    reg ack_next;
    always @ (posedge clk) begin
        if (!rst_n) begin
            ack_reg <= 0;
        end
        else begin
            ack_reg <= ack_next;
        end
    end
    always @ (*) begin
        // be careful with these conditionals.
        if (l15_transducer_ack) begin
            ack_next = ACK_IDLE;
        end
        else if (new_request) begin
            ack_next = ACK_WAIT;
        end
        else begin
            ack_next = ack_reg;
        end
    end


    // if we haven't got an ack and it's an old request, valid should be high
    // otherwise if we got an ack valid should be high only if we got a new
    // request
    assign transducer_l15_val = (ack_reg == ACK_WAIT) ? tinyrv2_memreq_pending
                                : (ack_reg == ACK_IDLE) ? new_request
                                : tinyrv2_memreq_pending;

    reg [31:0] tinyrv2_wdata_flipped;

    // assign transducer's outputs to l15
    assign transducer_l15_address = {{8{tinyrv2_memreq_addr[31]}}, tinyrv2_memreq_addr};
    assign transducer_l15_nc = tinyrv2_memreq_addr[31];
    assign transducer_l15_data = {tinyrv2_wdata_flipped, tinyrv2_wdata_flipped};


    // set rqtype specific data
    always @ *
    begin
        if (tinyrv2_memreq_pending) begin
            // store operation
            if (tinyrv2_memreq_type) begin
                transducer_l15_rqtype = `STORE_RQ;
                case(tinyrv2_memreq_len)
                    WORD: begin
                        transducer_l15_size = `PCX_SZ_4B;
                        tinyrv2_wdata_flipped = tinyrv2_memreq_data;
                    end
                    BYTE: begin
                        transducer_l15_size = `PCX_SZ_1B;
                        tinyrv2_wdata_flipped = {tinyrv2_memreq_data[7:0], tinyrv2_memreq_data[7:0], tinyrv2_memreq_data[7:0], tinyrv2_memreq_data[7:0]};
                    end
                    HALF: begin
                        transducer_l15_size = `PCX_SZ_2B;
                        tinyrv2_wdata_flipped = {tinyrv2_memreq_data[15:8], tinyrv2_memreq_data[7:0], tinyrv2_memreq_data[7:0], tinyrv2_memreq_data[15:8]};
                    end
                    default: begin // this should never happen
                        tinyrv2_wdata_flipped = tinyrv2_memreq_data;
                        transducer_l15_size = 0;
                    end
                endcase
            end
            // load operation
            else begin
                tinyrv2_wdata_flipped = 32'b0;
                transducer_l15_rqtype = `LOAD_RQ;
                transducer_l15_size = `PCX_SZ_4B;
            end
        end
        else begin
            tinyrv2_wdata_flipped = 32'b0;
            transducer_l15_rqtype = 5'b0;
            transducer_l15_size = 3'b0;
        end
    end


    // L1.5 -> tinyrv2

    /***************** ENCODER!!!!*******************/

    reg [31:0] tinyrv2_memresp_rdata;
    assign  tinyrv2_memresp_data    = tinyrv2_memresp_rdata; // = (cur_memreq_type == D_TYPE) ? tinyrv2_memresp_rdata : rdata_part;

    assign  transducer_l15_req_ack  = l15_transducer_val;
    assign  tinyrv2_memresp_type    = l15_transducer_returntype == 4'b0000 ? 1'b0 : 1'b1;
    assign  tinyrv2_memresp_len     = tinyrv2_memreq_len;
    assign  tinyrv2_memresp_msg     = {2'b0, tinyrv2_memresp_type, 8'b0, 2'b0, tinyrv2_memresp_len, tinyrv2_memresp_data};


    // Keep track of whether we have received the wakeup interrupt
    reg int_recv;
    always @ (posedge clk) begin
        if (!rst_n) begin
            tinyrv2_int <= 1'b0;
        end
        else if (int_recv) begin
            tinyrv2_int <= 1'b1;
        end
        else if (tinyrv2_int) begin
            tinyrv2_int <= 1'b0;
        end
    end

    always @ (*) begin
        if (l15_transducer_val) begin
            case(l15_transducer_returntype)
                `LOAD_RET: begin
                    // load
                    int_recv = 1'b0;
                    tinyrv2_memresp_val = 1'b1;
                    // (sub)word of interest is stored in one of 4 parts of l.15 response
                    case(transducer_l15_address[3:2])
                        OFFSET_3: begin
                            //rdata_part = l15_transducer_data_0[63:32];
                            rdata_part = l15_transducer_data_1[31:0];
                        end
                        OFFSET_2: begin
                            //rdata_part = l15_transducer_data_0[31:0];
                            rdata_part = l15_transducer_data_1[63:32];
                        end
                        OFFSET_1: begin
                            //rdata_part = l15_transducer_data_1[63:32];
                            rdata_part = l15_transducer_data_0[31:0];
                        end
                        OFFSET_0: begin
                            //rdata_part = l15_transducer_data_1[31:0];
                            rdata_part = l15_transducer_data_0[63:32];
                        end
                        default: begin
                        end
                    endcase
                end
                `ST_ACK: begin
                    int_recv = 1'b0;
                    tinyrv2_memresp_val = 1'b1;
                    rdata_part = 32'b0;
                end
                `INT_RET: begin
                    if (l15_transducer_data_0[17:16] == 2'b01) begin
                        int_recv = 1'b1;
                    end
                    else begin
                        int_recv = 1'b0;
                    end
                    tinyrv2_memresp_val = 1'b0;
                    rdata_part = 32'b0;
                end
                default: begin
                    int_recv = 1'b0;
                    tinyrv2_memresp_val = 1'b0;
                    rdata_part = 32'b0;
                end
            endcase
        end
        else begin
            int_recv = 1'b0;
            tinyrv2_memresp_val = 1'b0;
            rdata_part = 32'b0;
        end
    end

    // Flip around data when it is fed to the tinyrv2 core.
    always @ (*) begin
        if (l15_transducer_val && (l15_transducer_returntype == `LOAD_RET)) begin
            case (tinyrv2_memresp_len)
                WORD: begin
                    tinyrv2_memresp_rdata = {rdata_part[7:0], rdata_part[15:8], rdata_part[23:16], rdata_part[31:24]};
                end
                HALF: begin
                    case(transducer_l15_address[1:0])
                        OFFSET_2: begin
                            tinyrv2_memresp_rdata = {rdata_part[31:24], rdata_part[23:16], rdata_part[23:16], rdata_part[31:24]};
                        end
                        OFFSET_0: begin
                            tinyrv2_memresp_rdata = {rdata_part[15:8], rdata_part[7:0], rdata_part[7:0], rdata_part[15:8]};
                        end
                        default: begin
                            tinyrv2_memresp_rdata = 32'b0;
                        end
                    endcase
                end
                BYTE: begin
                    case(transducer_l15_address[1:0])
                        OFFSET_3: begin
                            tinyrv2_memresp_rdata = {rdata_part[31:24], rdata_part[31:24], rdata_part[31:24], rdata_part[31:24]};
                        end
                        OFFSET_2: begin
                            tinyrv2_memresp_rdata = {rdata_part[23:16], rdata_part[23:16], rdata_part[23:16], rdata_part[23:16]};
                        end
                        OFFSET_1: begin
                            tinyrv2_memresp_rdata = {rdata_part[15:8], rdata_part[15:8], rdata_part[15:8], rdata_part[15:8]};
                        end
                        OFFSET_0: begin
                            tinyrv2_memresp_rdata = {rdata_part[7:0], rdata_part[7:0], rdata_part[7:0], rdata_part[7:0]};
                        end
                        default: begin
                            tinyrv2_memresp_rdata = 32'b0;
                        end
                    endcase
                end
                default: begin
                    tinyrv2_memresp_rdata = 32'b0;
                end
            endcase
        end
    end

    // unused wires tie to zero
    assign transducer_l15_threadid = 1'b0;
    assign transducer_l15_prefetch = 1'b0;
    assign transducer_l15_csm_data = 33'b0;
    assign transducer_l15_data_next_entry = 64'b0;
    assign transducer_l15_blockstore = 1'b0;
    assign transducer_l15_blockinitstore = 1'b0;
    assign transducer_l15_l1rplway = 2'b0; // is this set when something in the l1 gets replaced?
    assign transducer_l15_invalidate_cacheline = 1'b0; // will tinyrv2 ever need to invalidate cachelines?

    // debug print
    always @(tinyrv2_transducer_imemreq_val) begin
      $display("tinyrv2_memreq_addr 0x%x", tinyrv2_memreq_addr);
    end

endmodule
