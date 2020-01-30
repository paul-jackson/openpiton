//-----------------------------------------------------------------------------
// ProcPRTL_0x2392074bfa66e6ab
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcPRTL {"num_cores": 1, "reset_freeze": false}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module tinyrv2_proc
(
  input  wire [   0:0] clk,
  output wire [   0:0] commit_inst,
  output wire [  31:0] commit_pc,
  input  wire [  31:0] core_id,
  output wire [  77:0] dmemreq_msg,
  input  wire [   0:0] dmemreq_rdy,
  output wire [   0:0] dmemreq_val,
  input  wire [  47:0] dmemresp_msg,
  output wire [   0:0] dmemresp_rdy,
  input  wire [   0:0] dmemresp_val,
  output wire [  73:0] fpureq_msg,
  input  wire [   0:0] fpureq_rdy,
  output wire [   0:0] fpureq_val,
  input  wire [  39:0] fpuresp_msg,
  output wire [   0:0] fpuresp_rdy,
  input  wire [   0:0] fpuresp_val,
  output wire [  77:0] imemreq_msg,
  input  wire [   0:0] imemreq_rdy,
  output wire [   0:0] imemreq_val,
  input  wire [  47:0] imemresp_msg,
  output wire [   0:0] imemresp_rdy,
  input  wire [   0:0] imemresp_val,
  output wire [  69:0] mdureq_msg,
  input  wire [   0:0] mdureq_rdy,
  output wire [   0:0] mdureq_val,
  input  wire [  34:0] mduresp_msg,
  output wire [   0:0] mduresp_rdy,
  input  wire [   0:0] mduresp_val,
  input  wire [  31:0] mngr2proc_msg,
  output wire [   0:0] mngr2proc_rdy,
  input  wire [   0:0] mngr2proc_val,
  output wire [  31:0] proc2mngr_msg,
  input  wire [   0:0] proc2mngr_rdy,
  output wire [   0:0] proc2mngr_val,
  input  wire [   0:0] reset_l,
  output wire [   0:0] stats_en,
  output wire [  37:0] xcelreq_msg,
  input  wire [   0:0] xcelreq_rdy,
  output wire [   0:0] xcelreq_val,
  input  wire [  32:0] xcelresp_msg,
  output wire [   0:0] xcelresp_rdy,
  input  wire [   0:0] xcelresp_val,

  input wire tinyrv2_int
);

  wire reset = ~reset_l;

  // wire declarations
  wire   [   0:0] imemresp_drop;


  // mdureq_queue temporaries
  wire   [   0:0] mdureq_queue$clk;
  wire   [  69:0] mdureq_queue$enq_msg;
  wire   [   0:0] mdureq_queue$enq_val;
  wire   [   0:0] mdureq_queue$reset;
  wire   [   0:0] mdureq_queue$deq_rdy;
  wire   [   0:0] mdureq_queue$enq_rdy;
  wire   [   0:0] mdureq_queue$full;
  wire   [  69:0] mdureq_queue$deq_msg;
  wire   [   0:0] mdureq_queue$deq_val;

  SingleElementBypassQueue_0x371fd9c705f52a7 mdureq_queue
  (
    .clk     ( mdureq_queue$clk ),
    .enq_msg ( mdureq_queue$enq_msg ),
    .enq_val ( mdureq_queue$enq_val ),
    .reset   ( mdureq_queue$reset ),
    .deq_rdy ( mdureq_queue$deq_rdy ),
    .enq_rdy ( mdureq_queue$enq_rdy ),
    .full    ( mdureq_queue$full ),
    .deq_msg ( mdureq_queue$deq_msg ),
    .deq_val ( mdureq_queue$deq_val )
  );

  // ctrl temporaries
  wire   [   0:0] ctrl$imemresp_val;
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$proc2mngr_rdy;
  wire   [   0:0] ctrl$br_cond_ltu_X;
  wire   [   0:0] ctrl$mngr2proc_val;
  wire   [   0:0] ctrl$br_cond_lt_X;
  wire   [   0:0] ctrl$mduresp_val;
  wire   [   0:0] ctrl$fpureq_rdy;
  wire   [   0:0] ctrl$xcelreq_rdy;
  wire   [  31:0] ctrl$inst_D;
  wire   [   0:0] ctrl$dmemreq_rdy;
  wire   [   0:0] ctrl$imemreq_rdy;
  wire   [   0:0] ctrl$xcelresp_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$dmemresp_val;
  wire   [   0:0] ctrl$mdureq_rdy;
  wire   [   0:0] ctrl$br_cond_eq_X;
  wire   [   0:0] ctrl$fpuresp_val;
  wire   [   0:0] ctrl$dmemreq_val;
  wire   [   0:0] ctrl$mduresp_rdy;
  wire   [   0:0] ctrl$mngr2proc_rdy;
  wire   [   2:0] ctrl$imm_type_D;
  wire   [   0:0] ctrl$mdureq_val;
  wire   [   0:0] ctrl$rs1_fprf_D;
  wire   [   2:0] ctrl$mdureq_msg_type;
  wire   [   1:0] ctrl$op1_byp_sel_D;
  wire   [   0:0] ctrl$dmemresp_rdy;
  wire   [   0:0] ctrl$fpuresp_rdy;
  wire   [   0:0] ctrl$reg_en_X;
  wire   [   0:0] ctrl$xcelreq_val;
  wire   [   1:0] ctrl$wb_result_sel_M;
  wire   [   0:0] ctrl$reg_en_D;
  wire   [   0:0] ctrl$reg_en_F;
  wire   [   0:0] ctrl$reg_en_M;
  wire   [   2:0] ctrl$dm_resp_sel_M;
  wire   [   0:0] ctrl$reg_en_W;
  wire   [   3:0] ctrl$alu_fn_X;
  wire   [   0:0] ctrl$xcelreq_msg_type;
  wire   [   1:0] ctrl$ex_result_sel_X;
  wire   [   0:0] ctrl$rs2_fprf_D;
  wire   [   0:0] ctrl$fpureq_val;
  wire   [   3:0] ctrl$fpureq_msg_type;
  wire   [   1:0] ctrl$csrr_sel_D;
  wire   [   1:0] ctrl$dmemreq_msg_len;
  wire   [   1:0] ctrl$op2_byp_sel_D;
  wire   [   0:0] ctrl$rf_wen_W;
  wire   [   3:0] ctrl$dmemreq_msg_type;
  wire   [   4:0] ctrl$rf_waddr_W;
  wire   [   0:0] ctrl$rd_fprf_W;
  wire   [   1:0] ctrl$pc_sel_F;
  wire   [   0:0] ctrl$proc2mngr_val;
  wire   [   0:0] ctrl$commit_inst;
  wire   [   0:0] ctrl$imemreq_val;
  wire   [   0:0] ctrl$imemresp_drop;
  wire   [   0:0] ctrl$op1_sel_D;
  wire   [   0:0] ctrl$xcelresp_rdy;
  wire   [   0:0] ctrl$stats_en_wen_W;
  wire   [   0:0] ctrl$imemresp_rdy;
  wire   [   1:0] ctrl$op2_sel_D;

  ProcCtrlPRTL_0x7240db358d36b822 ctrl
  (
    .imemresp_val     ( ctrl$imemresp_val ),
    .clk              ( ctrl$clk ),
    .proc2mngr_rdy    ( ctrl$proc2mngr_rdy ),
    .br_cond_ltu_X    ( ctrl$br_cond_ltu_X ),
    .mngr2proc_val    ( ctrl$mngr2proc_val ),
    .br_cond_lt_X     ( ctrl$br_cond_lt_X ),
    .mduresp_val      ( ctrl$mduresp_val ),
    .fpureq_rdy       ( ctrl$fpureq_rdy ),
    .xcelreq_rdy      ( ctrl$xcelreq_rdy ),
    .inst_D           ( ctrl$inst_D ),
    .dmemreq_rdy      ( ctrl$dmemreq_rdy ),
    .imemreq_rdy      ( ctrl$imemreq_rdy ),
    .xcelresp_val     ( ctrl$xcelresp_val ),
    .reset            ( ctrl$reset ),
    .dmemresp_val     ( ctrl$dmemresp_val ),
    .mdureq_rdy       ( ctrl$mdureq_rdy ),
    .br_cond_eq_X     ( ctrl$br_cond_eq_X ),
    .fpuresp_val      ( ctrl$fpuresp_val ),
    .dmemreq_val      ( ctrl$dmemreq_val ),
    .mduresp_rdy      ( ctrl$mduresp_rdy ),
    .mngr2proc_rdy    ( ctrl$mngr2proc_rdy ),
    .imm_type_D       ( ctrl$imm_type_D ),
    .mdureq_val       ( ctrl$mdureq_val ),
    .rs1_fprf_D       ( ctrl$rs1_fprf_D ),
    .mdureq_msg_type  ( ctrl$mdureq_msg_type ),
    .op1_byp_sel_D    ( ctrl$op1_byp_sel_D ),
    .dmemresp_rdy     ( ctrl$dmemresp_rdy ),
    .fpuresp_rdy      ( ctrl$fpuresp_rdy ),
    .reg_en_X         ( ctrl$reg_en_X ),
    .xcelreq_val      ( ctrl$xcelreq_val ),
    .wb_result_sel_M  ( ctrl$wb_result_sel_M ),
    .reg_en_D         ( ctrl$reg_en_D ),
    .reg_en_F         ( ctrl$reg_en_F ),
    .reg_en_M         ( ctrl$reg_en_M ),
    .dm_resp_sel_M    ( ctrl$dm_resp_sel_M ),
    .reg_en_W         ( ctrl$reg_en_W ),
    .alu_fn_X         ( ctrl$alu_fn_X ),
    .xcelreq_msg_type ( ctrl$xcelreq_msg_type ),
    .ex_result_sel_X  ( ctrl$ex_result_sel_X ),
    .rs2_fprf_D       ( ctrl$rs2_fprf_D ),
    .fpureq_val       ( ctrl$fpureq_val ),
    .fpureq_msg_type  ( ctrl$fpureq_msg_type ),
    .csrr_sel_D       ( ctrl$csrr_sel_D ),
    .dmemreq_msg_len  ( ctrl$dmemreq_msg_len ),
    .op2_byp_sel_D    ( ctrl$op2_byp_sel_D ),
    .rf_wen_W         ( ctrl$rf_wen_W ),
    .dmemreq_msg_type ( ctrl$dmemreq_msg_type ),
    .rf_waddr_W       ( ctrl$rf_waddr_W ),
    .rd_fprf_W        ( ctrl$rd_fprf_W ),
    .pc_sel_F         ( ctrl$pc_sel_F ),
    .proc2mngr_val    ( ctrl$proc2mngr_val ),
    .commit_inst      ( ctrl$commit_inst ),
    .imemreq_val      ( ctrl$imemreq_val ),
    .imemresp_drop    ( ctrl$imemresp_drop ),
    .op1_sel_D        ( ctrl$op1_sel_D ),
    .xcelresp_rdy     ( ctrl$xcelresp_rdy ),
    .stats_en_wen_W   ( ctrl$stats_en_wen_W ),
    .imemresp_rdy     ( ctrl$imemresp_rdy ),
    .op2_sel_D        ( ctrl$op2_sel_D )
  );

  // fpureq_queue temporaries
  wire   [   0:0] fpureq_queue$clk;
  wire   [  73:0] fpureq_queue$enq_msg;
  wire   [   0:0] fpureq_queue$enq_val;
  wire   [   0:0] fpureq_queue$reset;
  wire   [   0:0] fpureq_queue$deq_rdy;
  wire   [   0:0] fpureq_queue$enq_rdy;
  wire   [   0:0] fpureq_queue$full;
  wire   [  73:0] fpureq_queue$deq_msg;
  wire   [   0:0] fpureq_queue$deq_val;

  SingleElementBypassQueue_0x371fd9c702249db fpureq_queue
  (
    .clk     ( fpureq_queue$clk ),
    .enq_msg ( fpureq_queue$enq_msg ),
    .enq_val ( fpureq_queue$enq_val ),
    .reset   ( fpureq_queue$reset ),
    .deq_rdy ( fpureq_queue$deq_rdy ),
    .enq_rdy ( fpureq_queue$enq_rdy ),
    .full    ( fpureq_queue$full ),
    .deq_msg ( fpureq_queue$deq_msg ),
    .deq_val ( fpureq_queue$deq_val )
  );

  // imemresp_drop_unit temporaries
  wire   [   0:0] imemresp_drop_unit$out_rdy;
  wire   [  31:0] imemresp_drop_unit$in__msg;
  wire   [   0:0] imemresp_drop_unit$in__val;
  wire   [   0:0] imemresp_drop_unit$clk;
  wire   [   0:0] imemresp_drop_unit$reset;
  wire   [   0:0] imemresp_drop_unit$drop;
  wire   [  31:0] imemresp_drop_unit$out_msg;
  wire   [   0:0] imemresp_drop_unit$out_val;
  wire   [   0:0] imemresp_drop_unit$in__rdy;

  DropUnitPRTL_0x219cef4ae91b957 imemresp_drop_unit
  (
    .out_rdy ( imemresp_drop_unit$out_rdy ),
    .in__msg ( imemresp_drop_unit$in__msg ),
    .in__val ( imemresp_drop_unit$in__val ),
    .clk     ( imemresp_drop_unit$clk ),
    .reset   ( imemresp_drop_unit$reset ),
    .drop    ( imemresp_drop_unit$drop ),
    .out_msg ( imemresp_drop_unit$out_msg ),
    .out_val ( imemresp_drop_unit$out_val ),
    .in__rdy ( imemresp_drop_unit$in__rdy )
  );

  // xcelreq_queue temporaries
  wire   [   0:0] xcelreq_queue$clk;
  wire   [  37:0] xcelreq_queue$enq_msg;
  wire   [   0:0] xcelreq_queue$enq_val;
  wire   [   0:0] xcelreq_queue$reset;
  wire   [   0:0] xcelreq_queue$deq_rdy;
  wire   [   0:0] xcelreq_queue$enq_rdy;
  wire   [   0:0] xcelreq_queue$full;
  wire   [  37:0] xcelreq_queue$deq_msg;
  wire   [   0:0] xcelreq_queue$deq_val;

  SingleElementBypassQueue_0x371f9f91cd6eedb xcelreq_queue
  (
    .clk     ( xcelreq_queue$clk ),
    .enq_msg ( xcelreq_queue$enq_msg ),
    .enq_val ( xcelreq_queue$enq_val ),
    .reset   ( xcelreq_queue$reset ),
    .deq_rdy ( xcelreq_queue$deq_rdy ),
    .enq_rdy ( xcelreq_queue$enq_rdy ),
    .full    ( xcelreq_queue$full ),
    .deq_msg ( xcelreq_queue$deq_msg ),
    .deq_val ( xcelreq_queue$deq_val )
  );

  // dpath temporaries
  wire   [   2:0] dpath$imm_type_D;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reg_en_W;
  wire   [  31:0] dpath$fpuresp_msg;
  wire   [  31:0] dpath$core_id;
  wire   [   0:0] dpath$rs1_fprf_D;
  wire   [   1:0] dpath$op1_byp_sel_D;
  wire   [   0:0] dpath$reg_en_X;
  wire   [   1:0] dpath$op2_byp_sel_D;
  wire   [   1:0] dpath$wb_result_sel_M;
  wire   [   0:0] dpath$reg_en_D;
  wire   [   0:0] dpath$reg_en_F;
  wire   [   0:0] dpath$reg_en_M;
  wire   [   2:0] dpath$dm_resp_sel_M;
  wire   [   3:0] dpath$alu_fn_X;
  wire   [   1:0] dpath$ex_result_sel_X;
  wire   [   0:0] dpath$rs2_fprf_D;
  wire   [   1:0] dpath$csrr_sel_D;
  wire   [   0:0] dpath$rf_wen_W;
  wire   [   4:0] dpath$rf_waddr_W;
  wire   [   0:0] dpath$rd_fprf_W;
  wire   [  31:0] dpath$mduresp_msg;
  wire   [   0:0] dpath$stats_en_wen_W;
  wire   [  31:0] dpath$mngr2proc_data;
  wire   [   0:0] dpath$reset;
  wire   [   1:0] dpath$pc_sel_F;
  wire   [   0:0] dpath$op1_sel_D;
  wire   [  31:0] dpath$xcelresp_msg_data;
  wire   [  31:0] dpath$imemresp_msg_data;
  wire   [  31:0] dpath$dmemresp_msg_data;
  wire   [   1:0] dpath$op2_sel_D;
  wire   [   0:0] dpath$stats_en;
  wire   [   0:0] dpath$br_cond_ltu_X;
  wire   [  31:0] dpath$dmemreq_msg_data;
  wire   [  31:0] dpath$proc2mngr_data;
  wire   [   0:0] dpath$br_cond_lt_X;
  wire   [  31:0] dpath$inst_D;
  wire   [  31:0] dpath$mdureq_msg_op_b;
  wire   [  31:0] dpath$mdureq_msg_op_a;
  wire   [  31:0] dpath$fpureq_msg_op_a;
  wire   [  31:0] dpath$fpureq_msg_op_b;
  wire   [   4:0] dpath$xcelreq_msg_raddr;
  wire   [  31:0] dpath$dmemreq_msg_addr;
  wire   [   0:0] dpath$br_cond_eq_X;
  wire   [  31:0] dpath$xcelreq_msg_data;
  wire   [  77:0] dpath$imemreq_msg;
  wire   [  31:0] dpath$commit_pc;

  ProcDpathPRTL_0x4a10d55468bee90e dpath
  (
    .imm_type_D        ( dpath$imm_type_D ),
    .clk               ( dpath$clk ),
    .reg_en_W          ( dpath$reg_en_W ),
    .fpuresp_msg       ( dpath$fpuresp_msg ),
    .core_id           ( dpath$core_id ),
    .rs1_fprf_D        ( dpath$rs1_fprf_D ),
    .op1_byp_sel_D     ( dpath$op1_byp_sel_D ),
    .reg_en_X          ( dpath$reg_en_X ),
    .op2_byp_sel_D     ( dpath$op2_byp_sel_D ),
    .wb_result_sel_M   ( dpath$wb_result_sel_M ),
    .reg_en_D          ( dpath$reg_en_D ),
    .reg_en_F          ( dpath$reg_en_F ),
    .reg_en_M          ( dpath$reg_en_M ),
    .dm_resp_sel_M     ( dpath$dm_resp_sel_M ),
    .alu_fn_X          ( dpath$alu_fn_X ),
    .ex_result_sel_X   ( dpath$ex_result_sel_X ),
    .rs2_fprf_D        ( dpath$rs2_fprf_D ),
    .csrr_sel_D        ( dpath$csrr_sel_D ),
    .rf_wen_W          ( dpath$rf_wen_W ),
    .rf_waddr_W        ( dpath$rf_waddr_W ),
    .rd_fprf_W         ( dpath$rd_fprf_W ),
    .mduresp_msg       ( dpath$mduresp_msg ),
    .stats_en_wen_W    ( dpath$stats_en_wen_W ),
    .mngr2proc_data    ( dpath$mngr2proc_data ),
    .reset             ( dpath$reset ),
    .pc_sel_F          ( dpath$pc_sel_F ),
    .op1_sel_D         ( dpath$op1_sel_D ),
    .xcelresp_msg_data ( dpath$xcelresp_msg_data ),
    .imemresp_msg_data ( dpath$imemresp_msg_data ),
    .dmemresp_msg_data ( dpath$dmemresp_msg_data ),
    .op2_sel_D         ( dpath$op2_sel_D ),
    .stats_en          ( dpath$stats_en ),
    .br_cond_ltu_X     ( dpath$br_cond_ltu_X ),
    .dmemreq_msg_data  ( dpath$dmemreq_msg_data ),
    .proc2mngr_data    ( dpath$proc2mngr_data ),
    .br_cond_lt_X      ( dpath$br_cond_lt_X ),
    .inst_D            ( dpath$inst_D ),
    .mdureq_msg_op_b   ( dpath$mdureq_msg_op_b ),
    .mdureq_msg_op_a   ( dpath$mdureq_msg_op_a ),
    .fpureq_msg_op_a   ( dpath$fpureq_msg_op_a ),
    .fpureq_msg_op_b   ( dpath$fpureq_msg_op_b ),
    .xcelreq_msg_raddr ( dpath$xcelreq_msg_raddr ),
    .dmemreq_msg_addr  ( dpath$dmemreq_msg_addr ),
    .br_cond_eq_X      ( dpath$br_cond_eq_X ),
    .xcelreq_msg_data  ( dpath$xcelreq_msg_data ),
    .imemreq_msg       ( dpath$imemreq_msg ),
    .commit_pc         ( dpath$commit_pc )
  );

  // imemreq_queue temporaries
  wire   [   0:0] imemreq_queue$clk;
  wire   [  77:0] imemreq_queue$enq_msg;
  wire   [   0:0] imemreq_queue$enq_val;
  wire   [   0:0] imemreq_queue$reset;
  wire   [   0:0] imemreq_queue$deq_rdy;
  wire   [   0:0] imemreq_queue$enq_rdy;
  wire   [   0:0] imemreq_queue$empty;
  wire   [   0:0] imemreq_queue$full;
  wire   [  77:0] imemreq_queue$deq_msg;
  wire   [   0:0] imemreq_queue$deq_val;

  TwoElementBypassQueue_0x371fd9c6fe540cf imemreq_queue
  (
    .clk     ( imemreq_queue$clk ),
    .enq_msg ( imemreq_queue$enq_msg ),
    .enq_val ( imemreq_queue$enq_val ),
    .reset   ( imemreq_queue$reset ),
    .deq_rdy ( imemreq_queue$deq_rdy ),
    .enq_rdy ( imemreq_queue$enq_rdy ),
    .empty   ( imemreq_queue$empty ),
    .full    ( imemreq_queue$full ),
    .deq_msg ( imemreq_queue$deq_msg ),
    .deq_val ( imemreq_queue$deq_val )
  );

  // proc2mngr_queue temporaries
  wire   [   0:0] proc2mngr_queue$clk;
  wire   [  31:0] proc2mngr_queue$enq_msg;
  wire   [   0:0] proc2mngr_queue$enq_val;
  wire   [   0:0] proc2mngr_queue$reset;
  wire   [   0:0] proc2mngr_queue$deq_rdy;
  wire   [   0:0] proc2mngr_queue$enq_rdy;
  wire   [   0:0] proc2mngr_queue$full;
  wire   [  31:0] proc2mngr_queue$deq_msg;
  wire   [   0:0] proc2mngr_queue$deq_val;

  SingleElementBypassQueue_0x371f9f91c7b6145 proc2mngr_queue
  (
    .clk     ( proc2mngr_queue$clk ),
    .enq_msg ( proc2mngr_queue$enq_msg ),
    .enq_val ( proc2mngr_queue$enq_val ),
    .reset   ( proc2mngr_queue$reset ),
    .deq_rdy ( proc2mngr_queue$deq_rdy ),
    .enq_rdy ( proc2mngr_queue$enq_rdy ),
    .full    ( proc2mngr_queue$full ),
    .deq_msg ( proc2mngr_queue$deq_msg ),
    .deq_val ( proc2mngr_queue$deq_val )
  );

  // dmemreq_queue temporaries
  wire   [   0:0] dmemreq_queue$clk;
  wire   [  77:0] dmemreq_queue$enq_msg;
  wire   [   0:0] dmemreq_queue$enq_val;
  wire   [   0:0] dmemreq_queue$reset;
  wire   [   0:0] dmemreq_queue$deq_rdy;
  wire   [   0:0] dmemreq_queue$enq_rdy;
  wire   [   0:0] dmemreq_queue$full;
  wire   [  77:0] dmemreq_queue$deq_msg;
  wire   [   0:0] dmemreq_queue$deq_val;

  SingleElementBypassQueue_0x371fd9c6fe540cf dmemreq_queue
  (
    .clk     ( dmemreq_queue$clk ),
    .enq_msg ( dmemreq_queue$enq_msg ),
    .enq_val ( dmemreq_queue$enq_val ),
    .reset   ( dmemreq_queue$reset ),
    .deq_rdy ( dmemreq_queue$deq_rdy ),
    .enq_rdy ( dmemreq_queue$enq_rdy ),
    .full    ( dmemreq_queue$full ),
    .deq_msg ( dmemreq_queue$deq_msg ),
    .deq_val ( dmemreq_queue$deq_val )
  );

  // signal connections
  assign commit_inst                  = ctrl$commit_inst;
  assign commit_inst                  = ctrl$commit_inst;
  assign commit_pc                    = dpath$commit_pc;
  assign commit_pc                    = dpath$commit_pc;
  assign ctrl$br_cond_eq_X            = dpath$br_cond_eq_X;
  assign ctrl$br_cond_lt_X            = dpath$br_cond_lt_X;
  assign ctrl$br_cond_ltu_X           = dpath$br_cond_ltu_X;
  assign ctrl$clk                     = clk;
  assign ctrl$dmemreq_rdy             = dmemreq_queue$enq_rdy;
  assign ctrl$dmemresp_val            = dmemresp_val;
  assign ctrl$fpureq_rdy              = fpureq_queue$enq_rdy;
  assign ctrl$fpuresp_val             = fpuresp_val;
  assign ctrl$imemreq_rdy             = imemreq_queue$enq_rdy;
  assign ctrl$imemresp_val            = imemresp_drop_unit$out_val;
  assign ctrl$inst_D                  = dpath$inst_D;
  assign ctrl$mdureq_rdy              = mdureq_queue$enq_rdy;
  assign ctrl$mduresp_val             = mduresp_val;
  assign ctrl$mngr2proc_val           = mngr2proc_val;
  assign ctrl$proc2mngr_rdy           = proc2mngr_queue$enq_rdy;
  assign ctrl$reset                   = reset;
  assign ctrl$xcelreq_rdy             = xcelreq_queue$enq_rdy;
  assign ctrl$xcelresp_val            = xcelresp_val;
  assign dmemreq_msg                  = dmemreq_queue$deq_msg;
  assign dmemreq_queue$clk            = clk;
  assign dmemreq_queue$deq_rdy        = dmemreq_rdy;
  assign dmemreq_queue$enq_msg[31:0]  = dpath$dmemreq_msg_data;
  assign dmemreq_queue$enq_msg[33:32] = ctrl$dmemreq_msg_len;
  assign dmemreq_queue$enq_msg[65:34] = dpath$dmemreq_msg_addr;
  assign dmemreq_queue$enq_msg[73:66] = 8'd0;
  assign dmemreq_queue$enq_msg[77:74] = ctrl$dmemreq_msg_type;
  assign dmemreq_queue$enq_val        = ctrl$dmemreq_val;
  assign dmemreq_queue$reset          = reset;
  assign dmemreq_val                  = dmemreq_queue$deq_val;
  assign dmemresp_rdy                 = ctrl$dmemresp_rdy;
  assign dpath$alu_fn_X               = ctrl$alu_fn_X;
  assign dpath$clk                    = clk;
  assign dpath$core_id                = core_id;
  assign dpath$core_id                = core_id;
  assign dpath$csrr_sel_D             = ctrl$csrr_sel_D;
  assign dpath$dm_resp_sel_M          = ctrl$dm_resp_sel_M;
  assign dpath$dmemresp_msg_data      = dmemresp_msg[31:0];
  assign dpath$ex_result_sel_X        = ctrl$ex_result_sel_X;
  assign dpath$fpuresp_msg            = fpuresp_msg[36:5];
  assign dpath$imemresp_msg_data      = imemresp_drop_unit$out_msg;
  assign dpath$imm_type_D             = ctrl$imm_type_D;
  assign dpath$mduresp_msg            = mduresp_msg[31:0];
  assign dpath$mngr2proc_data         = mngr2proc_msg;
  assign dpath$op1_byp_sel_D          = ctrl$op1_byp_sel_D;
  assign dpath$op1_sel_D              = ctrl$op1_sel_D;
  assign dpath$op2_byp_sel_D          = ctrl$op2_byp_sel_D;
  assign dpath$op2_sel_D              = ctrl$op2_sel_D;
  assign dpath$pc_sel_F               = ctrl$pc_sel_F;
  assign dpath$rd_fprf_W              = ctrl$rd_fprf_W;
  assign dpath$reg_en_D               = ctrl$reg_en_D;
  assign dpath$reg_en_F               = ctrl$reg_en_F;
  assign dpath$reg_en_M               = ctrl$reg_en_M;
  assign dpath$reg_en_W               = ctrl$reg_en_W;
  assign dpath$reg_en_X               = ctrl$reg_en_X;
  assign dpath$reset                  = reset;
  assign dpath$rf_waddr_W             = ctrl$rf_waddr_W;
  assign dpath$rf_wen_W               = ctrl$rf_wen_W;
  assign dpath$rs1_fprf_D             = ctrl$rs1_fprf_D;
  assign dpath$rs2_fprf_D             = ctrl$rs2_fprf_D;
  assign dpath$stats_en_wen_W         = ctrl$stats_en_wen_W;
  assign dpath$wb_result_sel_M        = ctrl$wb_result_sel_M;
  assign dpath$xcelresp_msg_data      = xcelresp_msg[31:0];
  assign fpureq_msg                   = fpureq_queue$deq_msg;
  assign fpureq_queue$clk             = clk;
  assign fpureq_queue$deq_rdy         = fpureq_rdy;
  assign fpureq_queue$enq_msg[2:0]    = 3'd0;
  assign fpureq_queue$enq_msg[34:3]   = dpath$fpureq_msg_op_b;
  assign fpureq_queue$enq_msg[66:35]  = dpath$fpureq_msg_op_a;
  assign fpureq_queue$enq_msg[73:70]  = ctrl$fpureq_msg_type;
  assign fpureq_queue$enq_val         = ctrl$fpureq_val;
  assign fpureq_queue$reset           = reset;
  assign fpureq_val                   = fpureq_queue$deq_val;
  assign fpuresp_rdy                  = ctrl$fpuresp_rdy;
  assign imemreq_msg                  = imemreq_queue$deq_msg;
  assign imemreq_queue$clk            = clk;
  assign imemreq_queue$deq_rdy        = imemreq_rdy;
  assign imemreq_queue$enq_msg        = dpath$imemreq_msg;
  assign imemreq_queue$enq_val        = ctrl$imemreq_val;
  assign imemreq_queue$reset          = reset;
  assign imemreq_val                  = imemreq_queue$deq_val;
  assign imemresp_drop                = ctrl$imemresp_drop;
  assign imemresp_drop_unit$clk       = clk;
  assign imemresp_drop_unit$drop      = imemresp_drop;
  assign imemresp_drop_unit$in__msg   = imemresp_msg[31:0];
  assign imemresp_drop_unit$in__val   = imemresp_val;
  assign imemresp_drop_unit$out_rdy   = ctrl$imemresp_rdy;
  assign imemresp_drop_unit$reset     = reset;
  assign imemresp_rdy                 = imemresp_drop_unit$in__rdy;
  assign mdureq_msg                   = mdureq_queue$deq_msg;
  assign mdureq_queue$clk             = clk;
  assign mdureq_queue$deq_rdy         = mdureq_rdy;
  assign mdureq_queue$enq_msg[31:0]   = dpath$mdureq_msg_op_b;
  assign mdureq_queue$enq_msg[63:32]  = dpath$mdureq_msg_op_a;
  assign mdureq_queue$enq_msg[69:67]  = ctrl$mdureq_msg_type;
  assign mdureq_queue$enq_val         = ctrl$mdureq_val;
  assign mdureq_queue$reset           = reset;
  assign mdureq_val                   = mdureq_queue$deq_val;
  assign mduresp_rdy                  = ctrl$mduresp_rdy;
  assign mngr2proc_rdy                = ctrl$mngr2proc_rdy;
  assign proc2mngr_msg                = proc2mngr_queue$deq_msg;
  assign proc2mngr_queue$clk          = clk;
  assign proc2mngr_queue$deq_rdy      = proc2mngr_rdy;
  assign proc2mngr_queue$enq_msg      = dpath$proc2mngr_data;
  assign proc2mngr_queue$enq_val      = ctrl$proc2mngr_val;
  assign proc2mngr_queue$reset        = reset;
  assign proc2mngr_val                = proc2mngr_queue$deq_val;
  assign stats_en                     = dpath$stats_en;
  assign stats_en                     = dpath$stats_en;
  assign xcelreq_msg                  = xcelreq_queue$deq_msg;
  assign xcelreq_queue$clk            = clk;
  assign xcelreq_queue$deq_rdy        = xcelreq_rdy;
  assign xcelreq_queue$enq_msg[31:0]  = dpath$xcelreq_msg_data;
  assign xcelreq_queue$enq_msg[36:32] = dpath$xcelreq_msg_raddr;
  assign xcelreq_queue$enq_msg[37:37] = ctrl$xcelreq_msg_type;
  assign xcelreq_queue$enq_val        = ctrl$xcelreq_val;
  assign xcelreq_queue$reset          = reset;
  assign xcelreq_val                  = xcelreq_queue$deq_val;
  assign xcelresp_rdy                 = ctrl$xcelresp_rdy;



endmodule // ProcPRTL_0x2392074bfa66e6ab
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371fd9c705f52a7
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 70}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371fd9c705f52a7
(
  input  wire [   0:0] clk,
  output wire [  69:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  69:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   0:0] full,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$bypass_mux_sel;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$deq_val;
  wire   [   0:0] ctrl$full;
  wire   [   0:0] ctrl$enq_rdy;

  SingleElementBypassQueueCtrl_0x10bc624c3d616f27 ctrl
  (
    .clk            ( ctrl$clk ),
    .enq_val        ( ctrl$enq_val ),
    .reset          ( ctrl$reset ),
    .deq_rdy        ( ctrl$deq_rdy ),
    .bypass_mux_sel ( ctrl$bypass_mux_sel ),
    .wen            ( ctrl$wen ),
    .deq_val        ( ctrl$deq_val ),
    .full           ( ctrl$full ),
    .enq_rdy        ( ctrl$enq_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$bypass_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  69:0] dpath$enq_bits;
  wire   [  69:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371fd9c705f52a7 dpath
  (
    .wen            ( dpath$wen ),
    .bypass_mux_sel ( dpath$bypass_mux_sel ),
    .clk            ( dpath$clk ),
    .reset          ( dpath$reset ),
    .enq_bits       ( dpath$enq_bits ),
    .deq_bits       ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk             = clk;
  assign ctrl$deq_rdy         = deq_rdy;
  assign ctrl$enq_val         = enq_val;
  assign ctrl$reset           = reset;
  assign deq_msg              = dpath$deq_bits;
  assign deq_val              = ctrl$deq_val;
  assign dpath$bypass_mux_sel = ctrl$bypass_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$enq_bits       = enq_msg;
  assign dpath$reset          = reset;
  assign dpath$wen            = ctrl$wen;
  assign enq_rdy              = ctrl$enq_rdy;
  assign full                 = ctrl$full;



endmodule // SingleElementBypassQueue_0x371fd9c705f52a7
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueCtrl_0x10bc624c3d616f27
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueCtrl_0x10bc624c3d616f27
(
  output reg  [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  input  wire [   0:0] deq_rdy,
  output reg  [   0:0] deq_val,
  output reg  [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output reg  [   0:0] full,
  input  wire [   0:0] reset,
  output reg  [   0:0] wen
);

  // register declarations
  reg    [   0:0] do_bypass;
  reg    [   0:0] do_deq;
  reg    [   0:0] do_enq;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq():
  //
  //       # TODO: can't use temporaries here, verilog simulation semantics
  //       #       don't match the Python semantics!
  //       ## helper signals
  //
  //       #do_deq    = s.deq_rdy and s.deq_val
  //       #do_enq    = s.enq_rdy and s.enq_val
  //       #do_bypass = ~s.full and do_deq and do_enq
  //
  //       # full bit calculation: the full bit is cleared when a dequeue
  //       # transaction occurs; the full bit is set when the queue storage is
  //       # empty and a enqueue transaction occurs and when we are not bypassing
  //
  //       if   s.reset:                      s.full.next = 0
  //       elif s.do_deq:                     s.full.next = 0
  //       elif s.do_enq and not s.do_bypass: s.full.next = 1
  //       else:                              s.full.next = s.full

  // logic for seq()
  always @ (posedge clk) begin
    if (reset) begin
      full <= 0;
    end
    else begin
      if (do_deq) begin
        full <= 0;
      end
      else begin
        if ((do_enq&&!do_bypass)) begin
          full <= 1;
        end
        else begin
          full <= full;
        end
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb():
  //
  //       # bypass is always enabled when the queue is empty
  //
  //       s.bypass_mux_sel.value = ~s.full
  //
  //       # wen control signal: set the write enable signal if the storage queue
  //       # is empty and a valid enqueue request is present
  //
  //       s.wen.value = ~s.full & s.enq_val
  //
  //       # enq_rdy signal is asserted when the single element queue storage is
  //       # empty
  //
  //       s.enq_rdy.value = ~s.full
  //
  //       # deq_val signal is asserted when the single element queue storage is
  //       # full or when the queue is empty but we are bypassing
  //
  //       s.deq_val.value = s.full | ( ~s.full & s.enq_val )
  //
  //       # TODO: figure out how to make these work as temporaries
  //       # helper signals
  //
  //       s.do_deq.value    = s.deq_rdy and s.deq_val
  //       s.do_enq.value    = s.enq_rdy and s.enq_val
  //       s.do_bypass.value = ~s.full and s.do_deq and s.do_enq

  // logic for comb()
  always @ (*) begin
    bypass_mux_sel = ~full;
    wen = (~full&enq_val);
    enq_rdy = ~full;
    deq_val = (full|(~full&enq_val));
    do_deq = (deq_rdy&&deq_val);
    do_enq = (enq_rdy&&enq_val);
    do_bypass = (~full&&do_deq&&do_enq);
  end


endmodule // SingleElementBypassQueueCtrl_0x10bc624c3d616f27
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueDpath_0x371fd9c705f52a7
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 70}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371fd9c705f52a7
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  69:0] deq_bits,
  input  wire [  69:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  69:0] bypass_mux$in_$000;
  wire   [  69:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  69:0] bypass_mux$out;

  Mux_0x63c0af18f27ae1df bypass_mux
  (
    .reset   ( bypass_mux$reset ),
    .in_$000 ( bypass_mux$in_$000 ),
    .in_$001 ( bypass_mux$in_$001 ),
    .clk     ( bypass_mux$clk ),
    .sel     ( bypass_mux$sel ),
    .out     ( bypass_mux$out )
  );

  // queue temporaries
  wire   [   0:0] queue$reset;
  wire   [  69:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  69:0] queue$out;

  RegEn_0x33930f124fd1d90 queue
  (
    .reset ( queue$reset ),
    .in_   ( queue$in_ ),
    .clk   ( queue$clk ),
    .en    ( queue$en ),
    .out   ( queue$out )
  );

  // signal connections
  assign bypass_mux$clk     = clk;
  assign bypass_mux$in_$000 = queue$out;
  assign bypass_mux$in_$001 = enq_bits;
  assign bypass_mux$reset   = reset;
  assign bypass_mux$sel     = bypass_mux_sel;
  assign deq_bits           = bypass_mux$out;
  assign queue$clk          = clk;
  assign queue$en           = wen;
  assign queue$in_          = enq_bits;
  assign queue$reset        = reset;



endmodule // SingleElementBypassQueueDpath_0x371fd9c705f52a7
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x63c0af18f27ae1df
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 70, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x63c0af18f27ae1df
(
  input  wire [   0:0] clk,
  input  wire [  69:0] in_$000,
  input  wire [  69:0] in_$001,
  output reg  [  69:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  69:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x63c0af18f27ae1df
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x33930f124fd1d90
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 70}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x33930f124fd1d90
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  69:0] in_,
  output reg  [  69:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x33930f124fd1d90
`default_nettype wire

//-----------------------------------------------------------------------------
// ProcCtrlPRTL_0x7240db358d36b822
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcCtrlPRTL {"reset_freeze": false}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module ProcCtrlPRTL_0x7240db358d36b822
(
  output reg  [   3:0] alu_fn_X,
  input  wire [   0:0] br_cond_eq_X,
  input  wire [   0:0] br_cond_lt_X,
  input  wire [   0:0] br_cond_ltu_X,
  input  wire [   0:0] clk,
  output reg  [   0:0] commit_inst,
  output reg  [   1:0] csrr_sel_D,
  output reg  [   2:0] dm_resp_sel_M,
  output reg  [   1:0] dmemreq_msg_len,
  output reg  [   3:0] dmemreq_msg_type,
  input  wire [   0:0] dmemreq_rdy,
  output reg  [   0:0] dmemreq_val,
  output reg  [   0:0] dmemresp_rdy,
  input  wire [   0:0] dmemresp_val,
  output reg  [   1:0] ex_result_sel_X,
  output reg  [   3:0] fpureq_msg_type,
  input  wire [   0:0] fpureq_rdy,
  output reg  [   0:0] fpureq_val,
  output reg  [   0:0] fpuresp_rdy,
  input  wire [   0:0] fpuresp_val,
  input  wire [   0:0] imemreq_rdy,
  output reg  [   0:0] imemreq_val,
  output reg  [   0:0] imemresp_drop,
  output reg  [   0:0] imemresp_rdy,
  input  wire [   0:0] imemresp_val,
  output reg  [   2:0] imm_type_D,
  input  wire [  31:0] inst_D,
  output reg  [   2:0] mdureq_msg_type,
  input  wire [   0:0] mdureq_rdy,
  output reg  [   0:0] mdureq_val,
  output reg  [   0:0] mduresp_rdy,
  input  wire [   0:0] mduresp_val,
  output reg  [   0:0] mngr2proc_rdy,
  input  wire [   0:0] mngr2proc_val,
  output reg  [   1:0] op1_byp_sel_D,
  output reg  [   0:0] op1_sel_D,
  output reg  [   1:0] op2_byp_sel_D,
  output reg  [   1:0] op2_sel_D,
  output reg  [   1:0] pc_sel_F,
  input  wire [   0:0] proc2mngr_rdy,
  output reg  [   0:0] proc2mngr_val,
  output reg  [   0:0] rd_fprf_W,
  output reg  [   0:0] reg_en_D,
  output reg  [   0:0] reg_en_F,
  output reg  [   0:0] reg_en_M,
  output reg  [   0:0] reg_en_W,
  output reg  [   0:0] reg_en_X,
  input  wire [   0:0] reset,
  output reg  [   4:0] rf_waddr_W,
  output reg  [   0:0] rf_wen_W,
  output reg  [   0:0] rs1_fprf_D,
  output reg  [   0:0] rs2_fprf_D,
  output reg  [   0:0] stats_en_wen_W,
  output reg  [   1:0] wb_result_sel_M,
  output reg  [   0:0] xcelreq_msg_type,
  input  wire [   0:0] xcelreq_rdy,
  output reg  [   0:0] xcelreq_val,
  output reg  [   0:0] xcelresp_rdy,
  input  wire [   0:0] xcelresp_val
);

  // wire declarations
  wire   [   0:0] ostall_proc2mngr_W;
  wire   [   2:0] rf_waddr_sel_D;


  // register declarations
  reg    [   3:0] alu_fn_D;
  reg    [   2:0] br_type_D;
  reg    [   2:0] br_type_X;
  reg    [  43:0] cs;
  reg    [   0:0] csrr_D;
  reg    [   0:0] csrw_D;
  reg    [   2:0] dm_resp_sel_D;
  reg    [   2:0] dm_resp_sel_X;
  reg    [   1:0] dmemreq_len_D;
  reg    [   1:0] dmemreq_len_M;
  reg    [   1:0] dmemreq_len_X;
  reg    [   3:0] dmemreq_type_D;
  reg    [   3:0] dmemreq_type_M;
  reg    [   3:0] dmemreq_type_X;
  reg    [   1:0] ex_result_sel_D;
  reg    [   3:0] fpu_D;
  reg    [   3:0] fpu_X;
  reg    [   7:0] inst__10;
  reg    [   7:0] inst_type_M;
  reg    [   7:0] inst_type_W;
  reg    [   7:0] inst_type_X;
  reg    [   0:0] inst_val_D;
  reg    [   0:0] jal_D;
  reg    [   3:0] mdu_D;
  reg    [   3:0] mdu_X;
  reg    [   0:0] mngr2proc_rdy_D;
  reg    [   0:0] next_val_D;
  reg    [   0:0] next_val_F;
  reg    [   0:0] next_val_M;
  reg    [   0:0] next_val_X;
  reg    [   0:0] osquash_D;
  reg    [   0:0] osquash_X;
  reg    [   0:0] ostall_D;
  reg    [   0:0] ostall_F;
  reg    [   0:0] ostall_M;
  reg    [   0:0] ostall_W;
  reg    [   0:0] ostall_X;
  reg    [   0:0] ostall_amo_X_rs1_D;
  reg    [   0:0] ostall_amo_X_rs2_D;
  reg    [   0:0] ostall_csrrx_X_rs1_D;
  reg    [   0:0] ostall_csrrx_X_rs2_D;
  reg    [   0:0] ostall_dmem_M;
  reg    [   0:0] ostall_dmem_X;
  reg    [   0:0] ostall_fpu_D;
  reg    [   0:0] ostall_fpu_X;
  reg    [   0:0] ostall_hazard_D;
  reg    [   0:0] ostall_ld_X_rs1_D;
  reg    [   0:0] ostall_ld_X_rs2_D;
  reg    [   0:0] ostall_mdu_D;
  reg    [   0:0] ostall_mdu_X;
  reg    [   0:0] ostall_mngr_D;
  reg    [   0:0] ostall_xcel_M;
  reg    [   0:0] ostall_xcel_X;
  reg    [   0:0] pc_redirect_D;
  reg    [   0:0] pc_redirect_X;
  reg    [   0:0] pre_stall_F;
  reg    [   0:0] proc2mngr_val_D;
  reg    [   0:0] proc2mngr_val_M;
  reg    [   0:0] proc2mngr_val_W;
  reg    [   0:0] proc2mngr_val_X;
  reg    [   0:0] rd_fprf_D;
  reg    [   0:0] rd_fprf_M;
  reg    [   0:0] rd_fprf_X;
  reg    [   4:0] rf_waddr_D;
  reg    [   4:0] rf_waddr_M;
  reg    [   4:0] rf_waddr_X;
  reg    [   0:0] rf_wen_pending_D;
  reg    [   0:0] rf_wen_pending_M;
  reg    [   0:0] rf_wen_pending_W;
  reg    [   0:0] rf_wen_pending_X;
  reg    [   0:0] rs1_en_D;
  reg    [   0:0] rs2_en_D;
  reg    [   0:0] squash_D;
  reg    [   0:0] squash_F;
  reg    [   0:0] stall_D;
  reg    [   0:0] stall_F;
  reg    [   0:0] stall_M;
  reg    [   0:0] stall_W;
  reg    [   0:0] stall_X;
  reg    [   0:0] stats_en_wen_D;
  reg    [   0:0] stats_en_wen_M;
  reg    [   0:0] stats_en_wen_X;
  reg    [   0:0] stats_en_wen_pending_W;
  reg    [   0:0] val_D;
  reg    [   0:0] val_F;
  reg    [   0:0] val_M;
  reg    [   0:0] val_W;
  reg    [   0:0] val_X;
  reg    [   1:0] wb_result_sel_D;
  reg    [   1:0] wb_result_sel_X;
  reg    [   0:0] xcelreq_D;
  reg    [   0:0] xcelreq_M;
  reg    [   0:0] xcelreq_X;
  reg    [   0:0] xcelreq_type_D;
  reg    [   0:0] xcelreq_type_X;

  // localparam declarations
  localparam ADD = 15;
  localparam ADDI = 16;
  localparam AMOADD = 47;
  localparam AMOAND = 50;
  localparam AMOMAX = 52;
  localparam AMOMAXU = 54;
  localparam AMOMIN = 51;
  localparam AMOMINU = 53;
  localparam AMOOR = 49;
  localparam AMOSWAP = 46;
  localparam AMOXOR = 48;
  localparam AND = 24;
  localparam ANDI = 25;
  localparam AUIPC = 19;
  localparam BEQ = 30;
  localparam BGE = 33;
  localparam BGEU = 35;
  localparam BLT = 32;
  localparam BLTU = 34;
  localparam BNE = 31;
  localparam CSRR = 70;
  localparam CSRRX = 73;
  localparam CSRW = 71;
  localparam CSR_COREID = 3860;
  localparam CSR_MNGR2PROC = 4032;
  localparam CSR_NUMCORES = 4033;
  localparam CSR_PROC2MNGR = 1984;
  localparam CSR_STATS_EN = 1985;
  localparam DIV = 42;
  localparam DIVU = 43;
  localparam FADDS = 57;
  localparam FCVTSW = 68;
  localparam FCVTWS = 63;
  localparam FDIVS = 60;
  localparam FEQS = 65;
  localparam FLES = 67;
  localparam FLTS = 66;
  localparam FLW = 55;
  localparam FMAXS = 62;
  localparam FMINS = 61;
  localparam FMULS = 59;
  localparam FMVWX = 69;
  localparam FMVXW = 64;
  localparam FSUBS = 58;
  localparam FSW = 56;
  localparam JAL = 36;
  localparam JALR = 37;
  localparam LB = 1;
  localparam LBU = 4;
  localparam LH = 2;
  localparam LHU = 5;
  localparam LUI = 18;
  localparam LW = 3;
  localparam MUL = 38;
  localparam MULH = 39;
  localparam MULHSU = 40;
  localparam MULHU = 41;
  localparam NOP = 0;
  localparam OR = 22;
  localparam ORI = 23;
  localparam REM = 44;
  localparam REMU = 45;
  localparam SB = 6;
  localparam SH = 7;
  localparam SLL = 9;
  localparam SLLI = 10;
  localparam SLT = 26;
  localparam SLTI = 27;
  localparam SLTIU = 29;
  localparam SLTU = 28;
  localparam SRA = 13;
  localparam SRAI = 14;
  localparam SRL = 11;
  localparam SRLI = 12;
  localparam SUB = 17;
  localparam SW = 8;
  localparam TYPE_AMO_ADD = 3;
  localparam TYPE_AMO_AND = 4;
  localparam TYPE_AMO_MAX = 9;
  localparam TYPE_AMO_MAXU = 10;
  localparam TYPE_AMO_MIN = 7;
  localparam TYPE_AMO_MINU = 8;
  localparam TYPE_AMO_OR = 5;
  localparam TYPE_AMO_SWAP = 6;
  localparam TYPE_AMO_XOR = 11;
  localparam TYPE_READ = 0;
  localparam TYPE_WRITE = 1;
  localparam XOR = 20;
  localparam XORI = 21;
  localparam alu_add = 4'd0;
  localparam alu_adz = 4'd13;
  localparam alu_and = 4'd6;
  localparam alu_cp0 = 4'd11;
  localparam alu_cp1 = 4'd12;
  localparam alu_lt = 4'd4;
  localparam alu_ltu = 4'd5;
  localparam alu_or = 4'd3;
  localparam alu_sll = 4'd2;
  localparam alu_sra = 4'd10;
  localparam alu_srl = 4'd9;
  localparam alu_sub = 4'd1;
  localparam alu_x = 4'd0;
  localparam alu_xor = 4'd7;
  localparam am_pc = 1'd1;
  localparam am_rf = 1'd0;
  localparam am_x = 1'd0;
  localparam bm_csr = 2'd2;
  localparam bm_imm = 2'd1;
  localparam bm_rf = 2'd0;
  localparam bm_x = 2'd0;
  localparam br_eq = 3'd4;
  localparam br_ge = 3'd5;
  localparam br_gu = 3'd6;
  localparam br_lt = 3'd2;
  localparam br_lu = 3'd3;
  localparam br_na = 3'd0;
  localparam br_ne = 3'd1;
  localparam br_x = 3'd0;
  localparam byp_d = 2'd0;
  localparam byp_m = 2'd2;
  localparam byp_w = 2'd3;
  localparam byp_x = 2'd1;
  localparam dm_b = 3'd0;
  localparam dm_bu = 3'd3;
  localparam dm_h = 3'd1;
  localparam dm_hu = 3'd4;
  localparam dm_w = 3'd2;
  localparam dm_x = 3'd0;
  localparam fp_add = 4'd1;
  localparam fp_ceq = 4'd8;
  localparam fp_cle = 4'd10;
  localparam fp_clt = 4'd9;
  localparam fp_div = 4'd3;
  localparam fp_f2i = 4'd7;
  localparam fp_i2f = 4'd6;
  localparam fp_max = 4'd5;
  localparam fp_min = 4'd4;
  localparam fp_mul = 4'd0;
  localparam fp_sub = 4'd2;
  localparam fp_x = 4'd15;
  localparam imm_b = 3'd2;
  localparam imm_i = 3'd0;
  localparam imm_j = 3'd4;
  localparam imm_s = 3'd1;
  localparam imm_u = 3'd3;
  localparam imm_x = 3'd0;
  localparam jalr = 3'd7;
  localparam md_div = 4'd4;
  localparam md_divu = 4'd5;
  localparam md_mh = 4'd1;
  localparam md_mhsu = 4'd2;
  localparam md_mhu = 4'd3;
  localparam md_mul = 4'd0;
  localparam md_rem = 4'd6;
  localparam md_remu = 4'd7;
  localparam md_x = 4'd8;
  localparam mem_ad = 4'd3;
  localparam mem_an = 4'd4;
  localparam mem_ld = 4'd1;
  localparam mem_mn = 4'd7;
  localparam mem_mnu = 4'd8;
  localparam mem_mx = 4'd9;
  localparam mem_mxu = 4'd10;
  localparam mem_nr = 4'd0;
  localparam mem_or = 4'd5;
  localparam mem_sp = 4'd6;
  localparam mem_st = 4'd2;
  localparam mem_xr = 4'd11;
  localparam mlen_b = 2'd1;
  localparam mlen_h = 2'd2;
  localparam mlen_w = 2'd0;
  localparam mlen_x = 2'd0;
  localparam n = 1'd0;
  localparam wm_a = 2'd0;
  localparam wm_c = 2'd2;
  localparam wm_m = 2'd1;
  localparam wm_x = 2'd0;
  localparam xm_a = 2'd0;
  localparam xm_f = 2'd3;
  localparam xm_m = 2'd1;
  localparam xm_p = 2'd2;
  localparam xm_x = 2'd0;
  localparam y = 1'd1;

  // inst_type_decoder_D temporaries
  wire   [   0:0] inst_type_decoder_D$reset;
  wire   [  31:0] inst_type_decoder_D$in_;
  wire   [   0:0] inst_type_decoder_D$clk;
  wire   [   7:0] inst_type_decoder_D$out;

  DecodeInstType_0x477004d1d8d485d1 inst_type_decoder_D
  (
    .reset ( inst_type_decoder_D$reset ),
    .in_   ( inst_type_decoder_D$in_ ),
    .clk   ( inst_type_decoder_D$clk ),
    .out   ( inst_type_decoder_D$out )
  );

  // signal connections
  assign inst_type_decoder_D$clk   = clk;
  assign inst_type_decoder_D$in_   = inst_D;
  assign inst_type_decoder_D$reset = reset;


  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def reg_F():
  //       if s.reset:
  //         s.val_F.next = 0
  //       elif s.reg_en_F:
  //         s.val_F.next = 1

  // logic for reg_F()
  always @ (posedge clk) begin
    if (reset) begin
      val_F <= 0;
    end
    else begin
      if (reg_en_F) begin
        val_F <= 1;
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def reg_D():
  //       if s.reset:
  //         s.val_D.next = 0
  //       elif s.reg_en_D:
  //         s.val_D.next = s.next_val_F

  // logic for reg_D()
  always @ (posedge clk) begin
    if (reset) begin
      val_D <= 0;
    end
    else begin
      if (reg_en_D) begin
        val_D <= next_val_F;
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def reg_X():
  //       if s.reset:
  //         s.val_X.next            = 0
  //         s.stats_en_wen_X.next   = 0
  //       elif s.reg_en_X:
  //         s.val_X.next            = s.next_val_D
  //         if s.next_val_D:
  //           s.rf_wen_pending_X.next = s.rf_wen_pending_D
  //           s.inst_type_X.next      = s.inst_type_decoder_D.out
  //           s.alu_fn_X.next         = s.alu_fn_D
  //           s.rf_waddr_X.next       = s.rf_waddr_D
  //           s.proc2mngr_val_X.next  = s.proc2mngr_val_D
  //           s.dmemreq_type_X.next   = s.dmemreq_type_D
  //           s.dmemreq_len_X.next    = s.dmemreq_len_D
  //           s.dm_resp_sel_X.next    = s.dm_resp_sel_D
  //           s.wb_result_sel_X.next  = s.wb_result_sel_D
  //           s.stats_en_wen_X.next   = s.stats_en_wen_D
  //           s.br_type_X.next        = s.br_type_D
  //           s.mdu_X.next            = s.mdu_D
  //           s.fpu_X.next            = s.fpu_D
  //           s.rd_fprf_X.next        = s.rd_fprf_D
  //           s.ex_result_sel_X.next  = s.ex_result_sel_D
  //           s.xcelreq_X.next        = s.xcelreq_D
  //           s.xcelreq_type_X.next   = s.xcelreq_type_D

  // logic for reg_X()
  always @ (posedge clk) begin
    if (reset) begin
      val_X <= 0;
      stats_en_wen_X <= 0;
    end
    else begin
      if (reg_en_X) begin
        val_X <= next_val_D;
        if (next_val_D) begin
          rf_wen_pending_X <= rf_wen_pending_D;
          inst_type_X <= inst_type_decoder_D$out;
          alu_fn_X <= alu_fn_D;
          rf_waddr_X <= rf_waddr_D;
          proc2mngr_val_X <= proc2mngr_val_D;
          dmemreq_type_X <= dmemreq_type_D;
          dmemreq_len_X <= dmemreq_len_D;
          dm_resp_sel_X <= dm_resp_sel_D;
          wb_result_sel_X <= wb_result_sel_D;
          stats_en_wen_X <= stats_en_wen_D;
          br_type_X <= br_type_D;
          mdu_X <= mdu_D;
          fpu_X <= fpu_D;
          rd_fprf_X <= rd_fprf_D;
          ex_result_sel_X <= ex_result_sel_D;
          xcelreq_X <= xcelreq_D;
          xcelreq_type_X <= xcelreq_type_D;
        end
        else begin
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def reg_M():
  //       if s.reset:
  //         s.val_M.next            = 0
  //         s.stats_en_wen_M.next   = 0
  //       elif s.reg_en_M:
  //         s.val_M.next            = s.next_val_X
  //         if s.next_val_X:
  //           s.rf_wen_pending_M.next = s.rf_wen_pending_X
  //           s.inst_type_M.next      = s.inst_type_X
  //           s.rf_waddr_M.next       = s.rf_waddr_X
  //           s.proc2mngr_val_M.next  = s.proc2mngr_val_X
  //           s.dmemreq_type_M.next   = s.dmemreq_type_X
  //           s.dmemreq_len_M.next    = s.dmemreq_len_X
  //           s.dm_resp_sel_M.next    = s.dm_resp_sel_X
  //           s.wb_result_sel_M.next  = s.wb_result_sel_X
  //           s.rd_fprf_M.next        = s.rd_fprf_X
  //           s.stats_en_wen_M.next   = s.stats_en_wen_X
  //           # xcel
  //           s.xcelreq_M.next        = s.xcelreq_X

  // logic for reg_M()
  always @ (posedge clk) begin
    if (reset) begin
      val_M <= 0;
      stats_en_wen_M <= 0;
    end
    else begin
      if (reg_en_M) begin
        val_M <= next_val_X;
        if (next_val_X) begin
          rf_wen_pending_M <= rf_wen_pending_X;
          inst_type_M <= inst_type_X;
          rf_waddr_M <= rf_waddr_X;
          proc2mngr_val_M <= proc2mngr_val_X;
          dmemreq_type_M <= dmemreq_type_X;
          dmemreq_len_M <= dmemreq_len_X;
          dm_resp_sel_M <= dm_resp_sel_X;
          wb_result_sel_M <= wb_result_sel_X;
          rd_fprf_M <= rd_fprf_X;
          stats_en_wen_M <= stats_en_wen_X;
          xcelreq_M <= xcelreq_X;
        end
        else begin
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def reg_W():
  //
  //       if s.reset:
  //         s.val_W.next            = 0
  //         s.stats_en_wen_pending_W.next   = 0
  //       elif s.reg_en_W:
  //         s.val_W.next                  = s.next_val_M
  //         if s.next_val_M:
  //           s.rf_wen_pending_W.next       = s.rf_wen_pending_M
  //           s.inst_type_W.next            = s.inst_type_M
  //           s.rf_waddr_W.next             = s.rf_waddr_M
  //           s.proc2mngr_val_W.next        = s.proc2mngr_val_M
  //           s.rd_fprf_W.next              = s.rd_fprf_M
  //           s.stats_en_wen_pending_W.next = s.stats_en_wen_M

  // logic for reg_W()
  always @ (posedge clk) begin
    if (reset) begin
      val_W <= 0;
      stats_en_wen_pending_W <= 0;
    end
    else begin
      if (reg_en_W) begin
        val_W <= next_val_M;
        if (next_val_M) begin
          rf_wen_pending_W <= rf_wen_pending_M;
          inst_type_W <= inst_type_M;
          rf_waddr_W <= rf_waddr_M;
          proc2mngr_val_W <= proc2mngr_val_M;
          rd_fprf_W <= rd_fprf_M;
          stats_en_wen_pending_W <= stats_en_wen_M;
        end
        else begin
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_reg_en_F():
  //       s.reg_en_F.value = ~s.stall_F | s.squash_F

  // logic for comb_reg_en_F()
  always @ (*) begin
    reg_en_F = (~stall_F|squash_F);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_PC_sel_F():
  //       if   s.pc_redirect_X:
  //
  //         if s.br_type_X == jalr:
  //           s.pc_sel_F.value = 3 # jalr target from ALU
  //         else:
  //           s.pc_sel_F.value = 1 # branch target
  //
  //       elif s.pc_redirect_D:
  //         s.pc_sel_F.value = 2 # use jal target
  //       else:
  //         s.pc_sel_F.value = 0 # use pc+4

  // logic for comb_PC_sel_F()
  always @ (*) begin
    if (pc_redirect_X) begin
      if ((br_type_X == jalr)) begin
        pc_sel_F = 3;
      end
      else begin
        pc_sel_F = 1;
      end
    end
    else begin
      if (pc_redirect_D) begin
        pc_sel_F = 2;
      end
      else begin
        pc_sel_F = 0;
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_freeze_F():
  //           s.stall_F.value = s.pre_stall_F

  // logic for comb_freeze_F()
  always @ (*) begin
    stall_F = pre_stall_F;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_F():
  //       # ostall due to imemresp
  //
  //       s.ostall_F.value      = s.val_F & ~s.imemresp_val
  //
  //       # stall and squash in F stage
  //
  //       s.pre_stall_F.value   = s.val_F & ( s.ostall_F  | s.ostall_D |
  //                                           s.ostall_X  | s.ostall_M |
  //                                           s.ostall_W                 )
  //
  //       s.squash_F.value      = s.val_F & ( s.osquash_D | s.osquash_X  )
  //
  //       # imem req is special, it actually be sent out _before_ the F
  //       # stage, we need to send memreq everytime we are getting squashed
  //       # because we need to redirect the PC. We also need to factor in
  //       # reset. When we are resetting we shouldn't send out imem req.
  //
  //       s.imemreq_val.value   =  ~s.reset & (~s.stall_F | s.squash_F)
  //       s.imemresp_rdy.value  =  ~s.stall_F | s.squash_F
  //
  //       # We drop the mem response when we are getting squashed
  //
  //       s.imemresp_drop.value = s.squash_F
  //
  //       s.next_val_F.value    = s.val_F & ~s.stall_F & ~s.squash_F

  // logic for comb_F()
  always @ (*) begin
    ostall_F = (val_F&~imemresp_val);
    pre_stall_F = (val_F&((((ostall_F|ostall_D)|ostall_X)|ostall_M)|ostall_W));
    squash_F = (val_F&(osquash_D|osquash_X));
    imemreq_val = (~reset&(~stall_F|squash_F));
    imemresp_rdy = (~stall_F|squash_F);
    imemresp_drop = squash_F;
    next_val_F = ((val_F&~stall_F)&~squash_F);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_reg_en_D():
  //       s.reg_en_D.value = ~s.stall_D | s.squash_D

  // logic for comb_reg_en_D()
  always @ (*) begin
    reg_en_D = (~stall_D|squash_D);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_control_table_D():
  //       inst = s.inst_type_decoder_D.out.value
  //       #                                         rd r1 r2  fpu        br    jal op1   rs1 imm    op2    rs2 alu      dmm      dmm     xres  dmmux  wbmux rf  rv32m    cs cs
  //       #                                         fp fp fp  type   val type   D  muxsel en type   muxsel  en fn       typ      len     sel   sel    sel   wen          rr rw
  //       if   inst == NOP    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_x,  n, imm_x, bm_x,   n, alu_x,   mem_nr,  mlen_x, xm_x, dm_x,  wm_a, n,  md_x,    n, n )
  //       # RV32I
  //       # xcel/csrr/csrw
  //       elif inst == CSRRX  : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_x,  n, imm_i, bm_imm, n, alu_cp1, mem_nr,  mlen_x, xm_a, dm_x,  wm_c, y,  md_x,    y, n )
  //       elif inst == CSRR   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_x,  n, imm_i, bm_csr, n, alu_cp1, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    y, n )
  //       elif inst == CSRW   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_cp0, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, n,  md_x,    n, y )
  //       # reg-reg
  //       elif inst == ADD    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_add, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SUB    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sub, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == AND    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_and, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == OR     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_or , mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == XOR    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_xor, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLT    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_lt , mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLTU   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_ltu, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SRA    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sra, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SRL    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_srl, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLL    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sll, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       # reg-imm
  //       elif inst == ADDI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == ANDI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_and, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == ORI    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_or , mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == XORI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_xor, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLTI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_lt , mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLTIU  : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_ltu, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SRAI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_sra, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SRLI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_srl, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == SLLI   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_sll, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == LUI    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_x,  n, imm_u, bm_imm, n, alu_cp1, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == AUIPC  : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_pc, n, imm_u, bm_imm, n, alu_add, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       # branch
  //       elif inst == BNE    : s.cs.value = concat( n, n, n, fp_x,   y, br_ne, n, am_rf, y, imm_b, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       elif inst == BEQ    : s.cs.value = concat( n, n, n, fp_x,   y, br_eq, n, am_rf, y, imm_b, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       elif inst == BLT    : s.cs.value = concat( n, n, n, fp_x,   y, br_lt, n, am_rf, y, imm_b, bm_rf,  y, alu_lt,  mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       elif inst == BLTU   : s.cs.value = concat( n, n, n, fp_x,   y, br_lu, n, am_rf, y, imm_b, bm_rf,  y, alu_ltu, mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       elif inst == BGE    : s.cs.value = concat( n, n, n, fp_x,   y, br_ge, n, am_rf, y, imm_b, bm_rf,  y, alu_lt,  mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       elif inst == BGEU   : s.cs.value = concat( n, n, n, fp_x,   y, br_gu, n, am_rf, y, imm_b, bm_rf,  y, alu_ltu, mem_nr,  mlen_x, xm_a, dm_x,  wm_x, n,  md_x,    n, n )
  //       # jump
  //       elif inst == JAL    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, y, am_x,  n, imm_j, bm_x,   n, alu_x,   mem_nr,  mlen_x, xm_p, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == JALR   : s.cs.value = concat( n, n, n, fp_x,   y, jalr , n, am_rf, y, imm_i, bm_imm, n, alu_adz, mem_nr,  mlen_x, xm_p, dm_x,  wm_a, y,  md_x,    n, n )
  //       # mem
  //       elif inst == LB     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_b, xm_a, dm_b,  wm_m, y,  md_x,    n, n )
  //       elif inst == LH     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_h, xm_a, dm_h,  wm_m, y,  md_x,    n, n )
  //       elif inst == LW     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == LBU    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_b, xm_a, dm_bu, wm_m, y,  md_x,    n, n )
  //       elif inst == LHU    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_h, xm_a, dm_hu, wm_m, y,  md_x,    n, n )
  //       elif inst == SB     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_s, bm_imm, y, alu_add, mem_st,  mlen_b, xm_a, dm_x,  wm_m, n,  md_x,    n, n )
  //       elif inst == SH     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_s, bm_imm, y, alu_add, mem_st,  mlen_h, xm_a, dm_x,  wm_m, n,  md_x,    n, n )
  //       elif inst == SW     : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_s, bm_imm, y, alu_add, mem_st,  mlen_w, xm_a, dm_x,  wm_m, n,  md_x,    n, n )
  //       # RV32A
  //       elif inst == AMOADD : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_ad,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOAND : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_an,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOOR  : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_or,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOSWAP: s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_sp,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOMIN : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_mn,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOMINU: s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_mnu, mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOMAX : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_mx,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOMAXU: s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_mxu, mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == AMOXOR : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_cp0, mem_xr,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       # RV32M
  //       elif inst == MUL    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_mul,  n, n )
  //       elif inst == MULH   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_mh,   n, n )
  //       elif inst == MULHSU : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_mhsu, n, n )
  //       elif inst == MULHU  : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_mhu,  n, n )
  //       elif inst == DIV    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_div,  n, n )
  //       elif inst == DIVU   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_divu, n, n )
  //       elif inst == REM    : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_rem,  n, n )
  //       elif inst == REMU   : s.cs.value = concat( n, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_m, dm_x,  wm_a, y,  md_remu, n, n )
  //       # RV32F
  //       #                                         rd r1 r2  fpu        br    jal op1   rs1 imm    op2    rs2 alu      dmm      dmm     xres  dmmux  wbmux rf  rv32m    cs cs
  //       #                                         fp fp fp  type   val type   D  muxsel en type   muxsel  en fn       typ      len     sel   sel    sel   wen          rr rw
  //       elif inst == FLW    : s.cs.value = concat( y, n, n, fp_x,   y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, mem_ld,  mlen_w, xm_a, dm_w,  wm_m, y,  md_x,    n, n )
  //       elif inst == FSW    : s.cs.value = concat( n, n, y, fp_x,   y, br_na, n, am_rf, y, imm_s, bm_imm, y, alu_add, mem_st,  mlen_w, xm_a, dm_x,  wm_m, n,  md_x,    n, n )
  //       elif inst == FADDS  : s.cs.value = concat( y, y, y, fp_add, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FSUBS  : s.cs.value = concat( y, y, y, fp_sub, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FMULS  : s.cs.value = concat( y, y, y, fp_mul, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FDIVS  : s.cs.value = concat( y, y, y, fp_div, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FMINS  : s.cs.value = concat( y, y, y, fp_min, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FMAXS  : s.cs.value = concat( y, y, y, fp_max, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FCVTWS : s.cs.value = concat( n, y, n, fp_f2i, y, br_na, n, am_rf, y, imm_x, bm_rf,  n, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FMVXW  : s.cs.value = concat( n, y, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  n, alu_cp0, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FEQS   : s.cs.value = concat( n, y, y, fp_ceq, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FLTS   : s.cs.value = concat( n, y, y, fp_clt, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FLES   : s.cs.value = concat( n, y, y, fp_cle, y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FCVTSW : s.cs.value = concat( y, n, n, fp_i2f, y, br_na, n, am_rf, y, imm_x, bm_rf,  n, alu_x,   mem_nr,  mlen_x, xm_f, dm_x,  wm_a, y,  md_x,    n, n )
  //       elif inst == FMVWX  : s.cs.value = concat( y, n, n, fp_x,   y, br_na, n, am_rf, y, imm_x, bm_rf,  n, alu_cp0, mem_nr,  mlen_x, xm_a, dm_x,  wm_a, y,  md_x,    n, n )
  //       else:                 s.cs.value = concat( n, n, n, fp_x,   n, br_x,  n, am_x,  n, imm_x, bm_x,   n, alu_x,   mem_nr,  mlen_x, xm_x, dm_x,  wm_x, n,  md_x,    n, n )
  //
  //       s.rd_fprf_D.value        = s.cs[43:44]
  //       s.rs1_fprf_D.value       = s.cs[42:43]
  //       s.rs2_fprf_D.value       = s.cs[41:42]
  //       s.fpu_D.value            = s.cs[37:41]
  //       s.inst_val_D.value       = s.cs[36:37]
  //       s.br_type_D.value        = s.cs[33:36]
  //       s.jal_D.value            = s.cs[32:33]
  //       s.op1_sel_D.value        = s.cs[31:32]
  //       s.rs1_en_D.value         = s.cs[30:31]
  //       s.imm_type_D.value       = s.cs[27:30]
  //       s.op2_sel_D.value        = s.cs[25:27]
  //       s.rs2_en_D.value         = s.cs[24:25]
  //       s.alu_fn_D.value         = s.cs[20:24]
  //       s.dmemreq_type_D.value   = s.cs[16:20]
  //       s.dmemreq_len_D.value    = s.cs[14:16]
  //       s.ex_result_sel_D.value  = s.cs[12:14]
  //       s.dm_resp_sel_D.value    = s.cs[9:12]
  //       s.wb_result_sel_D.value  = s.cs[7:9]
  //       s.rf_wen_pending_D.value = s.cs[6:7]
  //       s.mdu_D.value            = s.cs[2:6]
  //       s.csrr_D.value           = s.cs[1:2]
  //       s.csrw_D.value           = s.cs[0:1]
  //
  //       # setting the actual write address
  //
  //       s.rf_waddr_D.value = s.inst_D[RD]
  //
  //       # csrr/csrw logic
  //
  //       s.csrr_sel_D.value      = 0
  //       s.xcelreq_type_D.value  = 0
  //       s.xcelreq_D.value       = 0
  //       s.mngr2proc_rdy_D.value = 0
  //       s.proc2mngr_val_D.value = 0
  //       s.stats_en_wen_D.value  = 0
  //
  //       if s.csrr_D:
  //         if   s.inst_D[CSRNUM] == CSR_NUMCORES:
  //           s.csrr_sel_D.value = 1
  //         elif s.inst_D[CSRNUM] == CSR_COREID:
  //           s.csrr_sel_D.value = 2
  //         elif s.inst_D[CSRNUM] == CSR_MNGR2PROC:
  //           s.mngr2proc_rdy_D.value = 1
  //
  //         else:
  //           # FIXME
  //           s.xcelreq_type_D.value = XcelReqMsg.TYPE_READ
  //           s.xcelreq_D.value = 1
  //
  //       if s.csrw_D:
  //         if   s.inst_D[CSRNUM] == CSR_PROC2MNGR:
  //           s.proc2mngr_val_D.value = 1
  //         elif s.inst_D[CSRNUM] == CSR_STATS_EN:
  //           s.stats_en_wen_D.value = 1
  //
  //         # In this case we handle accelerator registers requests.
  //         else:
  //           # FIXME
  //           s.xcelreq_type_D.value = XcelReqMsg.TYPE_WRITE
  //           s.xcelreq_D.value = 1

  // logic for comb_control_table_D()
  always @ (*) begin
    inst__10 = inst_type_decoder_D$out;
    if ((inst__10 == NOP)) begin
      cs = { n,n,n,fp_x,y,br_na,n,am_x,n,imm_x,bm_x,n,alu_x,mem_nr,mlen_x,xm_x,dm_x,wm_a,n,md_x,n,n };
    end
    else begin
      if ((inst__10 == CSRRX)) begin
        cs = { n,n,n,fp_x,y,br_na,n,am_x,n,imm_i,bm_imm,n,alu_cp1,mem_nr,mlen_x,xm_a,dm_x,wm_c,y,md_x,y,n };
      end
      else begin
        if ((inst__10 == CSRR)) begin
          cs = { n,n,n,fp_x,y,br_na,n,am_x,n,imm_i,bm_csr,n,alu_cp1,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,y,n };
        end
        else begin
          if ((inst__10 == CSRW)) begin
            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_cp0,mem_nr,mlen_x,xm_a,dm_x,wm_a,n,md_x,n,y };
          end
          else begin
            if ((inst__10 == ADD)) begin
              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_add,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
            end
            else begin
              if ((inst__10 == SUB)) begin
                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sub,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
              end
              else begin
                if ((inst__10 == AND)) begin
                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_and,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                end
                else begin
                  if ((inst__10 == OR)) begin
                    cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_or,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                  end
                  else begin
                    if ((inst__10 == XOR)) begin
                      cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_xor,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                    end
                    else begin
                      if ((inst__10 == SLT)) begin
                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_lt,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                      end
                      else begin
                        if ((inst__10 == SLTU)) begin
                          cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_ltu,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                        end
                        else begin
                          if ((inst__10 == SRA)) begin
                            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sra,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                          end
                          else begin
                            if ((inst__10 == SRL)) begin
                              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_srl,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                            end
                            else begin
                              if ((inst__10 == SLL)) begin
                                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sll,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                              end
                              else begin
                                if ((inst__10 == ADDI)) begin
                                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                end
                                else begin
                                  if ((inst__10 == ANDI)) begin
                                    cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_and,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                  end
                                  else begin
                                    if ((inst__10 == ORI)) begin
                                      cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_or,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                    end
                                    else begin
                                      if ((inst__10 == XORI)) begin
                                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_xor,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                      end
                                      else begin
                                        if ((inst__10 == SLTI)) begin
                                          cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_lt,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                        end
                                        else begin
                                          if ((inst__10 == SLTIU)) begin
                                            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_ltu,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                          end
                                          else begin
                                            if ((inst__10 == SRAI)) begin
                                              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_sra,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                            end
                                            else begin
                                              if ((inst__10 == SRLI)) begin
                                                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_srl,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                              end
                                              else begin
                                                if ((inst__10 == SLLI)) begin
                                                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_sll,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                                end
                                                else begin
                                                  if ((inst__10 == LUI)) begin
                                                    cs = { n,n,n,fp_x,y,br_na,n,am_x,n,imm_u,bm_imm,n,alu_cp1,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                                  end
                                                  else begin
                                                    if ((inst__10 == AUIPC)) begin
                                                      cs = { n,n,n,fp_x,y,br_na,n,am_pc,n,imm_u,bm_imm,n,alu_add,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                                    end
                                                    else begin
                                                      if ((inst__10 == BNE)) begin
                                                        cs = { n,n,n,fp_x,y,br_ne,n,am_rf,y,imm_b,bm_rf,y,alu_x,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                      end
                                                      else begin
                                                        if ((inst__10 == BEQ)) begin
                                                          cs = { n,n,n,fp_x,y,br_eq,n,am_rf,y,imm_b,bm_rf,y,alu_x,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                        end
                                                        else begin
                                                          if ((inst__10 == BLT)) begin
                                                            cs = { n,n,n,fp_x,y,br_lt,n,am_rf,y,imm_b,bm_rf,y,alu_lt,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                          end
                                                          else begin
                                                            if ((inst__10 == BLTU)) begin
                                                              cs = { n,n,n,fp_x,y,br_lu,n,am_rf,y,imm_b,bm_rf,y,alu_ltu,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                            end
                                                            else begin
                                                              if ((inst__10 == BGE)) begin
                                                                cs = { n,n,n,fp_x,y,br_ge,n,am_rf,y,imm_b,bm_rf,y,alu_lt,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                              end
                                                              else begin
                                                                if ((inst__10 == BGEU)) begin
                                                                  cs = { n,n,n,fp_x,y,br_gu,n,am_rf,y,imm_b,bm_rf,y,alu_ltu,mem_nr,mlen_x,xm_a,dm_x,wm_x,n,md_x,n,n };
                                                                end
                                                                else begin
                                                                  if ((inst__10 == JAL)) begin
                                                                    cs = { n,n,n,fp_x,y,br_na,y,am_x,n,imm_j,bm_x,n,alu_x,mem_nr,mlen_x,xm_p,dm_x,wm_a,y,md_x,n,n };
                                                                  end
                                                                  else begin
                                                                    if ((inst__10 == JALR)) begin
                                                                      cs = { n,n,n,fp_x,y,jalr,n,am_rf,y,imm_i,bm_imm,n,alu_adz,mem_nr,mlen_x,xm_p,dm_x,wm_a,y,md_x,n,n };
                                                                    end
                                                                    else begin
                                                                      if ((inst__10 == LB)) begin
                                                                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_b,xm_a,dm_b,wm_m,y,md_x,n,n };
                                                                      end
                                                                      else begin
                                                                        if ((inst__10 == LH)) begin
                                                                          cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_h,xm_a,dm_h,wm_m,y,md_x,n,n };
                                                                        end
                                                                        else begin
                                                                          if ((inst__10 == LW)) begin
                                                                            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                          end
                                                                          else begin
                                                                            if ((inst__10 == LBU)) begin
                                                                              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_b,xm_a,dm_bu,wm_m,y,md_x,n,n };
                                                                            end
                                                                            else begin
                                                                              if ((inst__10 == LHU)) begin
                                                                                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_h,xm_a,dm_hu,wm_m,y,md_x,n,n };
                                                                              end
                                                                              else begin
                                                                                if ((inst__10 == SB)) begin
                                                                                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_s,bm_imm,y,alu_add,mem_st,mlen_b,xm_a,dm_x,wm_m,n,md_x,n,n };
                                                                                end
                                                                                else begin
                                                                                  if ((inst__10 == SH)) begin
                                                                                    cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_s,bm_imm,y,alu_add,mem_st,mlen_h,xm_a,dm_x,wm_m,n,md_x,n,n };
                                                                                  end
                                                                                  else begin
                                                                                    if ((inst__10 == SW)) begin
                                                                                      cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_s,bm_imm,y,alu_add,mem_st,mlen_w,xm_a,dm_x,wm_m,n,md_x,n,n };
                                                                                    end
                                                                                    else begin
                                                                                      if ((inst__10 == AMOADD)) begin
                                                                                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_ad,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                      end
                                                                                      else begin
                                                                                        if ((inst__10 == AMOAND)) begin
                                                                                          cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_an,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                        end
                                                                                        else begin
                                                                                          if ((inst__10 == AMOOR)) begin
                                                                                            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_or,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                          end
                                                                                          else begin
                                                                                            if ((inst__10 == AMOSWAP)) begin
                                                                                              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_sp,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                            end
                                                                                            else begin
                                                                                              if ((inst__10 == AMOMIN)) begin
                                                                                                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_mn,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                              end
                                                                                              else begin
                                                                                                if ((inst__10 == AMOMINU)) begin
                                                                                                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_mnu,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                                end
                                                                                                else begin
                                                                                                  if ((inst__10 == AMOMAX)) begin
                                                                                                    cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_mx,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                                  end
                                                                                                  else begin
                                                                                                    if ((inst__10 == AMOMAXU)) begin
                                                                                                      cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_mxu,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                                    end
                                                                                                    else begin
                                                                                                      if ((inst__10 == AMOXOR)) begin
                                                                                                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_cp0,mem_xr,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                                      end
                                                                                                      else begin
                                                                                                        if ((inst__10 == MUL)) begin
                                                                                                          cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_mul,n,n };
                                                                                                        end
                                                                                                        else begin
                                                                                                          if ((inst__10 == MULH)) begin
                                                                                                            cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_mh,n,n };
                                                                                                          end
                                                                                                          else begin
                                                                                                            if ((inst__10 == MULHSU)) begin
                                                                                                              cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_mhsu,n,n };
                                                                                                            end
                                                                                                            else begin
                                                                                                              if ((inst__10 == MULHU)) begin
                                                                                                                cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_mhu,n,n };
                                                                                                              end
                                                                                                              else begin
                                                                                                                if ((inst__10 == DIV)) begin
                                                                                                                  cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_div,n,n };
                                                                                                                end
                                                                                                                else begin
                                                                                                                  if ((inst__10 == DIVU)) begin
                                                                                                                    cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_divu,n,n };
                                                                                                                  end
                                                                                                                  else begin
                                                                                                                    if ((inst__10 == REM)) begin
                                                                                                                      cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_rem,n,n };
                                                                                                                    end
                                                                                                                    else begin
                                                                                                                      if ((inst__10 == REMU)) begin
                                                                                                                        cs = { n,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_m,dm_x,wm_a,y,md_remu,n,n };
                                                                                                                      end
                                                                                                                      else begin
                                                                                                                        if ((inst__10 == FLW)) begin
                                                                                                                          cs = { y,n,n,fp_x,y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,mem_ld,mlen_w,xm_a,dm_w,wm_m,y,md_x,n,n };
                                                                                                                        end
                                                                                                                        else begin
                                                                                                                          if ((inst__10 == FSW)) begin
                                                                                                                            cs = { n,n,y,fp_x,y,br_na,n,am_rf,y,imm_s,bm_imm,y,alu_add,mem_st,mlen_w,xm_a,dm_x,wm_m,n,md_x,n,n };
                                                                                                                          end
                                                                                                                          else begin
                                                                                                                            if ((inst__10 == FADDS)) begin
                                                                                                                              cs = { y,y,y,fp_add,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                            end
                                                                                                                            else begin
                                                                                                                              if ((inst__10 == FSUBS)) begin
                                                                                                                                cs = { y,y,y,fp_sub,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                              end
                                                                                                                              else begin
                                                                                                                                if ((inst__10 == FMULS)) begin
                                                                                                                                  cs = { y,y,y,fp_mul,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                end
                                                                                                                                else begin
                                                                                                                                  if ((inst__10 == FDIVS)) begin
                                                                                                                                    cs = { y,y,y,fp_div,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                  end
                                                                                                                                  else begin
                                                                                                                                    if ((inst__10 == FMINS)) begin
                                                                                                                                      cs = { y,y,y,fp_min,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                    end
                                                                                                                                    else begin
                                                                                                                                      if ((inst__10 == FMAXS)) begin
                                                                                                                                        cs = { y,y,y,fp_max,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                      end
                                                                                                                                      else begin
                                                                                                                                        if ((inst__10 == FCVTWS)) begin
                                                                                                                                          cs = { n,y,n,fp_f2i,y,br_na,n,am_rf,y,imm_x,bm_rf,n,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                        end
                                                                                                                                        else begin
                                                                                                                                          if ((inst__10 == FMVXW)) begin
                                                                                                                                            cs = { n,y,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,n,alu_cp0,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                          end
                                                                                                                                          else begin
                                                                                                                                            if ((inst__10 == FEQS)) begin
                                                                                                                                              cs = { n,y,y,fp_ceq,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                            end
                                                                                                                                            else begin
                                                                                                                                              if ((inst__10 == FLTS)) begin
                                                                                                                                                cs = { n,y,y,fp_clt,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                              end
                                                                                                                                              else begin
                                                                                                                                                if ((inst__10 == FLES)) begin
                                                                                                                                                  cs = { n,y,y,fp_cle,y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                                end
                                                                                                                                                else begin
                                                                                                                                                  if ((inst__10 == FCVTSW)) begin
                                                                                                                                                    cs = { y,n,n,fp_i2f,y,br_na,n,am_rf,y,imm_x,bm_rf,n,alu_x,mem_nr,mlen_x,xm_f,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                                  end
                                                                                                                                                  else begin
                                                                                                                                                    if ((inst__10 == FMVWX)) begin
                                                                                                                                                      cs = { y,n,n,fp_x,y,br_na,n,am_rf,y,imm_x,bm_rf,n,alu_cp0,mem_nr,mlen_x,xm_a,dm_x,wm_a,y,md_x,n,n };
                                                                                                                                                    end
                                                                                                                                                    else begin
                                                                                                                                                      cs = { n,n,n,fp_x,n,br_x,n,am_x,n,imm_x,bm_x,n,alu_x,mem_nr,mlen_x,xm_x,dm_x,wm_x,n,md_x,n,n };
                                                                                                                                                    end
                                                                                                                                                  end
                                                                                                                                                end
                                                                                                                                              end
                                                                                                                                            end
                                                                                                                                          end
                                                                                                                                        end
                                                                                                                                      end
                                                                                                                                    end
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    rd_fprf_D = cs[(44)-1:43];
    rs1_fprf_D = cs[(43)-1:42];
    rs2_fprf_D = cs[(42)-1:41];
    fpu_D = cs[(41)-1:37];
    inst_val_D = cs[(37)-1:36];
    br_type_D = cs[(36)-1:33];
    jal_D = cs[(33)-1:32];
    op1_sel_D = cs[(32)-1:31];
    rs1_en_D = cs[(31)-1:30];
    imm_type_D = cs[(30)-1:27];
    op2_sel_D = cs[(27)-1:25];
    rs2_en_D = cs[(25)-1:24];
    alu_fn_D = cs[(24)-1:20];
    dmemreq_type_D = cs[(20)-1:16];
    dmemreq_len_D = cs[(16)-1:14];
    ex_result_sel_D = cs[(14)-1:12];
    dm_resp_sel_D = cs[(12)-1:9];
    wb_result_sel_D = cs[(9)-1:7];
    rf_wen_pending_D = cs[(7)-1:6];
    mdu_D = cs[(6)-1:2];
    csrr_D = cs[(2)-1:1];
    csrw_D = cs[(1)-1:0];
    rf_waddr_D = inst_D[(12)-1:7];
    csrr_sel_D = 0;
    xcelreq_type_D = 0;
    xcelreq_D = 0;
    mngr2proc_rdy_D = 0;
    proc2mngr_val_D = 0;
    stats_en_wen_D = 0;
    if (csrr_D) begin
      if ((inst_D[(32)-1:20] == CSR_NUMCORES)) begin
        csrr_sel_D = 1;
      end
      else begin
        if ((inst_D[(32)-1:20] == CSR_COREID)) begin
          csrr_sel_D = 2;
        end
        else begin
          if ((inst_D[(32)-1:20] == CSR_MNGR2PROC)) begin
            mngr2proc_rdy_D = 1;
          end
          else begin
            xcelreq_type_D = TYPE_READ;
            xcelreq_D = 1;
          end
        end
      end
    end
    else begin
    end
    if (csrw_D) begin
      if ((inst_D[(32)-1:20] == CSR_PROC2MNGR)) begin
        proc2mngr_val_D = 1;
      end
      else begin
        if ((inst_D[(32)-1:20] == CSR_STATS_EN)) begin
          stats_en_wen_D = 1;
        end
        else begin
          xcelreq_type_D = TYPE_WRITE;
          xcelreq_D = 1;
        end
      end
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_jump_D():
  //
  //       if s.val_D and s.jal_D:
  //         s.pc_redirect_D.value = 1
  //       else:
  //         s.pc_redirect_D.value = 0

  // logic for comb_jump_D()
  always @ (*) begin
    if ((val_D&&jal_D)) begin
      pc_redirect_D = 1;
    end
    else begin
      pc_redirect_D = 0;
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_bypass_D():
  //
  //       s.op1_byp_sel_D.value = byp_d
  //
  //       if s.rs1_en_D:
  //
  //         if   s.val_X & ( s.inst_D[ RS1 ] == s.rf_waddr_X ) \
  //                      & ( s.rs1_fprf_D | s.rf_waddr_X != 0 ) \
  //                      & ( s.rs1_fprf_D == s.rd_fprf_X ) \
  //                      & s.rf_wen_pending_X:    s.op1_byp_sel_D.value = byp_x
  //         elif s.val_M & ( s.inst_D[ RS1 ] == s.rf_waddr_M ) \
  //                      & ( s.rs1_fprf_D | s.rf_waddr_M != 0 ) \
  //                      & ( s.rs1_fprf_D == s.rd_fprf_M ) \
  //                      & s.rf_wen_pending_M:    s.op1_byp_sel_D.value = byp_m
  //         elif s.val_W & ( s.inst_D[ RS1 ] == s.rf_waddr_W ) \
  //                      & ( s.rs1_fprf_D | s.rf_waddr_W != 0 ) \
  //                      & ( s.rs1_fprf_D == s.rd_fprf_W ) \
  //                      & s.rf_wen_pending_W:    s.op1_byp_sel_D.value = byp_w
  //
  //       s.op2_byp_sel_D.value = byp_d
  //
  //       if s.rs2_en_D:
  //
  //         if   s.val_X & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) \
  //                      & ( s.rs2_fprf_D | s.rf_waddr_X != 0 ) \
  //                      & ( s.rs2_fprf_D == s.rd_fprf_X ) \
  //                      & s.rf_wen_pending_X:    s.op2_byp_sel_D.value = byp_x
  //         elif s.val_M & ( s.inst_D[ RS2 ] == s.rf_waddr_M ) \
  //                      & ( s.rs2_fprf_D | s.rf_waddr_M != 0 ) \
  //                      & ( s.rs2_fprf_D == s.rd_fprf_M ) \
  //                      & s.rf_wen_pending_M:    s.op2_byp_sel_D.value = byp_m
  //         elif s.val_W & ( s.inst_D[ RS2 ] == s.rf_waddr_W ) \
  //                      & ( s.rs2_fprf_D | s.rf_waddr_W != 0 ) \
  //                      & ( s.rs2_fprf_D == s.rd_fprf_W ) \
  //                      & s.rf_wen_pending_W:    s.op2_byp_sel_D.value = byp_w

  // logic for comb_bypass_D()
  always @ (*) begin
    op1_byp_sel_D = byp_d;
    if (rs1_en_D) begin
      if (((((val_X&(inst_D[(20)-1:15] == rf_waddr_X))&((rs1_fprf_D|rf_waddr_X) != 0))&(rs1_fprf_D == rd_fprf_X))&rf_wen_pending_X)) begin
        op1_byp_sel_D = byp_x;
      end
      else begin
        if (((((val_M&(inst_D[(20)-1:15] == rf_waddr_M))&((rs1_fprf_D|rf_waddr_M) != 0))&(rs1_fprf_D == rd_fprf_M))&rf_wen_pending_M)) begin
          op1_byp_sel_D = byp_m;
        end
        else begin
          if (((((val_W&(inst_D[(20)-1:15] == rf_waddr_W))&((rs1_fprf_D|rf_waddr_W) != 0))&(rs1_fprf_D == rd_fprf_W))&rf_wen_pending_W)) begin
            op1_byp_sel_D = byp_w;
          end
          else begin
          end
        end
      end
    end
    else begin
    end
    op2_byp_sel_D = byp_d;
    if (rs2_en_D) begin
      if (((((val_X&(inst_D[(25)-1:20] == rf_waddr_X))&((rs2_fprf_D|rf_waddr_X) != 0))&(rs2_fprf_D == rd_fprf_X))&rf_wen_pending_X)) begin
        op2_byp_sel_D = byp_x;
      end
      else begin
        if (((((val_M&(inst_D[(25)-1:20] == rf_waddr_M))&((rs2_fprf_D|rf_waddr_M) != 0))&(rs2_fprf_D == rd_fprf_M))&rf_wen_pending_M)) begin
          op2_byp_sel_D = byp_m;
        end
        else begin
          if (((((val_W&(inst_D[(25)-1:20] == rf_waddr_W))&((rs2_fprf_D|rf_waddr_W) != 0))&(rs2_fprf_D == rd_fprf_W))&rf_wen_pending_W)) begin
            op2_byp_sel_D = byp_w;
          end
          else begin
          end
        end
      end
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_hazard_D():
  //
  //       s.ostall_ld_X_rs1_D.value =\
  //           s.rs1_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS1 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & ( s.dmemreq_type_X == mem_ld )
  //
  //       s.ostall_ld_X_rs2_D.value =\
  //           s.rs2_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & ( s.dmemreq_type_X == mem_ld )
  //
  //       s.ostall_amo_X_rs1_D.value =\
  //           s.rs1_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS1 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & (   ( s.dmemreq_type_X == mem_ad  ) \
  //             | ( s.dmemreq_type_X == mem_an  ) \
  //             | ( s.dmemreq_type_X == mem_or  ) \
  //             | ( s.dmemreq_type_X == mem_sp  ) \
  //             | ( s.dmemreq_type_X == mem_mn  ) \
  //             | ( s.dmemreq_type_X == mem_mnu ) \
  //             | ( s.dmemreq_type_X == mem_mx  ) \
  //             | ( s.dmemreq_type_X == mem_mxu ) \
  //             | ( s.dmemreq_type_X == mem_xr  ) )
  //
  //       s.ostall_amo_X_rs2_D.value =\
  //           s.rs2_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & (   ( s.dmemreq_type_X == mem_ad  ) \
  //             | ( s.dmemreq_type_X == mem_an  ) \
  //             | ( s.dmemreq_type_X == mem_or  ) \
  //             | ( s.dmemreq_type_X == mem_sp  ) \
  //             | ( s.dmemreq_type_X == mem_mn  ) \
  //             | ( s.dmemreq_type_X == mem_mnu ) \
  //             | ( s.dmemreq_type_X == mem_mx  ) \
  //             | ( s.dmemreq_type_X == mem_mxu ) \
  //             | ( s.dmemreq_type_X == mem_xr  ) )
  //
  //       s.ostall_csrrx_X_rs1_D.value =\
  //           s.rs1_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS1 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & s.xcelreq_X & (s.xcelreq_type_X == XcelReqMsg.TYPE_READ)
  //
  //       s.ostall_csrrx_X_rs2_D.value =\
  //           s.rs2_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & s.xcelreq_X & (s.xcelreq_type_X == XcelReqMsg.TYPE_READ)
  //
  //       s.ostall_hazard_D.value =\
  //           s.ostall_ld_X_rs1_D    | s.ostall_ld_X_rs2_D \
  //         | s.ostall_amo_X_rs1_D   | s.ostall_amo_X_rs2_D \
  //         | s.ostall_csrrx_X_rs1_D | s.ostall_csrrx_X_rs2_D

  // logic for comb_hazard_D()
  always @ (*) begin
    ostall_ld_X_rs1_D = (((((rs1_en_D&val_X)&rf_wen_pending_X)&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&(dmemreq_type_X == mem_ld));
    ostall_ld_X_rs2_D = (((((rs2_en_D&val_X)&rf_wen_pending_X)&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&(dmemreq_type_X == mem_ld));
    ostall_amo_X_rs1_D = (((((rs1_en_D&val_X)&rf_wen_pending_X)&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&(((((((((dmemreq_type_X == mem_ad)|(dmemreq_type_X == mem_an))|(dmemreq_type_X == mem_or))|(dmemreq_type_X == mem_sp))|(dmemreq_type_X == mem_mn))|(dmemreq_type_X == mem_mnu))|(dmemreq_type_X == mem_mx))|(dmemreq_type_X == mem_mxu))|(dmemreq_type_X == mem_xr)));
    ostall_amo_X_rs2_D = (((((rs2_en_D&val_X)&rf_wen_pending_X)&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&(((((((((dmemreq_type_X == mem_ad)|(dmemreq_type_X == mem_an))|(dmemreq_type_X == mem_or))|(dmemreq_type_X == mem_sp))|(dmemreq_type_X == mem_mn))|(dmemreq_type_X == mem_mnu))|(dmemreq_type_X == mem_mx))|(dmemreq_type_X == mem_mxu))|(dmemreq_type_X == mem_xr)));
    ostall_csrrx_X_rs1_D = ((((((rs1_en_D&val_X)&rf_wen_pending_X)&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&xcelreq_X)&(xcelreq_type_X == TYPE_READ));
    ostall_csrrx_X_rs2_D = ((((((rs2_en_D&val_X)&rf_wen_pending_X)&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&xcelreq_X)&(xcelreq_type_X == TYPE_READ));
    ostall_hazard_D = (((((ostall_ld_X_rs1_D|ostall_ld_X_rs2_D)|ostall_amo_X_rs1_D)|ostall_amo_X_rs2_D)|ostall_csrrx_X_rs1_D)|ostall_csrrx_X_rs2_D);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_D():
  //
  //       # ostall due to mngr2proc
  //       s.ostall_mngr_D.value = s.mngr2proc_rdy_D & ~s.mngr2proc_val
  //
  //       # ostall due to mdu
  //       s.ostall_mdu_D.value  = s.val_D & (s.mdu_D != md_x) & ~s.mdureq_rdy
  //
  //       # ostall due to fpu
  //       s.ostall_fpu_D.value  = s.val_D & (s.fpu_D != fp_x) & ~s.fpureq_rdy
  //
  //       # put together all ostall conditions
  //
  //       s.ostall_D.value = s.val_D & ( s.ostall_mngr_D | s.ostall_hazard_D |
  //                                      s.ostall_mdu_D | s.ostall_fpu_D )
  //
  //       # stall in D stage
  //
  //       s.stall_D.value = s.val_D & ( s.ostall_D | s.ostall_X |
  //                                     s.ostall_M | s.ostall_W   )
  //
  //       # osquash due to jumps
  //       # Note that, in the same combinational block, we have to calculate
  //       # s.stall_D first then use it in osquash_D. Several people have
  //       # stuck here just because they calculate osquash_D before stall_D!
  //
  //       s.osquash_D.value = s.val_D & ~s.stall_D & s.pc_redirect_D
  //
  //       # squash in D stage
  //
  //       s.squash_D.value = s.val_D & s.osquash_X
  //
  //       # mngr2proc port
  //
  //       s.mngr2proc_rdy.value = s.val_D & ~s.stall_D & s.mngr2proc_rdy_D
  //
  //       # mdu request valid signal
  //
  //       s.mdureq_val.value = s.val_D & ~s.stall_D & ~s.squash_D & (s.mdu_D != md_x)
  //
  //       # send lower 3 bits, since 0-7 are valid types and don't care is 8
  //
  //       s.mdureq_msg_type.value = s.mdu_D[0:3]
  //
  //       # fpu request valid signal
  //
  //       s.fpureq_val.value = s.val_D & ~s.stall_D & ~s.squash_D & (s.fpu_D != fp_x)
  //       s.fpureq_msg_type.value = s.fpu_D
  //
  //       # next valid bit
  //
  //       s.next_val_D.value = s.val_D & ~s.stall_D & ~s.squash_D

  // logic for comb_D()
  always @ (*) begin
    ostall_mngr_D = (mngr2proc_rdy_D&~mngr2proc_val);
    ostall_mdu_D = ((val_D&(mdu_D != md_x))&~mdureq_rdy);
    ostall_fpu_D = ((val_D&(fpu_D != fp_x))&~fpureq_rdy);
    ostall_D = (val_D&(((ostall_mngr_D|ostall_hazard_D)|ostall_mdu_D)|ostall_fpu_D));
    stall_D = (val_D&(((ostall_D|ostall_X)|ostall_M)|ostall_W));
    osquash_D = ((val_D&~stall_D)&pc_redirect_D);
    squash_D = (val_D&osquash_X);
    mngr2proc_rdy = ((val_D&~stall_D)&mngr2proc_rdy_D);
    mdureq_val = (((val_D&~stall_D)&~squash_D)&(mdu_D != md_x));
    mdureq_msg_type = mdu_D[(3)-1:0];
    fpureq_val = (((val_D&~stall_D)&~squash_D)&(fpu_D != fp_x));
    fpureq_msg_type = fpu_D;
    next_val_D = ((val_D&~stall_D)&~squash_D);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_reg_en_X():
  //       s.reg_en_X.value  = ~s.stall_X

  // logic for comb_reg_en_X()
  always @ (*) begin
    reg_en_X = ~stall_X;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_br_X():
  //       s.pc_redirect_X.value = 0
  //
  //       if s.val_X:
  //         if   s.br_type_X == br_eq: s.pc_redirect_X.value = s.br_cond_eq_X
  //         elif s.br_type_X == br_lt: s.pc_redirect_X.value = s.br_cond_lt_X
  //         elif s.br_type_X == br_lu: s.pc_redirect_X.value = s.br_cond_ltu_X
  //         elif s.br_type_X == br_ne: s.pc_redirect_X.value = ~s.br_cond_eq_X
  //         elif s.br_type_X == br_ge: s.pc_redirect_X.value = ~s.br_cond_lt_X
  //         elif s.br_type_X == br_gu: s.pc_redirect_X.value = ~s.br_cond_ltu_X
  //         elif s.br_type_X == jalr : s.pc_redirect_X.value = 1

  // logic for comb_br_X()
  always @ (*) begin
    pc_redirect_X = 0;
    if (val_X) begin
      if ((br_type_X == br_eq)) begin
        pc_redirect_X = br_cond_eq_X;
      end
      else begin
        if ((br_type_X == br_lt)) begin
          pc_redirect_X = br_cond_lt_X;
        end
        else begin
          if ((br_type_X == br_lu)) begin
            pc_redirect_X = br_cond_ltu_X;
          end
          else begin
            if ((br_type_X == br_ne)) begin
              pc_redirect_X = ~br_cond_eq_X;
            end
            else begin
              if ((br_type_X == br_ge)) begin
                pc_redirect_X = ~br_cond_lt_X;
              end
              else begin
                if ((br_type_X == br_gu)) begin
                  pc_redirect_X = ~br_cond_ltu_X;
                end
                else begin
                  if ((br_type_X == jalr)) begin
                    pc_redirect_X = 1;
                  end
                  else begin
                  end
                end
              end
            end
          end
        end
      end
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_X():
  //
  //       # ostall due to xcelreq
  //       s.ostall_xcel_X.value = s.xcelreq_X & ~s.xcelreq_rdy
  //
  //       # ostall due to dmemreq
  //       s.ostall_dmem_X.value = ( s.dmemreq_type_X != mem_nr ) & ~s.dmemreq_rdy
  //
  //       # ostall due to mdu
  //       s.ostall_mdu_X.value = (s.mdu_X != md_x) & ~s.mduresp_val
  //
  //       # ostall due to fpu
  //       s.ostall_fpu_X.value = (s.fpu_X != fp_x) & ~s.fpuresp_val
  //
  //       s.ostall_X.value = s.val_X & ( s.ostall_dmem_X | s.ostall_mdu_X | s.ostall_fpu_X | s.ostall_xcel_X )
  //
  //       # stall in X stage
  //
  //       s.stall_X.value  = s.val_X & ( s.ostall_X | s.ostall_M | s.ostall_W )
  //
  //       # osquash due to taken branches
  //       # Note that, in the same combinational block, we have to calculate
  //       # s.stall_X first then use it in osquash_X. Several people have
  //       # stuck here just because they calculate osquash_X before stall_X!
  //
  //       s.osquash_X.value   = s.val_X & ~s.stall_X & s.pc_redirect_X
  //
  //       # send dmemreq if not stalling
  //
  //       s.dmemreq_val.value = s.val_X & ~s.stall_X & ( s.dmemreq_type_X != mem_nr )
  //
  //       # set dmemreq type, with MemReqMsg.TYPE_READ as "don't care / load"
  //
  //       if   s.dmemreq_type_X == mem_st  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_WRITE
  //       elif s.dmemreq_type_X == mem_ad  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_ADD
  //       elif s.dmemreq_type_X == mem_an  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_AND
  //       elif s.dmemreq_type_X == mem_or  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_OR
  //       elif s.dmemreq_type_X == mem_sp  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_SWAP
  //       elif s.dmemreq_type_X == mem_mn  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_MIN
  //       elif s.dmemreq_type_X == mem_mnu : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_MINU
  //       elif s.dmemreq_type_X == mem_mx  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_MAX
  //       elif s.dmemreq_type_X == mem_mxu : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_MAXU
  //       elif s.dmemreq_type_X == mem_xr  : s.dmemreq_msg_type.value = MemReqMsg.TYPE_AMO_XOR
  //       else                             : s.dmemreq_msg_type.value = MemReqMsg.TYPE_READ
  //
  //       # set dmemreq len
  //
  //       s.dmemreq_msg_len.value = s.dmemreq_len_X
  //
  //       # send xcelreq if not stalling
  //
  //       s.xcelreq_val.value = s.val_X & ~s.stall_X & s.xcelreq_X
  //       s.xcelreq_msg_type.value  = s.xcelreq_type_X
  //
  //       # mdu resp ready signal
  //
  //       s.mduresp_rdy.value = s.val_X & ~s.stall_X & ( s.mdu_X != md_x )
  //
  //       # fpu resp ready signal
  //
  //       s.fpuresp_rdy.value = s.val_X & ~s.stall_X & ( s.fpu_X != fp_x )
  //
  //       # next valid bit
  //
  //       s.next_val_X.value  = s.val_X & ~s.stall_X

  // logic for comb_X()
  always @ (*) begin
    ostall_xcel_X = (xcelreq_X&~xcelreq_rdy);
    ostall_dmem_X = ((dmemreq_type_X != mem_nr)&~dmemreq_rdy);
    ostall_mdu_X = ((mdu_X != md_x)&~mduresp_val);
    ostall_fpu_X = ((fpu_X != fp_x)&~fpuresp_val);
    ostall_X = (val_X&(((ostall_dmem_X|ostall_mdu_X)|ostall_fpu_X)|ostall_xcel_X));
    stall_X = (val_X&((ostall_X|ostall_M)|ostall_W));
    osquash_X = ((val_X&~stall_X)&pc_redirect_X);
    dmemreq_val = ((val_X&~stall_X)&(dmemreq_type_X != mem_nr));
    if ((dmemreq_type_X == mem_st)) begin
      dmemreq_msg_type = TYPE_WRITE;
    end
    else begin
      if ((dmemreq_type_X == mem_ad)) begin
        dmemreq_msg_type = TYPE_AMO_ADD;
      end
      else begin
        if ((dmemreq_type_X == mem_an)) begin
          dmemreq_msg_type = TYPE_AMO_AND;
        end
        else begin
          if ((dmemreq_type_X == mem_or)) begin
            dmemreq_msg_type = TYPE_AMO_OR;
          end
          else begin
            if ((dmemreq_type_X == mem_sp)) begin
              dmemreq_msg_type = TYPE_AMO_SWAP;
            end
            else begin
              if ((dmemreq_type_X == mem_mn)) begin
                dmemreq_msg_type = TYPE_AMO_MIN;
              end
              else begin
                if ((dmemreq_type_X == mem_mnu)) begin
                  dmemreq_msg_type = TYPE_AMO_MINU;
                end
                else begin
                  if ((dmemreq_type_X == mem_mx)) begin
                    dmemreq_msg_type = TYPE_AMO_MAX;
                  end
                  else begin
                    if ((dmemreq_type_X == mem_mxu)) begin
                      dmemreq_msg_type = TYPE_AMO_MAXU;
                    end
                    else begin
                      if ((dmemreq_type_X == mem_xr)) begin
                        dmemreq_msg_type = TYPE_AMO_XOR;
                      end
                      else begin
                        dmemreq_msg_type = TYPE_READ;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    dmemreq_msg_len = dmemreq_len_X;
    xcelreq_val = ((val_X&~stall_X)&xcelreq_X);
    xcelreq_msg_type = xcelreq_type_X;
    mduresp_rdy = ((val_X&~stall_X)&(mdu_X != md_x));
    fpuresp_rdy = ((val_X&~stall_X)&(fpu_X != fp_x));
    next_val_X = (val_X&~stall_X);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_reg_en_M():
  //       s.reg_en_M.value = ~s.stall_M

  // logic for comb_reg_en_M()
  always @ (*) begin
    reg_en_M = ~stall_M;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_M():
  //
  //       # ostall due to xcel resp
  //       s.ostall_xcel_M.value = s.xcelreq_M & ~s.xcelresp_val
  //
  //       # ostall due to dmem resp
  //       s.ostall_dmem_M.value = ( s.dmemreq_type_M != mem_nr ) & ~s.dmemresp_val
  //
  //       s.ostall_M.value = s.val_M & ( s.ostall_dmem_M | s.ostall_xcel_M )
  //
  //       # stall in M stage
  //
  //       s.stall_M.value  = s.val_M & ( s.ostall_M | s.ostall_W )
  //
  //       # set dmemresp ready if not stalling
  //
  //       s.dmemresp_rdy.value = s.val_M & ~s.stall_M & ( s.dmemreq_type_M != mem_nr )
  //
  //       # set xcelresp ready if not stalling
  //
  //       s.xcelresp_rdy.value = s.val_M & ~s.stall_M & s.xcelreq_M
  //
  //       # next valid bit
  //
  //       s.next_val_M.value   = s.val_M & ~s.stall_M

  // logic for comb_M()
  always @ (*) begin
    ostall_xcel_M = (xcelreq_M&~xcelresp_val);
    ostall_dmem_M = ((dmemreq_type_M != mem_nr)&~dmemresp_val);
    ostall_M = (val_M&(ostall_dmem_M|ostall_xcel_M));
    stall_M = (val_M&(ostall_M|ostall_W));
    dmemresp_rdy = ((val_M&~stall_M)&(dmemreq_type_M != mem_nr));
    xcelresp_rdy = ((val_M&~stall_M)&xcelreq_M);
    next_val_M = (val_M&~stall_M);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_W():
  //       s.reg_en_W.value = ~s.stall_W

  // logic for comb_W()
  always @ (*) begin
    reg_en_W = ~stall_W;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_W():
  //       # set RF write enable if valid
  //
  //       s.rf_wen_W.value       = s.val_W & s.rf_wen_pending_W
  //       s.stats_en_wen_W.value = s.val_W & s.stats_en_wen_pending_W
  //
  //       # ostall due to proc2mngr
  //
  //       s.ostall_W.value      = s.val_W & s.proc2mngr_val_W & ~s.proc2mngr_rdy
  //
  //       # stall in W stage
  //
  //       s.stall_W.value       = s.val_W & s.ostall_W
  //
  //       # set proc2mngr val if not stalling
  //
  //       s.proc2mngr_val.value = s.val_W & ~s.stall_W & s.proc2mngr_val_W
  //
  //       s.commit_inst.value   = s.val_W & ~s.stall_W

  // logic for comb_W()
  always @ (*) begin
    rf_wen_W = (val_W&rf_wen_pending_W);
    stats_en_wen_W = (val_W&stats_en_wen_pending_W);
    ostall_W = ((val_W&proc2mngr_val_W)&~proc2mngr_rdy);
    stall_W = (val_W&ostall_W);
    proc2mngr_val = ((val_W&~stall_W)&proc2mngr_val_W);
    commit_inst = (val_W&~stall_W);
  end


endmodule // ProcCtrlPRTL_0x7240db358d36b822
`default_nettype wire

//-----------------------------------------------------------------------------
// DecodeInstType_0x477004d1d8d485d1
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.TinyRV2InstPRTL {}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module DecodeInstType_0x477004d1d8d485d1
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [   7:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam ADD = 15;
  localparam ADDI = 16;
  localparam AMOADD = 47;
  localparam AMOAND = 50;
  localparam AMOMAX = 52;
  localparam AMOMAXU = 54;
  localparam AMOMIN = 51;
  localparam AMOMINU = 53;
  localparam AMOOR = 49;
  localparam AMOSWAP = 46;
  localparam AMOXOR = 48;
  localparam AND = 24;
  localparam ANDI = 25;
  localparam AUIPC = 19;
  localparam BEQ = 30;
  localparam BGE = 33;
  localparam BGEU = 35;
  localparam BLT = 32;
  localparam BLTU = 34;
  localparam BNE = 31;
  localparam CSRR = 70;
  localparam CSRRX = 73;
  localparam CSRW = 71;
  localparam DIV = 42;
  localparam DIVU = 43;
  localparam FADDS = 57;
  localparam FCVTSW = 68;
  localparam FCVTWS = 63;
  localparam FDIVS = 60;
  localparam FEQS = 65;
  localparam FLES = 67;
  localparam FLTS = 66;
  localparam FLW = 55;
  localparam FMAXS = 62;
  localparam FMINS = 61;
  localparam FMULS = 59;
  localparam FMVWX = 69;
  localparam FMVXW = 64;
  localparam FSUBS = 58;
  localparam FSW = 56;
  localparam JAL = 36;
  localparam JALR = 37;
  localparam LB = 1;
  localparam LBU = 4;
  localparam LH = 2;
  localparam LHU = 5;
  localparam LUI = 18;
  localparam LW = 3;
  localparam MUL = 38;
  localparam MULH = 39;
  localparam MULHSU = 40;
  localparam MULHU = 41;
  localparam NOP = 0;
  localparam OR = 22;
  localparam ORI = 23;
  localparam REM = 44;
  localparam REMU = 45;
  localparam SB = 6;
  localparam SH = 7;
  localparam SLL = 9;
  localparam SLLI = 10;
  localparam SLT = 26;
  localparam SLTI = 27;
  localparam SLTIU = 29;
  localparam SLTU = 28;
  localparam SRA = 13;
  localparam SRAI = 14;
  localparam SRL = 11;
  localparam SRLI = 12;
  localparam SUB = 17;
  localparam SW = 8;
  localparam XOR = 20;
  localparam XORI = 21;
  localparam ZERO = 72;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //
  //       s.out.value = ZERO
  //
  //       if   s.in_ == 0b10011:                 s.out.value = NOP
  //       elif s.in_[OPCODE] == 0b0110011:
  //         if   s.in_[FUNCT7] == 0b0000000:
  //           if   s.in_[FUNCT3] == 0b000:       s.out.value = ADD
  //           elif s.in_[FUNCT3] == 0b001:       s.out.value = SLL
  //           elif s.in_[FUNCT3] == 0b010:       s.out.value = SLT
  //           elif s.in_[FUNCT3] == 0b011:       s.out.value = SLTU
  //           elif s.in_[FUNCT3] == 0b100:       s.out.value = XOR
  //           elif s.in_[FUNCT3] == 0b101:       s.out.value = SRL
  //           elif s.in_[FUNCT3] == 0b110:       s.out.value = OR
  //           elif s.in_[FUNCT3] == 0b111:       s.out.value = AND
  //         elif s.in_[FUNCT7] == 0b0100000:
  //           if   s.in_[FUNCT3] == 0b000:       s.out.value = SUB
  //           elif s.in_[FUNCT3] == 0b101:       s.out.value = SRA
  //         elif s.in_[FUNCT7] == 0b0000001:
  //           if   s.in_[FUNCT3] == 0b000:       s.out.value = MUL
  //           if   s.in_[FUNCT3] == 0b001:       s.out.value = MULH
  //           if   s.in_[FUNCT3] == 0b010:       s.out.value = MULHSU
  //           if   s.in_[FUNCT3] == 0b011:       s.out.value = MULHU
  //           if   s.in_[FUNCT3] == 0b100:       s.out.value = DIV
  //           if   s.in_[FUNCT3] == 0b101:       s.out.value = DIVU
  //           if   s.in_[FUNCT3] == 0b110:       s.out.value = REM
  //           if   s.in_[FUNCT3] == 0b111:       s.out.value = REMU
  //
  //       elif s.in_[OPCODE] == 0b0010011:
  //         if   s.in_[FUNCT3] == 0b000:         s.out.value = ADDI
  //         elif s.in_[FUNCT3] == 0b010:         s.out.value = SLTI
  //         elif s.in_[FUNCT3] == 0b011:         s.out.value = SLTIU
  //         elif s.in_[FUNCT3] == 0b100:         s.out.value = XORI
  //         elif s.in_[FUNCT3] == 0b110:         s.out.value = ORI
  //         elif s.in_[FUNCT3] == 0b111:         s.out.value = ANDI
  //         elif s.in_[FUNCT3] == 0b001:         s.out.value = SLLI
  //         elif s.in_[FUNCT3] == 0b101:
  //           if   s.in_[FUNCT7] == 0b0000000:   s.out.value = SRLI
  //           elif s.in_[FUNCT7] == 0b0100000:   s.out.value = SRAI
  //
  //       elif s.in_[OPCODE] == 0b0100011:
  //         if   s.in_[FUNCT3] == 0b000:         s.out.value = SB
  //         elif s.in_[FUNCT3] == 0b001:         s.out.value = SH
  //         elif s.in_[FUNCT3] == 0b010:         s.out.value = SW
  //
  //       elif s.in_[OPCODE] == 0b0000011:
  //         if   s.in_[FUNCT3] == 0b000:         s.out.value = LB
  //         elif s.in_[FUNCT3] == 0b001:         s.out.value = LH
  //         elif s.in_[FUNCT3] == 0b010:         s.out.value = LW
  //         elif s.in_[FUNCT3] == 0b100:         s.out.value = LBU
  //         elif s.in_[FUNCT3] == 0b101:         s.out.value = LHU
  //
  //       elif s.in_[OPCODE] == 0b1100011:
  //         if   s.in_[FUNCT3] == 0b000:         s.out.value = BEQ
  //         elif s.in_[FUNCT3] == 0b001:         s.out.value = BNE
  //         elif s.in_[FUNCT3] == 0b100:         s.out.value = BLT
  //         elif s.in_[FUNCT3] == 0b101:         s.out.value = BGE
  //         elif s.in_[FUNCT3] == 0b110:         s.out.value = BLTU
  //         elif s.in_[FUNCT3] == 0b111:         s.out.value = BGEU
  //
  //       elif s.in_[OPCODE] == 0b0110111:       s.out.value = LUI
  //
  //       elif s.in_[OPCODE] == 0b0010111:       s.out.value = AUIPC
  //
  //       elif s.in_[OPCODE] == 0b1101111:       s.out.value = JAL
  //
  //       elif s.in_[OPCODE] == 0b1100111:       s.out.value = JALR
  //
  //       elif s.in_[OPCODE] == 0b1110011:
  //         if   s.in_[FUNCT3] == 0b001:         s.out.value = CSRW
  //         elif s.in_[FUNCT3] == 0b010:
  //           if s.in_[FUNCT7] == 0b0111111:     s.out.value = CSRRX
  //           else:                              s.out.value = CSRR
  //       # elif s.in_[OPCODE] == 0b0001011:     s.out.value = CUST0
  //
  //       elif s.in_[OPCODE] == 0b0101111:
  //         if   s.in_[FUNCT3] == 0b010:
  //           if   s.in_[FUNCT5] == 0b00001:     s.out.value = AMOSWAP
  //           elif s.in_[FUNCT5] == 0b00000:     s.out.value = AMOADD
  //           elif s.in_[FUNCT5] == 0b00100:     s.out.value = AMOXOR
  //           elif s.in_[FUNCT5] == 0b01000:     s.out.value = AMOOR
  //           elif s.in_[FUNCT5] == 0b01100:     s.out.value = AMOAND
  //           elif s.in_[FUNCT5] == 0b10000:     s.out.value = AMOMIN
  //           elif s.in_[FUNCT5] == 0b10100:     s.out.value = AMOMAX
  //           elif s.in_[FUNCT5] == 0b11000:     s.out.value = AMOMINU
  //           elif s.in_[FUNCT5] == 0b11100:     s.out.value = AMOMAXU
  //
  //       elif s.in_[OPCODE] == 0b0000111:
  //         if   s.in_[FUNCT3] == 0b010:         s.out.value = FLW
  //
  //       elif s.in_[OPCODE] == 0b0100111:
  //         if   s.in_[FUNCT3] == 0b010:         s.out.value = FSW
  //
  //       elif s.in_[OPCODE] == 0b1010011:
  //         if   s.in_[FUNCT7] == 0b0000000:     s.out.value = FADDS
  //         elif s.in_[FUNCT7] == 0b0000100:     s.out.value = FSUBS
  //         elif s.in_[FUNCT7] == 0b0001000:     s.out.value = FMULS
  //         elif s.in_[FUNCT7] == 0b0001100:     s.out.value = FDIVS
  //         elif s.in_[FUNCT7] == 0b0010100:
  //           if   s.in_[FUNCT3] == 0b000:       s.out.value = FMINS
  //           elif s.in_[FUNCT3] == 0b001:       s.out.value = FMAXS
  //         elif s.in_[FUNCT7] == 0b1100000:
  //           if   s.in_[RS2] == 0b00000:        s.out.value = FCVTWS
  //         elif s.in_[FUNCT7] == 0b1110000:
  //           if   s.in_[RS2] == 0b00000:
  //             if   s.in_[FUNCT3] == 0b000:     s.out.value = FMVXW
  //         elif s.in_[FUNCT7] == 0b1010000:
  //           if   s.in_[FUNCT3] == 0b010:       s.out.value = FEQS
  //           elif s.in_[FUNCT3] == 0b001:       s.out.value = FLTS
  //           elif s.in_[FUNCT3] == 0b000:       s.out.value = FLES
  //         elif s.in_[FUNCT7] == 0b1101000:
  //           if   s.in_[RS2] == 0b00000:        s.out.value = FCVTSW
  //         elif s.in_[FUNCT7] == 0b1111000:
  //           if   s.in_[RS2] == 0b00000:
  //             if   s.in_[FUNCT3] == 0b000:     s.out.value = FMVWX

  // logic for comb_logic()
  always @ (*) begin
    out = ZERO;
    if ((in_ == 19)) begin
      out = NOP;
    end
    else begin
      if ((in_[(7)-1:0] == 51)) begin
        if ((in_[(32)-1:25] == 0)) begin
          if ((in_[(15)-1:12] == 0)) begin
            out = ADD;
          end
          else begin
            if ((in_[(15)-1:12] == 1)) begin
              out = SLL;
            end
            else begin
              if ((in_[(15)-1:12] == 2)) begin
                out = SLT;
              end
              else begin
                if ((in_[(15)-1:12] == 3)) begin
                  out = SLTU;
                end
                else begin
                  if ((in_[(15)-1:12] == 4)) begin
                    out = XOR;
                  end
                  else begin
                    if ((in_[(15)-1:12] == 5)) begin
                      out = SRL;
                    end
                    else begin
                      if ((in_[(15)-1:12] == 6)) begin
                        out = OR;
                      end
                      else begin
                        if ((in_[(15)-1:12] == 7)) begin
                          out = AND;
                        end
                        else begin
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        else begin
          if ((in_[(32)-1:25] == 32)) begin
            if ((in_[(15)-1:12] == 0)) begin
              out = SUB;
            end
            else begin
              if ((in_[(15)-1:12] == 5)) begin
                out = SRA;
              end
              else begin
              end
            end
          end
          else begin
            if ((in_[(32)-1:25] == 1)) begin
              if ((in_[(15)-1:12] == 0)) begin
                out = MUL;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 1)) begin
                out = MULH;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 2)) begin
                out = MULHSU;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 3)) begin
                out = MULHU;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 4)) begin
                out = DIV;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 5)) begin
                out = DIVU;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 6)) begin
                out = REM;
              end
              else begin
              end
              if ((in_[(15)-1:12] == 7)) begin
                out = REMU;
              end
              else begin
              end
            end
            else begin
            end
          end
        end
      end
      else begin
        if ((in_[(7)-1:0] == 19)) begin
          if ((in_[(15)-1:12] == 0)) begin
            out = ADDI;
          end
          else begin
            if ((in_[(15)-1:12] == 2)) begin
              out = SLTI;
            end
            else begin
              if ((in_[(15)-1:12] == 3)) begin
                out = SLTIU;
              end
              else begin
                if ((in_[(15)-1:12] == 4)) begin
                  out = XORI;
                end
                else begin
                  if ((in_[(15)-1:12] == 6)) begin
                    out = ORI;
                  end
                  else begin
                    if ((in_[(15)-1:12] == 7)) begin
                      out = ANDI;
                    end
                    else begin
                      if ((in_[(15)-1:12] == 1)) begin
                        out = SLLI;
                      end
                      else begin
                        if ((in_[(15)-1:12] == 5)) begin
                          if ((in_[(32)-1:25] == 0)) begin
                            out = SRLI;
                          end
                          else begin
                            if ((in_[(32)-1:25] == 32)) begin
                              out = SRAI;
                            end
                            else begin
                            end
                          end
                        end
                        else begin
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        else begin
          if ((in_[(7)-1:0] == 35)) begin
            if ((in_[(15)-1:12] == 0)) begin
              out = SB;
            end
            else begin
              if ((in_[(15)-1:12] == 1)) begin
                out = SH;
              end
              else begin
                if ((in_[(15)-1:12] == 2)) begin
                  out = SW;
                end
                else begin
                end
              end
            end
          end
          else begin
            if ((in_[(7)-1:0] == 3)) begin
              if ((in_[(15)-1:12] == 0)) begin
                out = LB;
              end
              else begin
                if ((in_[(15)-1:12] == 1)) begin
                  out = LH;
                end
                else begin
                  if ((in_[(15)-1:12] == 2)) begin
                    out = LW;
                  end
                  else begin
                    if ((in_[(15)-1:12] == 4)) begin
                      out = LBU;
                    end
                    else begin
                      if ((in_[(15)-1:12] == 5)) begin
                        out = LHU;
                      end
                      else begin
                      end
                    end
                  end
                end
              end
            end
            else begin
              if ((in_[(7)-1:0] == 99)) begin
                if ((in_[(15)-1:12] == 0)) begin
                  out = BEQ;
                end
                else begin
                  if ((in_[(15)-1:12] == 1)) begin
                    out = BNE;
                  end
                  else begin
                    if ((in_[(15)-1:12] == 4)) begin
                      out = BLT;
                    end
                    else begin
                      if ((in_[(15)-1:12] == 5)) begin
                        out = BGE;
                      end
                      else begin
                        if ((in_[(15)-1:12] == 6)) begin
                          out = BLTU;
                        end
                        else begin
                          if ((in_[(15)-1:12] == 7)) begin
                            out = BGEU;
                          end
                          else begin
                          end
                        end
                      end
                    end
                  end
                end
              end
              else begin
                if ((in_[(7)-1:0] == 55)) begin
                  out = LUI;
                end
                else begin
                  if ((in_[(7)-1:0] == 23)) begin
                    out = AUIPC;
                  end
                  else begin
                    if ((in_[(7)-1:0] == 111)) begin
                      out = JAL;
                    end
                    else begin
                      if ((in_[(7)-1:0] == 103)) begin
                        out = JALR;
                      end
                      else begin
                        if ((in_[(7)-1:0] == 115)) begin
                          if ((in_[(15)-1:12] == 1)) begin
                            out = CSRW;
                          end
                          else begin
                            if ((in_[(15)-1:12] == 2)) begin
                              if ((in_[(32)-1:25] == 63)) begin
                                out = CSRRX;
                              end
                              else begin
                                out = CSRR;
                              end
                            end
                            else begin
                            end
                          end
                        end
                        else begin
                          if ((in_[(7)-1:0] == 47)) begin
                            if ((in_[(15)-1:12] == 2)) begin
                              if ((in_[(32)-1:27] == 1)) begin
                                out = AMOSWAP;
                              end
                              else begin
                                if ((in_[(32)-1:27] == 0)) begin
                                  out = AMOADD;
                                end
                                else begin
                                  if ((in_[(32)-1:27] == 4)) begin
                                    out = AMOXOR;
                                  end
                                  else begin
                                    if ((in_[(32)-1:27] == 8)) begin
                                      out = AMOOR;
                                    end
                                    else begin
                                      if ((in_[(32)-1:27] == 12)) begin
                                        out = AMOAND;
                                      end
                                      else begin
                                        if ((in_[(32)-1:27] == 16)) begin
                                          out = AMOMIN;
                                        end
                                        else begin
                                          if ((in_[(32)-1:27] == 20)) begin
                                            out = AMOMAX;
                                          end
                                          else begin
                                            if ((in_[(32)-1:27] == 24)) begin
                                              out = AMOMINU;
                                            end
                                            else begin
                                              if ((in_[(32)-1:27] == 28)) begin
                                                out = AMOMAXU;
                                              end
                                              else begin
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                            else begin
                            end
                          end
                          else begin
                            if ((in_[(7)-1:0] == 7)) begin
                              if ((in_[(15)-1:12] == 2)) begin
                                out = FLW;
                              end
                              else begin
                              end
                            end
                            else begin
                              if ((in_[(7)-1:0] == 39)) begin
                                if ((in_[(15)-1:12] == 2)) begin
                                  out = FSW;
                                end
                                else begin
                                end
                              end
                              else begin
                                if ((in_[(7)-1:0] == 83)) begin
                                  if ((in_[(32)-1:25] == 0)) begin
                                    out = FADDS;
                                  end
                                  else begin
                                    if ((in_[(32)-1:25] == 4)) begin
                                      out = FSUBS;
                                    end
                                    else begin
                                      if ((in_[(32)-1:25] == 8)) begin
                                        out = FMULS;
                                      end
                                      else begin
                                        if ((in_[(32)-1:25] == 12)) begin
                                          out = FDIVS;
                                        end
                                        else begin
                                          if ((in_[(32)-1:25] == 20)) begin
                                            if ((in_[(15)-1:12] == 0)) begin
                                              out = FMINS;
                                            end
                                            else begin
                                              if ((in_[(15)-1:12] == 1)) begin
                                                out = FMAXS;
                                              end
                                              else begin
                                              end
                                            end
                                          end
                                          else begin
                                            if ((in_[(32)-1:25] == 96)) begin
                                              if ((in_[(25)-1:20] == 0)) begin
                                                out = FCVTWS;
                                              end
                                              else begin
                                              end
                                            end
                                            else begin
                                              if ((in_[(32)-1:25] == 112)) begin
                                                if ((in_[(25)-1:20] == 0)) begin
                                                  if ((in_[(15)-1:12] == 0)) begin
                                                    out = FMVXW;
                                                  end
                                                  else begin
                                                  end
                                                end
                                                else begin
                                                end
                                              end
                                              else begin
                                                if ((in_[(32)-1:25] == 80)) begin
                                                  if ((in_[(15)-1:12] == 2)) begin
                                                    out = FEQS;
                                                  end
                                                  else begin
                                                    if ((in_[(15)-1:12] == 1)) begin
                                                      out = FLTS;
                                                    end
                                                    else begin
                                                      if ((in_[(15)-1:12] == 0)) begin
                                                        out = FLES;
                                                      end
                                                      else begin
                                                      end
                                                    end
                                                  end
                                                end
                                                else begin
                                                  if ((in_[(32)-1:25] == 104)) begin
                                                    if ((in_[(25)-1:20] == 0)) begin
                                                      out = FCVTSW;
                                                    end
                                                    else begin
                                                    end
                                                  end
                                                  else begin
                                                    if ((in_[(32)-1:25] == 120)) begin
                                                      if ((in_[(25)-1:20] == 0)) begin
                                                        if ((in_[(15)-1:12] == 0)) begin
                                                          out = FMVWX;
                                                        end
                                                        else begin
                                                        end
                                                      end
                                                      else begin
                                                      end
                                                    end
                                                    else begin
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                                else begin
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end


endmodule // DecodeInstType_0x477004d1d8d485d1
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371fd9c702249db
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 74}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371fd9c702249db
(
  input  wire [   0:0] clk,
  output wire [  73:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  73:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   0:0] full,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$bypass_mux_sel;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$deq_val;
  wire   [   0:0] ctrl$full;
  wire   [   0:0] ctrl$enq_rdy;

  SingleElementBypassQueueCtrl_0x10bc624c3d616f27 ctrl
  (
    .clk            ( ctrl$clk ),
    .enq_val        ( ctrl$enq_val ),
    .reset          ( ctrl$reset ),
    .deq_rdy        ( ctrl$deq_rdy ),
    .bypass_mux_sel ( ctrl$bypass_mux_sel ),
    .wen            ( ctrl$wen ),
    .deq_val        ( ctrl$deq_val ),
    .full           ( ctrl$full ),
    .enq_rdy        ( ctrl$enq_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$bypass_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  73:0] dpath$enq_bits;
  wire   [  73:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371fd9c702249db dpath
  (
    .wen            ( dpath$wen ),
    .bypass_mux_sel ( dpath$bypass_mux_sel ),
    .clk            ( dpath$clk ),
    .reset          ( dpath$reset ),
    .enq_bits       ( dpath$enq_bits ),
    .deq_bits       ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk             = clk;
  assign ctrl$deq_rdy         = deq_rdy;
  assign ctrl$enq_val         = enq_val;
  assign ctrl$reset           = reset;
  assign deq_msg              = dpath$deq_bits;
  assign deq_val              = ctrl$deq_val;
  assign dpath$bypass_mux_sel = ctrl$bypass_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$enq_bits       = enq_msg;
  assign dpath$reset          = reset;
  assign dpath$wen            = ctrl$wen;
  assign enq_rdy              = ctrl$enq_rdy;
  assign full                 = ctrl$full;



endmodule // SingleElementBypassQueue_0x371fd9c702249db
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueDpath_0x371fd9c702249db
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 74}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371fd9c702249db
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  73:0] deq_bits,
  input  wire [  73:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  73:0] bypass_mux$in_$000;
  wire   [  73:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  73:0] bypass_mux$out;

  Mux_0x38a4d59f5b72575b bypass_mux
  (
    .reset   ( bypass_mux$reset ),
    .in_$000 ( bypass_mux$in_$000 ),
    .in_$001 ( bypass_mux$in_$001 ),
    .clk     ( bypass_mux$clk ),
    .sel     ( bypass_mux$sel ),
    .out     ( bypass_mux$out )
  );

  // queue temporaries
  wire   [   0:0] queue$reset;
  wire   [  73:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  73:0] queue$out;

  RegEn_0x33930f124c01484 queue
  (
    .reset ( queue$reset ),
    .in_   ( queue$in_ ),
    .clk   ( queue$clk ),
    .en    ( queue$en ),
    .out   ( queue$out )
  );

  // signal connections
  assign bypass_mux$clk     = clk;
  assign bypass_mux$in_$000 = queue$out;
  assign bypass_mux$in_$001 = enq_bits;
  assign bypass_mux$reset   = reset;
  assign bypass_mux$sel     = bypass_mux_sel;
  assign deq_bits           = bypass_mux$out;
  assign queue$clk          = clk;
  assign queue$en           = wen;
  assign queue$in_          = enq_bits;
  assign queue$reset        = reset;



endmodule // SingleElementBypassQueueDpath_0x371fd9c702249db
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x38a4d59f5b72575b
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 74, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x38a4d59f5b72575b
(
  input  wire [   0:0] clk,
  input  wire [  73:0] in_$000,
  input  wire [  73:0] in_$001,
  output reg  [  73:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  73:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x38a4d59f5b72575b
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x33930f124c01484
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 74}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x33930f124c01484
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  73:0] in_,
  output reg  [  73:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x33930f124c01484
`default_nettype wire

//-----------------------------------------------------------------------------
// DropUnitPRTL_0x219cef4ae91b957
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.DropUnitPRTL {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module DropUnitPRTL_0x219cef4ae91b957
(
  input  wire [   0:0] clk,
  input  wire [   0:0] drop,
  input  wire [  31:0] in__msg,
  output reg  [   0:0] in__rdy,
  input  wire [   0:0] in__val,
  output wire [  31:0] out_msg,
  input  wire [   0:0] out_rdy,
  output reg  [   0:0] out_val,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   0:0] do_wait__0;
  reg    [   0:0] in_go__0;
  reg    [   0:0] snoop_state$in_;

  // localparam declarations
  localparam SNOOP = 0;
  localparam WAIT = 1;

  // snoop_state temporaries
  wire   [   0:0] snoop_state$reset;
  wire   [   0:0] snoop_state$clk;
  wire   [   0:0] snoop_state$out;

  RegRst_0x3f928fe66716045e snoop_state
  (
    .reset ( snoop_state$reset ),
    .in_   ( snoop_state$in_ ),
    .clk   ( snoop_state$clk ),
    .out   ( snoop_state$out )
  );

  // signal connections
  assign out_msg           = in__msg;
  assign snoop_state$clk   = clk;
  assign snoop_state$reset = reset;


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def state_transitions():
  //
  //       in_go   = s.in_.rdy and s.in_.val
  //       do_wait = s.drop    and not in_go
  //
  //       if s.snoop_state.out.value == SNOOP:
  //         if do_wait: s.snoop_state.in_.value = WAIT
  //         else:       s.snoop_state.in_.value = SNOOP
  //
  //       elif s.snoop_state.out == WAIT:
  //         if in_go: s.snoop_state.in_.value = SNOOP
  //         else:     s.snoop_state.in_.value = WAIT

  // logic for state_transitions()
  always @ (*) begin
    in_go__0 = (in__rdy&&in__val);
    do_wait__0 = (drop&&!in_go__0);
    if ((snoop_state$out == SNOOP)) begin
      if (do_wait__0) begin
        snoop_state$in_ = WAIT;
      end
      else begin
        snoop_state$in_ = SNOOP;
      end
    end
    else begin
      if ((snoop_state$out == WAIT)) begin
        if (in_go__0) begin
          snoop_state$in_ = SNOOP;
        end
        else begin
          snoop_state$in_ = WAIT;
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def set_outputs():
  //
  //       if   s.snoop_state.out == SNOOP:
  //         s.out.val.value = s.in_.val and not s.drop
  //         s.in_.rdy.value = s.out.rdy
  //
  //       elif s.snoop_state.out == WAIT:
  //         s.out.val.value = 0
  //         s.in_.rdy.value = 1

  // logic for set_outputs()
  always @ (*) begin
    if ((snoop_state$out == SNOOP)) begin
      out_val = (in__val&&!drop);
      in__rdy = out_rdy;
    end
    else begin
      if ((snoop_state$out == WAIT)) begin
        out_val = 0;
        in__rdy = 1;
      end
      else begin
      end
    end
  end


endmodule // DropUnitPRTL_0x219cef4ae91b957
`default_nettype wire

//-----------------------------------------------------------------------------
// RegRst_0x3f928fe66716045e
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 1, "reset_value": 0}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegRst_0x3f928fe66716045e
(
  input  wire [   0:0] clk,
  input  wire [   0:0] in_,
  output reg  [   0:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 0;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       else:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      out <= in_;
    end
  end


endmodule // RegRst_0x3f928fe66716045e
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371f9f91cd6eedb
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 38}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371f9f91cd6eedb
(
  input  wire [   0:0] clk,
  output wire [  37:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  37:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   0:0] full,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$bypass_mux_sel;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$deq_val;
  wire   [   0:0] ctrl$full;
  wire   [   0:0] ctrl$enq_rdy;

  SingleElementBypassQueueCtrl_0x10bc624c3d616f27 ctrl
  (
    .clk            ( ctrl$clk ),
    .enq_val        ( ctrl$enq_val ),
    .reset          ( ctrl$reset ),
    .deq_rdy        ( ctrl$deq_rdy ),
    .bypass_mux_sel ( ctrl$bypass_mux_sel ),
    .wen            ( ctrl$wen ),
    .deq_val        ( ctrl$deq_val ),
    .full           ( ctrl$full ),
    .enq_rdy        ( ctrl$enq_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$bypass_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  37:0] dpath$enq_bits;
  wire   [  37:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371f9f91cd6eedb dpath
  (
    .wen            ( dpath$wen ),
    .bypass_mux_sel ( dpath$bypass_mux_sel ),
    .clk            ( dpath$clk ),
    .reset          ( dpath$reset ),
    .enq_bits       ( dpath$enq_bits ),
    .deq_bits       ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk             = clk;
  assign ctrl$deq_rdy         = deq_rdy;
  assign ctrl$enq_val         = enq_val;
  assign ctrl$reset           = reset;
  assign deq_msg              = dpath$deq_bits;
  assign deq_val              = ctrl$deq_val;
  assign dpath$bypass_mux_sel = ctrl$bypass_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$enq_bits       = enq_msg;
  assign dpath$reset          = reset;
  assign dpath$wen            = ctrl$wen;
  assign enq_rdy              = ctrl$enq_rdy;
  assign full                 = ctrl$full;



endmodule // SingleElementBypassQueue_0x371f9f91cd6eedb
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueDpath_0x371f9f91cd6eedb
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 38}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371f9f91cd6eedb
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  37:0] deq_bits,
  input  wire [  37:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  37:0] bypass_mux$in_$000;
  wire   [  37:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  37:0] bypass_mux$out;

  Mux_0xfec1f50a6a4e91d bypass_mux
  (
    .reset   ( bypass_mux$reset ),
    .in_$000 ( bypass_mux$in_$000 ),
    .in_$001 ( bypass_mux$in_$001 ),
    .clk     ( bypass_mux$clk ),
    .sel     ( bypass_mux$sel ),
    .out     ( bypass_mux$out )
  );

  // queue temporaries
  wire   [   0:0] queue$reset;
  wire   [  37:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  37:0] queue$out;

  RegEn_0x3392d4dd268de74 queue
  (
    .reset ( queue$reset ),
    .in_   ( queue$in_ ),
    .clk   ( queue$clk ),
    .en    ( queue$en ),
    .out   ( queue$out )
  );

  // signal connections
  assign bypass_mux$clk     = clk;
  assign bypass_mux$in_$000 = queue$out;
  assign bypass_mux$in_$001 = enq_bits;
  assign bypass_mux$reset   = reset;
  assign bypass_mux$sel     = bypass_mux_sel;
  assign deq_bits           = bypass_mux$out;
  assign queue$clk          = clk;
  assign queue$en           = wen;
  assign queue$in_          = enq_bits;
  assign queue$reset        = reset;



endmodule // SingleElementBypassQueueDpath_0x371f9f91cd6eedb
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0xfec1f50a6a4e91d
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 38, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0xfec1f50a6a4e91d
(
  input  wire [   0:0] clk,
  input  wire [  37:0] in_$000,
  input  wire [  37:0] in_$001,
  output reg  [  37:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  37:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0xfec1f50a6a4e91d
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x3392d4dd268de74
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 38}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x3392d4dd268de74
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  37:0] in_,
  output reg  [  37:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x3392d4dd268de74
`default_nettype wire

//-----------------------------------------------------------------------------
// ProcDpathPRTL_0x4a10d55468bee90e
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcDpathPRTL {"num_cores": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module ProcDpathPRTL_0x4a10d55468bee90e
(
  input  wire [   3:0] alu_fn_X,
  output wire [   0:0] br_cond_eq_X,
  output wire [   0:0] br_cond_lt_X,
  output wire [   0:0] br_cond_ltu_X,
  input  wire [   0:0] clk,
  output wire [  31:0] commit_pc,
  input  wire [  31:0] core_id,
  input  wire [   1:0] csrr_sel_D,
  input  wire [   2:0] dm_resp_sel_M,
  output wire [  31:0] dmemreq_msg_addr,
  output wire [  31:0] dmemreq_msg_data,
  input  wire [  31:0] dmemresp_msg_data,
  input  wire [   1:0] ex_result_sel_X,
  output wire [  31:0] fpureq_msg_op_a,
  output wire [  31:0] fpureq_msg_op_b,
  input  wire [  31:0] fpuresp_msg,
  output reg  [  77:0] imemreq_msg,
  input  wire [  31:0] imemresp_msg_data,
  input  wire [   2:0] imm_type_D,
  output wire [  31:0] inst_D,
  output wire [  31:0] mdureq_msg_op_a,
  output wire [  31:0] mdureq_msg_op_b,
  input  wire [  31:0] mduresp_msg,
  input  wire [  31:0] mngr2proc_data,
  input  wire [   1:0] op1_byp_sel_D,
  input  wire [   0:0] op1_sel_D,
  input  wire [   1:0] op2_byp_sel_D,
  input  wire [   1:0] op2_sel_D,
  input  wire [   1:0] pc_sel_F,
  output wire [  31:0] proc2mngr_data,
  input  wire [   0:0] rd_fprf_W,
  input  wire [   0:0] reg_en_D,
  input  wire [   0:0] reg_en_F,
  input  wire [   0:0] reg_en_M,
  input  wire [   0:0] reg_en_W,
  input  wire [   0:0] reg_en_X,
  input  wire [   0:0] reset,
  input  wire [   4:0] rf_waddr_W,
  input  wire [   0:0] rf_wen_W,
  input  wire [   0:0] rs1_fprf_D,
  input  wire [   0:0] rs2_fprf_D,
  output reg  [   0:0] stats_en,
  input  wire [   0:0] stats_en_wen_W,
  input  wire [   1:0] wb_result_sel_M,
  output wire [  31:0] xcelreq_msg_data,
  output wire [   4:0] xcelreq_msg_raddr,
  input  wire [  31:0] xcelresp_msg_data
);

  // wire declarations
  wire   [  31:0] jalr_target_X;
  wire   [  31:0] rf_rdata1_D;
  wire   [  31:0] rf_wdata_W;
  wire   [  31:0] byp_data_W;
  wire   [  31:0] byp_data_X;
  wire   [  31:0] pc_plus4_F;
  wire   [  31:0] br_target_X;
  wire   [  31:0] rf_rdata0_D;
  wire   [  31:0] pc_F;
  wire   [  31:0] byp_data_M;
  wire   [  31:0] jal_target_D;


  // register declarations
  reg    [  31:0] dmemresp_msg_data_lb_M;
  reg    [  31:0] dmemresp_msg_data_lbu_M;
  reg    [  31:0] dmemresp_msg_data_lh_M;
  reg    [  31:0] dmemresp_msg_data_lhu_M;
  reg    [  31:0] dmemresp_msg_data_lw_M;
  reg    [  15:0] dmemresp_msg_data_truncated16_M;
  reg    [   7:0] dmemresp_msg_data_truncated8_M;
  reg    [   5:0] rf_rd_addr0;
  reg    [   5:0] rf_rd_addr1;
  reg    [   5:0] rf_wr_addr;

  // localparam declarations
  localparam TYPE_READ = 0;

  // dmem_write_data_reg_X temporaries
  wire   [   0:0] dmem_write_data_reg_X$reset;
  wire   [   0:0] dmem_write_data_reg_X$en;
  wire   [   0:0] dmem_write_data_reg_X$clk;
  wire   [  31:0] dmem_write_data_reg_X$in_;
  wire   [  31:0] dmem_write_data_reg_X$out;

  RegEnRst_0x5c03eb7daf20f305 dmem_write_data_reg_X
  (
    .reset ( dmem_write_data_reg_X$reset ),
    .en    ( dmem_write_data_reg_X$en ),
    .clk   ( dmem_write_data_reg_X$clk ),
    .in_   ( dmem_write_data_reg_X$in_ ),
    .out   ( dmem_write_data_reg_X$out )
  );

  // wb_result_reg_W temporaries
  wire   [   0:0] wb_result_reg_W$reset;
  wire   [   0:0] wb_result_reg_W$en;
  wire   [   0:0] wb_result_reg_W$clk;
  wire   [  31:0] wb_result_reg_W$in_;
  wire   [  31:0] wb_result_reg_W$out;

  RegEnRst_0x5c03eb7daf20f305 wb_result_reg_W
  (
    .reset ( wb_result_reg_W$reset ),
    .en    ( wb_result_reg_W$en ),
    .clk   ( wb_result_reg_W$clk ),
    .in_   ( wb_result_reg_W$in_ ),
    .out   ( wb_result_reg_W$out )
  );

  // op2_sel_mux_D temporaries
  wire   [   0:0] op2_sel_mux_D$reset;
  wire   [  31:0] op2_sel_mux_D$in_$000;
  wire   [  31:0] op2_sel_mux_D$in_$001;
  wire   [  31:0] op2_sel_mux_D$in_$002;
  wire   [   0:0] op2_sel_mux_D$clk;
  wire   [   1:0] op2_sel_mux_D$sel;
  wire   [  31:0] op2_sel_mux_D$out;

  Mux_0x4144ab3fc268acb4 op2_sel_mux_D
  (
    .reset   ( op2_sel_mux_D$reset ),
    .in_$000 ( op2_sel_mux_D$in_$000 ),
    .in_$001 ( op2_sel_mux_D$in_$001 ),
    .in_$002 ( op2_sel_mux_D$in_$002 ),
    .clk     ( op2_sel_mux_D$clk ),
    .sel     ( op2_sel_mux_D$sel ),
    .out     ( op2_sel_mux_D$out )
  );

  // pc_reg_X temporaries
  wire   [   0:0] pc_reg_X$reset;
  wire   [   0:0] pc_reg_X$en;
  wire   [   0:0] pc_reg_X$clk;
  wire   [  31:0] pc_reg_X$in_;
  wire   [  31:0] pc_reg_X$out;

  RegEnRst_0x5c03eb7daf20f305 pc_reg_X
  (
    .reset ( pc_reg_X$reset ),
    .en    ( pc_reg_X$en ),
    .clk   ( pc_reg_X$clk ),
    .in_   ( pc_reg_X$in_ ),
    .out   ( pc_reg_X$out )
  );

  // pc_reg_W temporaries
  wire   [   0:0] pc_reg_W$reset;
  wire   [   0:0] pc_reg_W$en;
  wire   [   0:0] pc_reg_W$clk;
  wire   [  31:0] pc_reg_W$in_;
  wire   [  31:0] pc_reg_W$out;

  RegEnRst_0x5c03eb7daf20f305 pc_reg_W
  (
    .reset ( pc_reg_W$reset ),
    .en    ( pc_reg_W$en ),
    .clk   ( pc_reg_W$clk ),
    .in_   ( pc_reg_W$in_ ),
    .out   ( pc_reg_W$out )
  );

  // csrr_sel_mux_D temporaries
  wire   [   0:0] csrr_sel_mux_D$reset;
  wire   [  31:0] csrr_sel_mux_D$in_$000;
  wire   [  31:0] csrr_sel_mux_D$in_$001;
  wire   [  31:0] csrr_sel_mux_D$in_$002;
  wire   [   0:0] csrr_sel_mux_D$clk;
  wire   [   1:0] csrr_sel_mux_D$sel;
  wire   [  31:0] csrr_sel_mux_D$out;

  Mux_0x4144ab3fc268acb4 csrr_sel_mux_D
  (
    .reset   ( csrr_sel_mux_D$reset ),
    .in_$000 ( csrr_sel_mux_D$in_$000 ),
    .in_$001 ( csrr_sel_mux_D$in_$001 ),
    .in_$002 ( csrr_sel_mux_D$in_$002 ),
    .clk     ( csrr_sel_mux_D$clk ),
    .sel     ( csrr_sel_mux_D$sel ),
    .out     ( csrr_sel_mux_D$out )
  );

  // pc_reg_M temporaries
  wire   [   0:0] pc_reg_M$reset;
  wire   [   0:0] pc_reg_M$en;
  wire   [   0:0] pc_reg_M$clk;
  wire   [  31:0] pc_reg_M$in_;
  wire   [  31:0] pc_reg_M$out;

  RegEnRst_0x5c03eb7daf20f305 pc_reg_M
  (
    .reset ( pc_reg_M$reset ),
    .en    ( pc_reg_M$en ),
    .clk   ( pc_reg_M$clk ),
    .in_   ( pc_reg_M$in_ ),
    .out   ( pc_reg_M$out )
  );

  // pc_reg_D temporaries
  wire   [   0:0] pc_reg_D$reset;
  wire   [   0:0] pc_reg_D$en;
  wire   [   0:0] pc_reg_D$clk;
  wire   [  31:0] pc_reg_D$in_;
  wire   [  31:0] pc_reg_D$out;

  RegEnRst_0x5c03eb7daf20f305 pc_reg_D
  (
    .reset ( pc_reg_D$reset ),
    .en    ( pc_reg_D$en ),
    .clk   ( pc_reg_D$clk ),
    .in_   ( pc_reg_D$in_ ),
    .out   ( pc_reg_D$out )
  );

  // pc_reg_F temporaries
  wire   [   0:0] pc_reg_F$reset;
  wire   [   0:0] pc_reg_F$en;
  wire   [   0:0] pc_reg_F$clk;
  wire   [  31:0] pc_reg_F$in_;
  wire   [  31:0] pc_reg_F$out;

  RegEnRst_0x574b81e599753a8a pc_reg_F
  (
    .reset ( pc_reg_F$reset ),
    .en    ( pc_reg_F$en ),
    .clk   ( pc_reg_F$clk ),
    .in_   ( pc_reg_F$in_ ),
    .out   ( pc_reg_F$out )
  );

  // op1_reg_X temporaries
  wire   [   0:0] op1_reg_X$reset;
  wire   [   0:0] op1_reg_X$en;
  wire   [   0:0] op1_reg_X$clk;
  wire   [  31:0] op1_reg_X$in_;
  wire   [  31:0] op1_reg_X$out;

  RegEnRst_0x5c03eb7daf20f305 op1_reg_X
  (
    .reset ( op1_reg_X$reset ),
    .en    ( op1_reg_X$en ),
    .clk   ( op1_reg_X$clk ),
    .in_   ( op1_reg_X$in_ ),
    .out   ( op1_reg_X$out )
  );

  // alu_X temporaries
  wire   [   0:0] alu_X$clk;
  wire   [  31:0] alu_X$in0;
  wire   [  31:0] alu_X$in1;
  wire   [   3:0] alu_X$fn;
  wire   [   0:0] alu_X$reset;
  wire   [   0:0] alu_X$ops_lt;
  wire   [   0:0] alu_X$ops_ltu;
  wire   [  31:0] alu_X$out;
  wire   [   0:0] alu_X$ops_eq;

  AluPRTL_0x6f5034674aabb7c alu_X
  (
    .clk     ( alu_X$clk ),
    .in0     ( alu_X$in0 ),
    .in1     ( alu_X$in1 ),
    .fn      ( alu_X$fn ),
    .reset   ( alu_X$reset ),
    .ops_lt  ( alu_X$ops_lt ),
    .ops_ltu ( alu_X$ops_ltu ),
    .out     ( alu_X$out ),
    .ops_eq  ( alu_X$ops_eq )
  );

  // op2_byp_mux_D temporaries
  wire   [   0:0] op2_byp_mux_D$reset;
  wire   [  31:0] op2_byp_mux_D$in_$000;
  wire   [  31:0] op2_byp_mux_D$in_$001;
  wire   [  31:0] op2_byp_mux_D$in_$002;
  wire   [  31:0] op2_byp_mux_D$in_$003;
  wire   [   0:0] op2_byp_mux_D$clk;
  wire   [   1:0] op2_byp_mux_D$sel;
  wire   [  31:0] op2_byp_mux_D$out;

  Mux_0x4144ab3fc2596af7 op2_byp_mux_D
  (
    .reset   ( op2_byp_mux_D$reset ),
    .in_$000 ( op2_byp_mux_D$in_$000 ),
    .in_$001 ( op2_byp_mux_D$in_$001 ),
    .in_$002 ( op2_byp_mux_D$in_$002 ),
    .in_$003 ( op2_byp_mux_D$in_$003 ),
    .clk     ( op2_byp_mux_D$clk ),
    .sel     ( op2_byp_mux_D$sel ),
    .out     ( op2_byp_mux_D$out )
  );

  // ex_result_sel_mux_X temporaries
  wire   [   0:0] ex_result_sel_mux_X$reset;
  wire   [  31:0] ex_result_sel_mux_X$in_$000;
  wire   [  31:0] ex_result_sel_mux_X$in_$001;
  wire   [  31:0] ex_result_sel_mux_X$in_$002;
  wire   [  31:0] ex_result_sel_mux_X$in_$003;
  wire   [   0:0] ex_result_sel_mux_X$clk;
  wire   [   1:0] ex_result_sel_mux_X$sel;
  wire   [  31:0] ex_result_sel_mux_X$out;

  Mux_0x4144ab3fc2596af7 ex_result_sel_mux_X
  (
    .reset   ( ex_result_sel_mux_X$reset ),
    .in_$000 ( ex_result_sel_mux_X$in_$000 ),
    .in_$001 ( ex_result_sel_mux_X$in_$001 ),
    .in_$002 ( ex_result_sel_mux_X$in_$002 ),
    .in_$003 ( ex_result_sel_mux_X$in_$003 ),
    .clk     ( ex_result_sel_mux_X$clk ),
    .sel     ( ex_result_sel_mux_X$sel ),
    .out     ( ex_result_sel_mux_X$out )
  );

  // op2_reg_X temporaries
  wire   [   0:0] op2_reg_X$reset;
  wire   [   0:0] op2_reg_X$en;
  wire   [   0:0] op2_reg_X$clk;
  wire   [  31:0] op2_reg_X$in_;
  wire   [  31:0] op2_reg_X$out;

  RegEnRst_0x5c03eb7daf20f305 op2_reg_X
  (
    .reset ( op2_reg_X$reset ),
    .en    ( op2_reg_X$en ),
    .clk   ( op2_reg_X$clk ),
    .in_   ( op2_reg_X$in_ ),
    .out   ( op2_reg_X$out )
  );

  // stats_en_reg_W temporaries
  wire   [   0:0] stats_en_reg_W$reset;
  wire   [   0:0] stats_en_reg_W$en;
  wire   [   0:0] stats_en_reg_W$clk;
  wire   [  31:0] stats_en_reg_W$in_;
  wire   [  31:0] stats_en_reg_W$out;

  RegEnRst_0x5c03eb7daf20f305 stats_en_reg_W
  (
    .reset ( stats_en_reg_W$reset ),
    .en    ( stats_en_reg_W$en ),
    .clk   ( stats_en_reg_W$clk ),
    .in_   ( stats_en_reg_W$in_ ),
    .out   ( stats_en_reg_W$out )
  );

  // rf temporaries
  wire   [   5:0] rf$rd_addr$000;
  wire   [   5:0] rf$rd_addr$001;
  wire   [  31:0] rf$wr_data;
  wire   [   0:0] rf$clk;
  wire   [   5:0] rf$wr_addr;
  wire   [   0:0] rf$wr_en;
  wire   [   0:0] rf$reset;
  wire   [  31:0] rf$rd_data$000;
  wire   [  31:0] rf$rd_data$001;

  RegisterFile_0x7d3ddfc61c4b8238 rf
  (
    .rd_addr$000 ( rf$rd_addr$000 ),
    .rd_addr$001 ( rf$rd_addr$001 ),
    .wr_data     ( rf$wr_data ),
    .clk         ( rf$clk ),
    .wr_addr     ( rf$wr_addr ),
    .wr_en       ( rf$wr_en ),
    .reset       ( rf$reset ),
    .rd_data$000 ( rf$rd_data$000 ),
    .rd_data$001 ( rf$rd_data$001 )
  );

  // pc_sel_mux_F temporaries
  wire   [   0:0] pc_sel_mux_F$reset;
  wire   [  31:0] pc_sel_mux_F$in_$000;
  wire   [  31:0] pc_sel_mux_F$in_$001;
  wire   [  31:0] pc_sel_mux_F$in_$002;
  wire   [  31:0] pc_sel_mux_F$in_$003;
  wire   [   0:0] pc_sel_mux_F$clk;
  wire   [   1:0] pc_sel_mux_F$sel;
  wire   [  31:0] pc_sel_mux_F$out;

  Mux_0x4144ab3fc2596af7 pc_sel_mux_F
  (
    .reset   ( pc_sel_mux_F$reset ),
    .in_$000 ( pc_sel_mux_F$in_$000 ),
    .in_$001 ( pc_sel_mux_F$in_$001 ),
    .in_$002 ( pc_sel_mux_F$in_$002 ),
    .in_$003 ( pc_sel_mux_F$in_$003 ),
    .clk     ( pc_sel_mux_F$clk ),
    .sel     ( pc_sel_mux_F$sel ),
    .out     ( pc_sel_mux_F$out )
  );

  // wb_result_sel_mux_M temporaries
  wire   [   0:0] wb_result_sel_mux_M$reset;
  wire   [  31:0] wb_result_sel_mux_M$in_$000;
  wire   [  31:0] wb_result_sel_mux_M$in_$001;
  wire   [  31:0] wb_result_sel_mux_M$in_$002;
  wire   [   0:0] wb_result_sel_mux_M$clk;
  wire   [   1:0] wb_result_sel_mux_M$sel;
  wire   [  31:0] wb_result_sel_mux_M$out;

  Mux_0x4144ab3fc268acb4 wb_result_sel_mux_M
  (
    .reset   ( wb_result_sel_mux_M$reset ),
    .in_$000 ( wb_result_sel_mux_M$in_$000 ),
    .in_$001 ( wb_result_sel_mux_M$in_$001 ),
    .in_$002 ( wb_result_sel_mux_M$in_$002 ),
    .clk     ( wb_result_sel_mux_M$clk ),
    .sel     ( wb_result_sel_mux_M$sel ),
    .out     ( wb_result_sel_mux_M$out )
  );

  // pc_incr_X temporaries
  wire   [   0:0] pc_incr_X$reset;
  wire   [  31:0] pc_incr_X$in_;
  wire   [   0:0] pc_incr_X$clk;
  wire   [  31:0] pc_incr_X$out;

  Incrementer_0x64b7d65fea759127 pc_incr_X
  (
    .reset ( pc_incr_X$reset ),
    .in_   ( pc_incr_X$in_ ),
    .clk   ( pc_incr_X$clk ),
    .out   ( pc_incr_X$out )
  );

  // op1_byp_mux_D temporaries
  wire   [   0:0] op1_byp_mux_D$reset;
  wire   [  31:0] op1_byp_mux_D$in_$000;
  wire   [  31:0] op1_byp_mux_D$in_$001;
  wire   [  31:0] op1_byp_mux_D$in_$002;
  wire   [  31:0] op1_byp_mux_D$in_$003;
  wire   [   0:0] op1_byp_mux_D$clk;
  wire   [   1:0] op1_byp_mux_D$sel;
  wire   [  31:0] op1_byp_mux_D$out;

  Mux_0x4144ab3fc2596af7 op1_byp_mux_D
  (
    .reset   ( op1_byp_mux_D$reset ),
    .in_$000 ( op1_byp_mux_D$in_$000 ),
    .in_$001 ( op1_byp_mux_D$in_$001 ),
    .in_$002 ( op1_byp_mux_D$in_$002 ),
    .in_$003 ( op1_byp_mux_D$in_$003 ),
    .clk     ( op1_byp_mux_D$clk ),
    .sel     ( op1_byp_mux_D$sel ),
    .out     ( op1_byp_mux_D$out )
  );

  // pc_incr_F temporaries
  wire   [   0:0] pc_incr_F$reset;
  wire   [  31:0] pc_incr_F$in_;
  wire   [   0:0] pc_incr_F$clk;
  wire   [  31:0] pc_incr_F$out;

  Incrementer_0x64b7d65fea759127 pc_incr_F
  (
    .reset ( pc_incr_F$reset ),
    .in_   ( pc_incr_F$in_ ),
    .clk   ( pc_incr_F$clk ),
    .out   ( pc_incr_F$out )
  );

  // pc_plus_imm_D temporaries
  wire   [   0:0] pc_plus_imm_D$clk;
  wire   [  31:0] pc_plus_imm_D$in0;
  wire   [  31:0] pc_plus_imm_D$in1;
  wire   [   0:0] pc_plus_imm_D$reset;
  wire   [   0:0] pc_plus_imm_D$cin;
  wire   [   0:0] pc_plus_imm_D$cout;
  wire   [  31:0] pc_plus_imm_D$out;

  Adder_0x2d6e5ef952489e2 pc_plus_imm_D
  (
    .clk   ( pc_plus_imm_D$clk ),
    .in0   ( pc_plus_imm_D$in0 ),
    .in1   ( pc_plus_imm_D$in1 ),
    .reset ( pc_plus_imm_D$reset ),
    .cin   ( pc_plus_imm_D$cin ),
    .cout  ( pc_plus_imm_D$cout ),
    .out   ( pc_plus_imm_D$out )
  );

  // imm_gen_D temporaries
  wire   [   2:0] imm_gen_D$imm_type;
  wire   [   0:0] imm_gen_D$clk;
  wire   [  31:0] imm_gen_D$inst;
  wire   [   0:0] imm_gen_D$reset;
  wire   [  31:0] imm_gen_D$imm;

  ImmGenPRTL_0x6f5034674aabb7c imm_gen_D
  (
    .imm_type ( imm_gen_D$imm_type ),
    .clk      ( imm_gen_D$clk ),
    .inst     ( imm_gen_D$inst ),
    .reset    ( imm_gen_D$reset ),
    .imm      ( imm_gen_D$imm )
  );

  // op1_sel_mux_D temporaries
  wire   [   0:0] op1_sel_mux_D$reset;
  wire   [  31:0] op1_sel_mux_D$in_$000;
  wire   [  31:0] op1_sel_mux_D$in_$001;
  wire   [   0:0] op1_sel_mux_D$clk;
  wire   [   0:0] op1_sel_mux_D$sel;
  wire   [  31:0] op1_sel_mux_D$out;

  Mux_0x4144ab3fc277ef7d op1_sel_mux_D
  (
    .reset   ( op1_sel_mux_D$reset ),
    .in_$000 ( op1_sel_mux_D$in_$000 ),
    .in_$001 ( op1_sel_mux_D$in_$001 ),
    .clk     ( op1_sel_mux_D$clk ),
    .sel     ( op1_sel_mux_D$sel ),
    .out     ( op1_sel_mux_D$out )
  );

  // dmemresp_mux_M temporaries
  wire   [   0:0] dmemresp_mux_M$reset;
  wire   [  31:0] dmemresp_mux_M$in_$000;
  wire   [  31:0] dmemresp_mux_M$in_$001;
  wire   [  31:0] dmemresp_mux_M$in_$002;
  wire   [  31:0] dmemresp_mux_M$in_$003;
  wire   [  31:0] dmemresp_mux_M$in_$004;
  wire   [   0:0] dmemresp_mux_M$clk;
  wire   [   2:0] dmemresp_mux_M$sel;
  wire   [  31:0] dmemresp_mux_M$out;

  Mux_0x4144ab3fc24a2836 dmemresp_mux_M
  (
    .reset   ( dmemresp_mux_M$reset ),
    .in_$000 ( dmemresp_mux_M$in_$000 ),
    .in_$001 ( dmemresp_mux_M$in_$001 ),
    .in_$002 ( dmemresp_mux_M$in_$002 ),
    .in_$003 ( dmemresp_mux_M$in_$003 ),
    .in_$004 ( dmemresp_mux_M$in_$004 ),
    .clk     ( dmemresp_mux_M$clk ),
    .sel     ( dmemresp_mux_M$sel ),
    .out     ( dmemresp_mux_M$out )
  );

  // br_target_reg_X temporaries
  wire   [   0:0] br_target_reg_X$reset;
  wire   [   0:0] br_target_reg_X$en;
  wire   [   0:0] br_target_reg_X$clk;
  wire   [  31:0] br_target_reg_X$in_;
  wire   [  31:0] br_target_reg_X$out;

  RegEnRst_0x5c03eb7daf20f305 br_target_reg_X
  (
    .reset ( br_target_reg_X$reset ),
    .en    ( br_target_reg_X$en ),
    .clk   ( br_target_reg_X$clk ),
    .in_   ( br_target_reg_X$in_ ),
    .out   ( br_target_reg_X$out )
  );

  // ex_result_reg_M temporaries
  wire   [   0:0] ex_result_reg_M$reset;
  wire   [   0:0] ex_result_reg_M$en;
  wire   [   0:0] ex_result_reg_M$clk;
  wire   [  31:0] ex_result_reg_M$in_;
  wire   [  31:0] ex_result_reg_M$out;

  RegEnRst_0x5c03eb7daf20f305 ex_result_reg_M
  (
    .reset ( ex_result_reg_M$reset ),
    .en    ( ex_result_reg_M$en ),
    .clk   ( ex_result_reg_M$clk ),
    .in_   ( ex_result_reg_M$in_ ),
    .out   ( ex_result_reg_M$out )
  );

  // inst_D_reg temporaries
  wire   [   0:0] inst_D_reg$reset;
  wire   [   0:0] inst_D_reg$en;
  wire   [   0:0] inst_D_reg$clk;
  wire   [  31:0] inst_D_reg$in_;
  wire   [  31:0] inst_D_reg$out;

  RegEnRst_0x5c03eb7daf20f305 inst_D_reg
  (
    .reset ( inst_D_reg$reset ),
    .en    ( inst_D_reg$en ),
    .clk   ( inst_D_reg$clk ),
    .in_   ( inst_D_reg$in_ ),
    .out   ( inst_D_reg$out )
  );

  // signal connections
  assign alu_X$clk                   = clk;
  assign alu_X$fn                    = alu_fn_X;
  assign alu_X$in0                   = op1_reg_X$out;
  assign alu_X$in1                   = op2_reg_X$out;
  assign alu_X$reset                 = reset;
  assign br_cond_eq_X                = alu_X$ops_eq;
  assign br_cond_lt_X                = alu_X$ops_lt;
  assign br_cond_ltu_X               = alu_X$ops_ltu;
  assign br_target_X                 = br_target_reg_X$out;
  assign br_target_reg_X$clk         = clk;
  assign br_target_reg_X$en          = reg_en_X;
  assign br_target_reg_X$in_         = pc_plus_imm_D$out;
  assign br_target_reg_X$reset       = reset;
  assign byp_data_M                  = wb_result_sel_mux_M$out;
  assign byp_data_W                  = wb_result_reg_W$out;
  assign byp_data_X                  = ex_result_sel_mux_X$out;
  assign commit_pc                   = pc_reg_W$out;
  assign csrr_sel_mux_D$clk          = clk;
  assign csrr_sel_mux_D$in_$000      = mngr2proc_data;
  assign csrr_sel_mux_D$in_$001      = 32'd1;
  assign csrr_sel_mux_D$in_$002      = core_id;
  assign csrr_sel_mux_D$reset        = reset;
  assign csrr_sel_mux_D$sel          = csrr_sel_D;
  assign dmem_write_data_reg_X$clk   = clk;
  assign dmem_write_data_reg_X$en    = reg_en_X;
  assign dmem_write_data_reg_X$in_   = op2_byp_mux_D$out;
  assign dmem_write_data_reg_X$reset = reset;
  assign dmemreq_msg_addr            = alu_X$out;
  assign dmemreq_msg_data            = dmem_write_data_reg_X$out;
  assign dmemresp_mux_M$clk          = clk;
  assign dmemresp_mux_M$in_$000      = dmemresp_msg_data_lb_M;
  assign dmemresp_mux_M$in_$001      = dmemresp_msg_data_lh_M;
  assign dmemresp_mux_M$in_$002      = dmemresp_msg_data_lw_M;
  assign dmemresp_mux_M$in_$003      = dmemresp_msg_data_lbu_M;
  assign dmemresp_mux_M$in_$004      = dmemresp_msg_data_lhu_M;
  assign dmemresp_mux_M$reset        = reset;
  assign dmemresp_mux_M$sel          = dm_resp_sel_M;
  assign ex_result_reg_M$clk         = clk;
  assign ex_result_reg_M$en          = reg_en_M;
  assign ex_result_reg_M$in_         = ex_result_sel_mux_X$out;
  assign ex_result_reg_M$reset       = reset;
  assign ex_result_sel_mux_X$clk     = clk;
  assign ex_result_sel_mux_X$in_$000 = alu_X$out;
  assign ex_result_sel_mux_X$in_$001 = mduresp_msg;
  assign ex_result_sel_mux_X$in_$002 = pc_incr_X$out;
  assign ex_result_sel_mux_X$in_$003 = fpuresp_msg;
  assign ex_result_sel_mux_X$reset   = reset;
  assign ex_result_sel_mux_X$sel     = ex_result_sel_X;
  assign fpureq_msg_op_a             = op1_sel_mux_D$out;
  assign fpureq_msg_op_b             = op2_sel_mux_D$out;
  assign imm_gen_D$clk               = clk;
  assign imm_gen_D$imm_type          = imm_type_D;
  assign imm_gen_D$inst              = inst_D;
  assign imm_gen_D$reset             = reset;
  assign inst_D                      = inst_D_reg$out;
  assign inst_D_reg$clk              = clk;
  assign inst_D_reg$en               = reg_en_D;
  assign inst_D_reg$in_              = imemresp_msg_data;
  assign inst_D_reg$reset            = reset;
  assign jal_target_D                = pc_plus_imm_D$out;
  assign jalr_target_X               = alu_X$out;
  assign mdureq_msg_op_a             = op1_sel_mux_D$out;
  assign mdureq_msg_op_b             = op2_sel_mux_D$out;
  assign op1_byp_mux_D$clk           = clk;
  assign op1_byp_mux_D$in_$000       = rf_rdata0_D;
  assign op1_byp_mux_D$in_$001       = byp_data_X;
  assign op1_byp_mux_D$in_$002       = byp_data_M;
  assign op1_byp_mux_D$in_$003       = byp_data_W;
  assign op1_byp_mux_D$reset         = reset;
  assign op1_byp_mux_D$sel           = op1_byp_sel_D;
  assign op1_reg_X$clk               = clk;
  assign op1_reg_X$en                = reg_en_X;
  assign op1_reg_X$in_               = op1_sel_mux_D$out;
  assign op1_reg_X$reset             = reset;
  assign op1_sel_mux_D$clk           = clk;
  assign op1_sel_mux_D$in_$000       = op1_byp_mux_D$out;
  assign op1_sel_mux_D$in_$001       = pc_reg_D$out;
  assign op1_sel_mux_D$reset         = reset;
  assign op1_sel_mux_D$sel           = op1_sel_D;
  assign op2_byp_mux_D$clk           = clk;
  assign op2_byp_mux_D$in_$000       = rf_rdata1_D;
  assign op2_byp_mux_D$in_$001       = byp_data_X;
  assign op2_byp_mux_D$in_$002       = byp_data_M;
  assign op2_byp_mux_D$in_$003       = byp_data_W;
  assign op2_byp_mux_D$reset         = reset;
  assign op2_byp_mux_D$sel           = op2_byp_sel_D;
  assign op2_reg_X$clk               = clk;
  assign op2_reg_X$en                = reg_en_X;
  assign op2_reg_X$in_               = op2_sel_mux_D$out;
  assign op2_reg_X$reset             = reset;
  assign op2_sel_mux_D$clk           = clk;
  assign op2_sel_mux_D$in_$000       = op2_byp_mux_D$out;
  assign op2_sel_mux_D$in_$001       = imm_gen_D$imm;
  assign op2_sel_mux_D$in_$002       = csrr_sel_mux_D$out;
  assign op2_sel_mux_D$reset         = reset;
  assign op2_sel_mux_D$sel           = op2_sel_D;
  assign pc_F                        = pc_reg_F$out;
  assign pc_incr_F$clk               = clk;
  assign pc_incr_F$in_               = pc_F;
  assign pc_incr_F$reset             = reset;
  assign pc_incr_X$clk               = clk;
  assign pc_incr_X$in_               = pc_reg_X$out;
  assign pc_incr_X$reset             = reset;
  assign pc_plus4_F                  = pc_incr_F$out;
  assign pc_plus_imm_D$cin           = 1'd0;
  assign pc_plus_imm_D$clk           = clk;
  assign pc_plus_imm_D$in0           = pc_reg_D$out;
  assign pc_plus_imm_D$in1           = imm_gen_D$imm;
  assign pc_plus_imm_D$reset         = reset;
  assign pc_reg_D$clk                = clk;
  assign pc_reg_D$en                 = reg_en_D;
  assign pc_reg_D$in_                = pc_F;
  assign pc_reg_D$reset              = reset;
  assign pc_reg_F$clk                = clk;
  assign pc_reg_F$en                 = reg_en_F;
  assign pc_reg_F$in_                = pc_sel_mux_F$out;
  assign pc_reg_F$reset              = reset;
  assign pc_reg_M$clk                = clk;
  assign pc_reg_M$en                 = reg_en_M;
  assign pc_reg_M$in_                = pc_reg_X$out;
  assign pc_reg_M$reset              = reset;
  assign pc_reg_W$clk                = clk;
  assign pc_reg_W$en                 = reg_en_W;
  assign pc_reg_W$in_                = pc_reg_M$out;
  assign pc_reg_W$reset              = reset;
  assign pc_reg_X$clk                = clk;
  assign pc_reg_X$en                 = reg_en_X;
  assign pc_reg_X$in_                = pc_reg_D$out;
  assign pc_reg_X$reset              = reset;
  assign pc_sel_mux_F$clk            = clk;
  assign pc_sel_mux_F$in_$000        = pc_plus4_F;
  assign pc_sel_mux_F$in_$001        = br_target_X;
  assign pc_sel_mux_F$in_$002        = jal_target_D;
  assign pc_sel_mux_F$in_$003        = jalr_target_X;
  assign pc_sel_mux_F$reset          = reset;
  assign pc_sel_mux_F$sel            = pc_sel_F;
  assign proc2mngr_data              = wb_result_reg_W$out;
  assign rf$clk                      = clk;
  assign rf$rd_addr$000              = rf_rd_addr0;
  assign rf$rd_addr$001              = rf_rd_addr1;
  assign rf$reset                    = reset;
  assign rf$wr_addr                  = rf_wr_addr;
  assign rf$wr_data                  = rf_wdata_W;
  assign rf$wr_en                    = rf_wen_W;
  assign rf_rdata0_D                 = rf$rd_data$000;
  assign rf_rdata1_D                 = rf$rd_data$001;
  assign rf_wdata_W                  = wb_result_reg_W$out;
  assign stats_en_reg_W$clk          = clk;
  assign stats_en_reg_W$en           = stats_en_wen_W;
  assign stats_en_reg_W$in_          = wb_result_reg_W$out;
  assign stats_en_reg_W$reset        = reset;
  assign wb_result_reg_W$clk         = clk;
  assign wb_result_reg_W$en          = reg_en_W;
  assign wb_result_reg_W$in_         = wb_result_sel_mux_M$out;
  assign wb_result_reg_W$reset       = reset;
  assign wb_result_sel_mux_M$clk     = clk;
  assign wb_result_sel_mux_M$in_$000 = ex_result_reg_M$out;
  assign wb_result_sel_mux_M$in_$001 = dmemresp_mux_M$out;
  assign wb_result_sel_mux_M$in_$002 = xcelresp_msg_data;
  assign wb_result_sel_mux_M$reset   = reset;
  assign wb_result_sel_mux_M$sel     = wb_result_sel_M;
  assign xcelreq_msg_data            = op1_reg_X$out;
  assign xcelreq_msg_raddr           = op2_reg_X$out[4:0];


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def imem_req_F():
  //       s.imemreq_msg.type_.value  = MemReqMsg4B.TYPE_READ
  //       s.imemreq_msg.len.value    = 0
  //       s.imemreq_msg.addr.value   = s.pc_sel_mux_F.out
  //       s.imemreq_msg.data.value   = 0
  //       s.imemreq_msg.opaque.value = 0

  // logic for imem_req_F()
  always @ (*) begin
    imemreq_msg[(78)-1:74] = TYPE_READ;
    imemreq_msg[(34)-1:32] = 0;
    imemreq_msg[(66)-1:34] = pc_sel_mux_F$out;
    imemreq_msg[(32)-1:0] = 0;
    imemreq_msg[(74)-1:66] = 0;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_rf():
  //       s.rf_rd_addr0[0:5].value = s.inst_D[ RS1 ]
  //       s.rf_rd_addr0[5:6].value = s.rs1_fprf_D
  //       s.rf_rd_addr1[0:5].value = s.inst_D[ RS2 ]
  //       s.rf_rd_addr1[5:6].value = s.rs2_fprf_D
  //       s.rf_wr_addr[0:5].value = s.rf_waddr_W
  //       s.rf_wr_addr[5:6].value = s.rd_fprf_W

  // logic for comb_rf()
  always @ (*) begin
    rf_rd_addr0[(5)-1:0] = inst_D[(20)-1:15];
    rf_rd_addr0[(6)-1:5] = rs1_fprf_D;
    rf_rd_addr1[(5)-1:0] = inst_D[(25)-1:20];
    rf_rd_addr1[(6)-1:5] = rs2_fprf_D;
    rf_wr_addr[(5)-1:0] = rf_waddr_W;
    rf_wr_addr[(6)-1:5] = rd_fprf_W;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def dmemresp_logic_M():
  //       s.dmemresp_msg_data_truncated8_M.value  = s.dmemresp_msg_data[0:8]
  //       s.dmemresp_msg_data_truncated16_M.value = s.dmemresp_msg_data[0:16]
  //
  //       s.dmemresp_msg_data_lb_M.value  = sext( s.dmemresp_msg_data_truncated8_M,  32 )
  //       s.dmemresp_msg_data_lh_M.value  = sext( s.dmemresp_msg_data_truncated16_M, 32 )
  //       s.dmemresp_msg_data_lw_M.value  = s.dmemresp_msg_data
  //       s.dmemresp_msg_data_lbu_M.value = zext( s.dmemresp_msg_data_truncated8_M,  32 )
  //       s.dmemresp_msg_data_lhu_M.value = zext( s.dmemresp_msg_data_truncated16_M, 32 )

  // logic for dmemresp_logic_M()
  always @ (*) begin
    dmemresp_msg_data_truncated8_M = dmemresp_msg_data[(8)-1:0];
    dmemresp_msg_data_truncated16_M = dmemresp_msg_data[(16)-1:0];
    dmemresp_msg_data_lb_M = { { 32-8 { dmemresp_msg_data_truncated8_M[7] } }, dmemresp_msg_data_truncated8_M };
    dmemresp_msg_data_lh_M = { { 32-16 { dmemresp_msg_data_truncated16_M[15] } }, dmemresp_msg_data_truncated16_M };
    dmemresp_msg_data_lw_M = dmemresp_msg_data;
    dmemresp_msg_data_lbu_M = { { 32-8 { 1'b0 } }, dmemresp_msg_data_truncated8_M };
    dmemresp_msg_data_lhu_M = { { 32-16 { 1'b0 } }, dmemresp_msg_data_truncated16_M };
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def stats_en_logic_W():
  //       s.stats_en.value = reduce_or( s.stats_en_reg_W.out ) # reduction with bitwise OR

  // logic for stats_en_logic_W()
  always @ (*) begin
    stats_en = (|stats_en_reg_W$out);
  end


endmodule // ProcDpathPRTL_0x4a10d55468bee90e
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEnRst_0x5c03eb7daf20f305
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 32, "reset_value": 0}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEnRst_0x5c03eb7daf20f305
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 0;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       elif s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      if (en) begin
        out <= in_;
      end
      else begin
      end
    end
  end


endmodule // RegEnRst_0x5c03eb7daf20f305
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x4144ab3fc268acb4
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 32, "nports": 3}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x4144ab3fc268acb4
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  input  wire [  31:0] in_$002,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   1:0] sel
);

  // localparam declarations
  localparam nports = 3;


  // array declarations
  wire   [  31:0] in_[0:2];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;
  assign in_[  2] = in_$002;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x4144ab3fc268acb4
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEnRst_0x574b81e599753a8a
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 32, "reset_value": 508}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEnRst_0x574b81e599753a8a
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 32'h0x3FFFFFFC; //1073741824; //508;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       elif s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      if (en) begin
        out <= in_;
      end
      else begin
      end
    end
  end


endmodule // RegEnRst_0x574b81e599753a8a
`default_nettype wire

//-----------------------------------------------------------------------------
// AluPRTL_0x6f5034674aabb7c
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcDpathComponentsPRTL {}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module AluPRTL_0x6f5034674aabb7c
(
  input  wire [   0:0] clk,
  input  wire [   3:0] fn,
  input  wire [  31:0] in0,
  input  wire [  31:0] in1,
  output reg  [   0:0] ops_eq,
  output reg  [   0:0] ops_lt,
  output reg  [   0:0] ops_ltu,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [  32:0] tmp_a;
  reg    [  63:0] tmp_b;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //
  //       s.tmp_a.value = 0
  //       s.tmp_b.value = 0
  //
  //       if   s.fn ==  0: s.out.value = s.in0 + s.in1       # ADD
  //       elif s.fn == 11: s.out.value = s.in0               # CP OP0
  //       elif s.fn == 12: s.out.value = s.in1               # CP OP1
  //
  //       #''' LAB TASK ''''''''''''''''''''''''''''''''''''''''''''''''''''''
  //       # Add more ALU functions
  //       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''\/
  //
  //       elif s.fn ==  1: s.out.value = s.in0 - s.in1       # SUB
  //       elif s.fn ==  2: s.out.value = s.in0 << s.in1[0:5] # SLL
  //       elif s.fn ==  3: s.out.value = s.in0 | s.in1       # OR
  //
  //       elif s.fn ==  4:                                   # SLT
  //         s.tmp_a.value = sext( s.in0, 33 ) - sext( s.in1, 33 )
  //         s.out.value   = s.tmp_a[32]
  //
  //       elif s.fn ==  5: s.out.value = s.in0 < s.in1       # SLTU
  //       elif s.fn ==  6: s.out.value = s.in0 & s.in1       # AND
  //       elif s.fn ==  7: s.out.value = s.in0 ^ s.in1       # XOR
  //       elif s.fn ==  8: s.out.value = ~( s.in0 | s.in1 )  # NOR
  //       elif s.fn ==  9: s.out.value = s.in0 >> (s.in1[0:5]) # SRL
  //
  //       elif s.fn == 10:                                   # SRA
  //         s.tmp_b.value = sext( s.in0, 64 ) >> s.in1[0:5]
  //         s.out.value   = s.tmp_b[0:32]
  //
  //       elif s.fn == 13:                                   # ADDZ for clearing LSB
  //         s.tmp_b.value = s.in0 + s.in1
  //         s.out[0].value = 0
  //         s.out[1:32].value = s.tmp_b[1:32]
  //         
  //
  //       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''/\
  //
  //       else:            s.out.value = 0                   # Unknown
  //
  //       s.ops_eq.value = ( s.in0 == s.in1 )
  //
  //       #''' LAB TASK ''''''''''''''''''''''''''''''''''''''''''''''''''''''
  //       # Add more ALU functions
  //       # ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''\/
  //
  //       s.ops_lt.value  = s.tmp_a[32]
  //       s.ops_ltu.value = ( s.in0 < s.in1 )

  // logic for comb_logic()
  always @ (*) begin
    tmp_a = 0;
    tmp_b = 0;
    if ((fn == 0)) begin
      out = (in0+in1);
    end
    else begin
      if ((fn == 11)) begin
        out = in0;
      end
      else begin
        if ((fn == 12)) begin
          out = in1;
        end
        else begin
          if ((fn == 1)) begin
            out = (in0-in1);
          end
          else begin
            if ((fn == 2)) begin
              out = (in0<<in1[(5)-1:0]);
            end
            else begin
              if ((fn == 3)) begin
                out = (in0|in1);
              end
              else begin
                if ((fn == 4)) begin
                  tmp_a = ({ { 33-32 { in0[31] } }, in0 }-{ { 33-32 { in1[31] } }, in1 });
                  out = tmp_a[32];
                end
                else begin
                  if ((fn == 5)) begin
                    out = (in0 < in1);
                  end
                  else begin
                    if ((fn == 6)) begin
                      out = (in0&in1);
                    end
                    else begin
                      if ((fn == 7)) begin
                        out = (in0^in1);
                      end
                      else begin
                        if ((fn == 8)) begin
                          out = ~(in0|in1);
                        end
                        else begin
                          if ((fn == 9)) begin
                            out = (in0>>in1[(5)-1:0]);
                          end
                          else begin
                            if ((fn == 10)) begin
                              tmp_b = ({ { 64-32 { in0[31] } }, in0 }>>in1[(5)-1:0]);
                              out = tmp_b[(32)-1:0];
                            end
                            else begin
                              if ((fn == 13)) begin
                                tmp_b = (in0+in1);
                                out[0] = 0;
                                out[(32)-1:1] = tmp_b[(32)-1:1];
                              end
                              else begin
                                out = 0;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    ops_eq = (in0 == in1);
    ops_lt = tmp_a[32];
    ops_ltu = (in0 < in1);
  end


endmodule // AluPRTL_0x6f5034674aabb7c
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x4144ab3fc2596af7
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 32, "nports": 4}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x4144ab3fc2596af7
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  input  wire [  31:0] in_$002,
  input  wire [  31:0] in_$003,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   1:0] sel
);

  // localparam declarations
  localparam nports = 4;


  // array declarations
  wire   [  31:0] in_[0:3];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;
  assign in_[  2] = in_$002;
  assign in_[  3] = in_$003;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x4144ab3fc2596af7
`default_nettype wire

//-----------------------------------------------------------------------------
// RegisterFile_0x7d3ddfc61c4b8238
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.RegisterFile {"const_zero": true, "dtype": 32, "nregs": 64, "rd_ports": 2, "wr_ports": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegisterFile_0x7d3ddfc61c4b8238
(
  input  wire [   0:0] clk,
  input  wire [   5:0] rd_addr$000,
  input  wire [   5:0] rd_addr$001,
  output wire [  31:0] rd_data$000,
  output wire [  31:0] rd_data$001,
  input  wire [   0:0] reset,
  input  wire [   5:0] wr_addr,
  input  wire [  31:0] wr_data,
  input  wire [   0:0] wr_en
);

  // wire declarations
  wire   [  31:0] regs$000;
  wire   [  31:0] regs$001;
  wire   [  31:0] regs$002;
  wire   [  31:0] regs$003;
  wire   [  31:0] regs$004;
  wire   [  31:0] regs$005;
  wire   [  31:0] regs$006;
  wire   [  31:0] regs$007;
  wire   [  31:0] regs$008;
  wire   [  31:0] regs$009;
  wire   [  31:0] regs$010;
  wire   [  31:0] regs$011;
  wire   [  31:0] regs$012;
  wire   [  31:0] regs$013;
  wire   [  31:0] regs$014;
  wire   [  31:0] regs$015;
  wire   [  31:0] regs$016;
  wire   [  31:0] regs$017;
  wire   [  31:0] regs$018;
  wire   [  31:0] regs$019;
  wire   [  31:0] regs$020;
  wire   [  31:0] regs$021;
  wire   [  31:0] regs$022;
  wire   [  31:0] regs$023;
  wire   [  31:0] regs$024;
  wire   [  31:0] regs$025;
  wire   [  31:0] regs$026;
  wire   [  31:0] regs$027;
  wire   [  31:0] regs$028;
  wire   [  31:0] regs$029;
  wire   [  31:0] regs$030;
  wire   [  31:0] regs$031;
  wire   [  31:0] regs$032;
  wire   [  31:0] regs$033;
  wire   [  31:0] regs$034;
  wire   [  31:0] regs$035;
  wire   [  31:0] regs$036;
  wire   [  31:0] regs$037;
  wire   [  31:0] regs$038;
  wire   [  31:0] regs$039;
  wire   [  31:0] regs$040;
  wire   [  31:0] regs$041;
  wire   [  31:0] regs$042;
  wire   [  31:0] regs$043;
  wire   [  31:0] regs$044;
  wire   [  31:0] regs$045;
  wire   [  31:0] regs$046;
  wire   [  31:0] regs$047;
  wire   [  31:0] regs$048;
  wire   [  31:0] regs$049;
  wire   [  31:0] regs$050;
  wire   [  31:0] regs$051;
  wire   [  31:0] regs$052;
  wire   [  31:0] regs$053;
  wire   [  31:0] regs$054;
  wire   [  31:0] regs$055;
  wire   [  31:0] regs$056;
  wire   [  31:0] regs$057;
  wire   [  31:0] regs$058;
  wire   [  31:0] regs$059;
  wire   [  31:0] regs$060;
  wire   [  31:0] regs$061;
  wire   [  31:0] regs$062;
  wire   [  31:0] regs$063;


  // localparam declarations
  localparam nregs = 64;
  localparam rd_ports = 2;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   5:0] rd_addr[0:1];
  assign rd_addr[  0] = rd_addr$000;
  assign rd_addr[  1] = rd_addr$001;
  reg    [  31:0] rd_data[0:1];
  assign rd_data$000 = rd_data[  0];
  assign rd_data$001 = rd_data[  1];
  reg    [  31:0] regs[0:63];
  assign regs$000 = regs[  0];
  assign regs$001 = regs[  1];
  assign regs$002 = regs[  2];
  assign regs$003 = regs[  3];
  assign regs$004 = regs[  4];
  assign regs$005 = regs[  5];
  assign regs$006 = regs[  6];
  assign regs$007 = regs[  7];
  assign regs$008 = regs[  8];
  assign regs$009 = regs[  9];
  assign regs$010 = regs[ 10];
  assign regs$011 = regs[ 11];
  assign regs$012 = regs[ 12];
  assign regs$013 = regs[ 13];
  assign regs$014 = regs[ 14];
  assign regs$015 = regs[ 15];
  assign regs$016 = regs[ 16];
  assign regs$017 = regs[ 17];
  assign regs$018 = regs[ 18];
  assign regs$019 = regs[ 19];
  assign regs$020 = regs[ 20];
  assign regs$021 = regs[ 21];
  assign regs$022 = regs[ 22];
  assign regs$023 = regs[ 23];
  assign regs$024 = regs[ 24];
  assign regs$025 = regs[ 25];
  assign regs$026 = regs[ 26];
  assign regs$027 = regs[ 27];
  assign regs$028 = regs[ 28];
  assign regs$029 = regs[ 29];
  assign regs$030 = regs[ 30];
  assign regs$031 = regs[ 31];
  assign regs$032 = regs[ 32];
  assign regs$033 = regs[ 33];
  assign regs$034 = regs[ 34];
  assign regs$035 = regs[ 35];
  assign regs$036 = regs[ 36];
  assign regs$037 = regs[ 37];
  assign regs$038 = regs[ 38];
  assign regs$039 = regs[ 39];
  assign regs$040 = regs[ 40];
  assign regs$041 = regs[ 41];
  assign regs$042 = regs[ 42];
  assign regs$043 = regs[ 43];
  assign regs$044 = regs[ 44];
  assign regs$045 = regs[ 45];
  assign regs$046 = regs[ 46];
  assign regs$047 = regs[ 47];
  assign regs$048 = regs[ 48];
  assign regs$049 = regs[ 49];
  assign regs$050 = regs[ 50];
  assign regs$051 = regs[ 51];
  assign regs$052 = regs[ 52];
  assign regs$053 = regs[ 53];
  assign regs$054 = regs[ 54];
  assign regs$055 = regs[ 55];
  assign regs$056 = regs[ 56];
  assign regs$057 = regs[ 57];
  assign regs$058 = regs[ 58];
  assign regs$059 = regs[ 59];
  assign regs$060 = regs[ 60];
  assign regs$061 = regs[ 61];
  assign regs$062 = regs[ 62];
  assign regs$063 = regs[ 63];

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic_const_zero():
  //         if s.wr_en and s.wr_addr != 0:
  //           s.regs[ s.wr_addr ].next = s.wr_data

  // logic for seq_logic_const_zero()
  always @ (posedge clk) begin
    if ((wr_en&&(wr_addr != 0))) begin
      regs[wr_addr] <= wr_data;
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //         for i in range( rd_ports ):
  //           assert s.rd_addr[i] < nregs
  //           if s.rd_addr[i] == 0:
  //             s.rd_data[i].value = 0
  //           else:
  //             s.rd_data[i].value = s.regs[ s.rd_addr[i] ]

  // logic for comb_logic()
  always @ (*) begin
    for (i=0; i < rd_ports; i=i+1)
    begin
      if ((rd_addr[i] == 0)) begin
        rd_data[i] = 0;
      end
      else begin
        rd_data[i] = regs[rd_addr[i]];
      end
    end
  end


endmodule // RegisterFile_0x7d3ddfc61c4b8238
`default_nettype wire

//-----------------------------------------------------------------------------
// Incrementer_0x64b7d65fea759127
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.arith {"increment_amount": 4, "nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Incrementer_0x64b7d65fea759127
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam increment_amount = 4;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       s.out.value = s.in_ + increment_amount

  // logic for comb_logic()
  always @ (*) begin
    out = (in_+increment_amount);
  end


endmodule // Incrementer_0x64b7d65fea759127
`default_nettype wire

//-----------------------------------------------------------------------------
// Adder_0x2d6e5ef952489e2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.arith {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Adder_0x2d6e5ef952489e2
(
  input  wire [   0:0] cin,
  input  wire [   0:0] clk,
  output wire [   0:0] cout,
  input  wire [  31:0] in0,
  input  wire [  31:0] in1,
  output wire [  31:0] out,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [  32:0] t0__0;
  reg    [  32:0] t1__0;
  reg    [  32:0] temp;

  // localparam declarations
  localparam twidth = 33;

  // signal connections
  assign cout = temp[32];
  assign out  = temp[31:0];


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //
  //       # Zero extend the inputs by one bit so we can generate an extra
  //       # carry out bit
  //
  //       t0 = zext( s.in0, twidth )
  //       t1 = zext( s.in1, twidth )
  //
  //       s.temp.value = t0 + t1 + s.cin

  // logic for comb_logic()
  always @ (*) begin
    t0__0 = { { twidth-32 { 1'b0 } }, in0 };
    t1__0 = { { twidth-32 { 1'b0 } }, in1 };
    temp = ((t0__0+t1__0)+cin);
  end


endmodule // Adder_0x2d6e5ef952489e2
`default_nettype wire

//-----------------------------------------------------------------------------
// ImmGenPRTL_0x6f5034674aabb7c
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcDpathComponentsPRTL {}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module ImmGenPRTL_0x6f5034674aabb7c
(
  input  wire [   0:0] clk,
  output reg  [  31:0] imm,
  input  wire [   2:0] imm_type,
  input  wire [  31:0] inst,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   0:0] tmp1;
  reg    [  11:0] tmp12;
  reg    [   6:0] tmp7;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       # Always sext!
  //
  //       if   s.imm_type == 0: # I-type
  //
  //         # Shunning: Nasty but this is for translation to work. I did
  //         # create a PR in the past to handle this.
  //         # See https://github.com/cornell-brg/pymtl/pull/158
  //
  //         s.tmp12.value = s.inst[ I_IMM ]
  //
  //         s.imm.value = concat( sext( s.tmp12, 32 ) )
  //
  //       elif s.imm_type == 2: # B-type
  //
  //         s.tmp1.value = s.inst[ B_IMM3 ]
  //
  //         s.imm.value = concat( sext( s.tmp1, 20 ),
  //                                     s.inst[ B_IMM2 ],
  //                                     s.inst[ B_IMM1 ],
  //                                     s.inst[ B_IMM0 ],
  //                                     Bits( 1, 0 ) )
  //
  //       #''' LAB TASK ''''''''''''''''''''''''''''''''''''''''''''''''''''''
  //       # Add more immediate types
  //       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''\/
  //
  //       elif s.imm_type == 1: # S-type
  //
  //         s.tmp7.value = s.inst[ S_IMM1 ]
  //
  //         s.imm.value = concat( sext( s.tmp7, 27 ),
  //                                     s.inst[ S_IMM0 ] )
  //
  //       elif s.imm_type == 3: # U-type
  //
  //         s.imm.value = concat(       s.inst[ U_IMM ],
  //                                     Bits( 12, 0 ) )
  //
  //       elif s.imm_type == 4: # J-type
  //
  //         s.tmp1.value = s.inst[ J_IMM3 ]
  //
  //         s.imm.value = concat( sext( s.tmp1, 12 ),
  //                                     s.inst[ J_IMM2 ],
  //                                     s.inst[ J_IMM1 ],
  //                                     s.inst[ J_IMM0 ],
  //                                     Bits( 1, 0 ) )
  //
  //       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''/\
  //
  //       else:
  //         s.imm.value = 0

  // logic for comb_logic()
  always @ (*) begin
    if ((imm_type == 0)) begin
      tmp12 = inst[(32)-1:20];
      imm = { { { 32-12 { tmp12[11] } }, tmp12 } };
    end
    else begin
      if ((imm_type == 2)) begin
        tmp1 = inst[(32)-1:31];
        imm = { { { 20-1 { tmp1[0] } }, tmp1 },inst[(8)-1:7],inst[(31)-1:25],inst[(12)-1:8],1'd0 };
      end
      else begin
        if ((imm_type == 1)) begin
          tmp7 = inst[(32)-1:25];
          imm = { { { 27-7 { tmp7[6] } }, tmp7 },inst[(12)-1:7] };
        end
        else begin
          if ((imm_type == 3)) begin
            imm = { inst[(32)-1:12],12'd0 };
          end
          else begin
            if ((imm_type == 4)) begin
              tmp1 = inst[(32)-1:31];
              imm = { { { 12-1 { tmp1[0] } }, tmp1 },inst[(20)-1:12],inst[(21)-1:20],inst[(31)-1:21],1'd0 };
            end
            else begin
              imm = 0;
            end
          end
        end
      end
    end
  end


endmodule // ImmGenPRTL_0x6f5034674aabb7c
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x4144ab3fc277ef7d
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 32, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x4144ab3fc277ef7d
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  31:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x4144ab3fc277ef7d
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x4144ab3fc24a2836
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 32, "nports": 5}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x4144ab3fc24a2836
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  input  wire [  31:0] in_$002,
  input  wire [  31:0] in_$003,
  input  wire [  31:0] in_$004,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   2:0] sel
);

  // localparam declarations
  localparam nports = 5;


  // array declarations
  wire   [  31:0] in_[0:4];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;
  assign in_[  2] = in_$002;
  assign in_[  3] = in_$003;
  assign in_[  4] = in_$004;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x4144ab3fc24a2836
`default_nettype wire

//-----------------------------------------------------------------------------
// TwoElementBypassQueue_0x371fd9c6fe540cf
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 78}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module TwoElementBypassQueue_0x371fd9c6fe540cf
(
  input  wire [   0:0] clk,
  output wire [  77:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  output reg  [   0:0] empty,
  input  wire [  77:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output reg  [   0:0] full,
  input  wire [   0:0] reset
);

  // queue1 temporaries
  wire   [   0:0] queue1$clk;
  wire   [  77:0] queue1$enq_msg;
  wire   [   0:0] queue1$enq_val;
  wire   [   0:0] queue1$reset;
  wire   [   0:0] queue1$deq_rdy;
  wire   [   0:0] queue1$enq_rdy;
  wire   [   0:0] queue1$full;
  wire   [  77:0] queue1$deq_msg;
  wire   [   0:0] queue1$deq_val;

  SingleElementBypassQueue_0x371fd9c6fe540cf queue1
  (
    .clk     ( queue1$clk ),
    .enq_msg ( queue1$enq_msg ),
    .enq_val ( queue1$enq_val ),
    .reset   ( queue1$reset ),
    .deq_rdy ( queue1$deq_rdy ),
    .enq_rdy ( queue1$enq_rdy ),
    .full    ( queue1$full ),
    .deq_msg ( queue1$deq_msg ),
    .deq_val ( queue1$deq_val )
  );

  // queue0 temporaries
  wire   [   0:0] queue0$clk;
  wire   [  77:0] queue0$enq_msg;
  wire   [   0:0] queue0$enq_val;
  wire   [   0:0] queue0$reset;
  wire   [   0:0] queue0$deq_rdy;
  wire   [   0:0] queue0$enq_rdy;
  wire   [   0:0] queue0$full;
  wire   [  77:0] queue0$deq_msg;
  wire   [   0:0] queue0$deq_val;

  SingleElementBypassQueue_0x371fd9c6fe540cf queue0
  (
    .clk     ( queue0$clk ),
    .enq_msg ( queue0$enq_msg ),
    .enq_val ( queue0$enq_val ),
    .reset   ( queue0$reset ),
    .deq_rdy ( queue0$deq_rdy ),
    .enq_rdy ( queue0$enq_rdy ),
    .full    ( queue0$full ),
    .deq_msg ( queue0$deq_msg ),
    .deq_val ( queue0$deq_val )
  );

  // signal connections
  assign deq_msg        = queue1$deq_msg;
  assign deq_val        = queue1$deq_val;
  assign enq_rdy        = queue0$enq_rdy;
  assign queue0$clk     = clk;
  assign queue0$deq_rdy = queue1$enq_rdy;
  assign queue0$enq_msg = enq_msg;
  assign queue0$enq_val = enq_val;
  assign queue0$reset   = reset;
  assign queue1$clk     = clk;
  assign queue1$deq_rdy = deq_rdy;
  assign queue1$enq_msg = queue0$deq_msg;
  assign queue1$enq_val = queue0$deq_val;
  assign queue1$reset   = reset;


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def full_empty():
  //       s.full.value  = s.queue0.full & s.queue1.full
  //       s.empty.value = (~s.queue0.full) & (~s.queue1.full)

  // logic for full_empty()
  always @ (*) begin
    full = (queue0$full&queue1$full);
    empty = (~queue0$full&~queue1$full);
  end


endmodule // TwoElementBypassQueue_0x371fd9c6fe540cf
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371fd9c6fe540cf
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 78}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371fd9c6fe540cf
(
  input  wire [   0:0] clk,
  output wire [  77:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  77:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   0:0] full,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$bypass_mux_sel;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$deq_val;
  wire   [   0:0] ctrl$full;
  wire   [   0:0] ctrl$enq_rdy;

  SingleElementBypassQueueCtrl_0x10bc624c3d616f27 ctrl
  (
    .clk            ( ctrl$clk ),
    .enq_val        ( ctrl$enq_val ),
    .reset          ( ctrl$reset ),
    .deq_rdy        ( ctrl$deq_rdy ),
    .bypass_mux_sel ( ctrl$bypass_mux_sel ),
    .wen            ( ctrl$wen ),
    .deq_val        ( ctrl$deq_val ),
    .full           ( ctrl$full ),
    .enq_rdy        ( ctrl$enq_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$bypass_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  77:0] dpath$enq_bits;
  wire   [  77:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371fd9c6fe540cf dpath
  (
    .wen            ( dpath$wen ),
    .bypass_mux_sel ( dpath$bypass_mux_sel ),
    .clk            ( dpath$clk ),
    .reset          ( dpath$reset ),
    .enq_bits       ( dpath$enq_bits ),
    .deq_bits       ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk             = clk;
  assign ctrl$deq_rdy         = deq_rdy;
  assign ctrl$enq_val         = enq_val;
  assign ctrl$reset           = reset;
  assign deq_msg              = dpath$deq_bits;
  assign deq_val              = ctrl$deq_val;
  assign dpath$bypass_mux_sel = ctrl$bypass_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$enq_bits       = enq_msg;
  assign dpath$reset          = reset;
  assign dpath$wen            = ctrl$wen;
  assign enq_rdy              = ctrl$enq_rdy;
  assign full                 = ctrl$full;



endmodule // SingleElementBypassQueue_0x371fd9c6fe540cf
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueDpath_0x371fd9c6fe540cf
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 78}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371fd9c6fe540cf
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  77:0] deq_bits,
  input  wire [  77:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  77:0] bypass_mux$in_$000;
  wire   [  77:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  77:0] bypass_mux$out;

  Mux_0x2fd098aa9a41a317 bypass_mux
  (
    .reset   ( bypass_mux$reset ),
    .in_$000 ( bypass_mux$in_$000 ),
    .in_$001 ( bypass_mux$in_$001 ),
    .clk     ( bypass_mux$clk ),
    .sel     ( bypass_mux$sel ),
    .out     ( bypass_mux$out )
  );

  // queue temporaries
  wire   [   0:0] queue$reset;
  wire   [  77:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  77:0] queue$out;

  RegEn_0x33930f125773068 queue
  (
    .reset ( queue$reset ),
    .in_   ( queue$in_ ),
    .clk   ( queue$clk ),
    .en    ( queue$en ),
    .out   ( queue$out )
  );

  // signal connections
  assign bypass_mux$clk     = clk;
  assign bypass_mux$in_$000 = queue$out;
  assign bypass_mux$in_$001 = enq_bits;
  assign bypass_mux$reset   = reset;
  assign bypass_mux$sel     = bypass_mux_sel;
  assign deq_bits           = bypass_mux$out;
  assign queue$clk          = clk;
  assign queue$en           = wen;
  assign queue$in_          = enq_bits;
  assign queue$reset        = reset;



endmodule // SingleElementBypassQueueDpath_0x371fd9c6fe540cf
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x2fd098aa9a41a317
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 78, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x2fd098aa9a41a317
(
  input  wire [   0:0] clk,
  input  wire [  77:0] in_$000,
  input  wire [  77:0] in_$001,
  output reg  [  77:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  77:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x2fd098aa9a41a317
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x33930f125773068
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 78}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x33930f125773068
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  77:0] in_,
  output reg  [  77:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x33930f125773068
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371f9f91c7b6145
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371f9f91c7b6145
(
  input  wire [   0:0] clk,
  output wire [  31:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  31:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   0:0] full,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$bypass_mux_sel;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$deq_val;
  wire   [   0:0] ctrl$full;
  wire   [   0:0] ctrl$enq_rdy;

  SingleElementBypassQueueCtrl_0x10bc624c3d616f27 ctrl
  (
    .clk            ( ctrl$clk ),
    .enq_val        ( ctrl$enq_val ),
    .reset          ( ctrl$reset ),
    .deq_rdy        ( ctrl$deq_rdy ),
    .bypass_mux_sel ( ctrl$bypass_mux_sel ),
    .wen            ( ctrl$wen ),
    .deq_val        ( ctrl$deq_val ),
    .full           ( ctrl$full ),
    .enq_rdy        ( ctrl$enq_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$bypass_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  31:0] dpath$enq_bits;
  wire   [  31:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371f9f91c7b6145 dpath
  (
    .wen            ( dpath$wen ),
    .bypass_mux_sel ( dpath$bypass_mux_sel ),
    .clk            ( dpath$clk ),
    .reset          ( dpath$reset ),
    .enq_bits       ( dpath$enq_bits ),
    .deq_bits       ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk             = clk;
  assign ctrl$deq_rdy         = deq_rdy;
  assign ctrl$enq_val         = enq_val;
  assign ctrl$reset           = reset;
  assign deq_msg              = dpath$deq_bits;
  assign deq_val              = ctrl$deq_val;
  assign dpath$bypass_mux_sel = ctrl$bypass_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$enq_bits       = enq_msg;
  assign dpath$reset          = reset;
  assign dpath$wen            = ctrl$wen;
  assign enq_rdy              = ctrl$enq_rdy;
  assign full                 = ctrl$full;



endmodule // SingleElementBypassQueue_0x371f9f91c7b6145
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueueDpath_0x371f9f91c7b6145
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371f9f91c7b6145
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  31:0] deq_bits,
  input  wire [  31:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  31:0] bypass_mux$in_$000;
  wire   [  31:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  31:0] bypass_mux$out;

  Mux_0x4144ab3fc277ef7d bypass_mux
  (
    .reset   ( bypass_mux$reset ),
    .in_$000 ( bypass_mux$in_$000 ),
    .in_$001 ( bypass_mux$in_$001 ),
    .clk     ( bypass_mux$clk ),
    .sel     ( bypass_mux$sel ),
    .out     ( bypass_mux$out )
  );

  // queue temporaries
  wire   [   0:0] queue$reset;
  wire   [  31:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  31:0] queue$out;

  RegEn_0x3392d4dd30174d2 queue
  (
    .reset ( queue$reset ),
    .in_   ( queue$in_ ),
    .clk   ( queue$clk ),
    .en    ( queue$en ),
    .out   ( queue$out )
  );

  // signal connections
  assign bypass_mux$clk     = clk;
  assign bypass_mux$in_$000 = queue$out;
  assign bypass_mux$in_$001 = enq_bits;
  assign bypass_mux$reset   = reset;
  assign bypass_mux$sel     = bypass_mux_sel;
  assign deq_bits           = bypass_mux$out;
  assign queue$clk          = clk;
  assign queue$en           = wen;
  assign queue$in_          = enq_bits;
  assign queue$reset        = reset;



endmodule // SingleElementBypassQueueDpath_0x371f9f91c7b6145
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x3392d4dd30174d2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x3392d4dd30174d2
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x3392d4dd30174d2
`default_nettype wire

