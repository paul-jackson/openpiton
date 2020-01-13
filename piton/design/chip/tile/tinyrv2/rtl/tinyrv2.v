//-----------------------------------------------------------------------------
// ProcPRTL_0xfd37d69f510b9a8
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcPRTL {"num_cores": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module tinyrv2_proc
(
  input  wire [   0:0] clk,
  output wire [   0:0] commit_inst,
  input  wire [  31:0] core_id,
  output wire [  76:0] dmemreq_msg,
  input  wire [   0:0] dmemreq_rdy,
  output wire [   0:0] dmemreq_val,
  input  wire [  46:0] dmemresp_msg,
  output wire [   0:0] dmemresp_rdy,
  input  wire [   0:0] dmemresp_val,
  output wire [  76:0] imemreq_msg,
  input  wire [   0:0] imemreq_rdy,
  output wire [   0:0] imemreq_val,
  input  wire [  46:0] imemresp_msg,
  output wire [   0:0] imemresp_rdy,
  input  wire [   0:0] imemresp_val,
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
  input  wire [   0:0] xcelresp_val
);

  wire reset = ~reset_l;

  // wire declarations
  wire   [   0:0] imemresp_drop;


  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$imemresp_val;
  wire   [   0:0] ctrl$proc2mngr_rdy;
  wire   [   0:0] ctrl$br_cond_ltu_X;
  wire   [   0:0] ctrl$imul_req_rdy_D;
  wire   [   0:0] ctrl$mngr2proc_val;
  wire   [   0:0] ctrl$br_cond_lt_X;
  wire   [   0:0] ctrl$xcelreq_rdy;
  wire   [  31:0] ctrl$inst_D;
  wire   [   0:0] ctrl$dmemreq_rdy;
  wire   [   0:0] ctrl$imul_resp_val_X;
  wire   [   0:0] ctrl$imemreq_rdy;
  wire   [   0:0] ctrl$xcelresp_val;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$dmemresp_val;
  wire   [   0:0] ctrl$br_cond_eq_X;
  wire   [   2:0] ctrl$imm_type_D;
  wire   [   0:0] ctrl$dmemreq_val;
  wire   [   0:0] ctrl$mngr2proc_rdy;
  wire   [   1:0] ctrl$op1_byp_sel_D;
  wire   [   0:0] ctrl$dmemresp_rdy;
  wire   [   0:0] ctrl$reg_en_X;
  wire   [   0:0] ctrl$xcelreq_val;
  wire   [   1:0] ctrl$wb_result_sel_M;
  wire   [   0:0] ctrl$reg_en_D;
  wire   [   0:0] ctrl$reg_en_F;
  wire   [   0:0] ctrl$reg_en_M;
  wire   [   0:0] ctrl$reg_en_W;
  wire   [   3:0] ctrl$alu_fn_X;
  wire   [   0:0] ctrl$xcelreq_msg_type;
  wire   [   1:0] ctrl$ex_result_sel_X;
  wire   [   1:0] ctrl$csrr_sel_D;
  wire   [   0:0] ctrl$imul_resp_rdy_X;
  wire   [   1:0] ctrl$op2_byp_sel_D;
  wire   [   0:0] ctrl$rf_wen_W;
  wire   [   2:0] ctrl$dmemreq_msg_type;
  wire   [   4:0] ctrl$rf_waddr_W;
  wire   [   1:0] ctrl$pc_sel_F;
  wire   [   0:0] ctrl$proc2mngr_val;
  wire   [   0:0] ctrl$imul_req_val_D;
  wire   [   0:0] ctrl$commit_inst;
  wire   [   0:0] ctrl$imemreq_val;
  wire   [   0:0] ctrl$imemresp_drop;
  wire   [   0:0] ctrl$op1_sel_D;
  wire   [   0:0] ctrl$xcelresp_rdy;
  wire   [   0:0] ctrl$stats_en_wen_W;
  wire   [   0:0] ctrl$imemresp_rdy;
  wire   [   1:0] ctrl$op2_sel_D;

  ProcCtrlPRTL_0x3dfd24416cd48613 ctrl
  (
    .clk              ( ctrl$clk ),
    .imemresp_val     ( ctrl$imemresp_val ),
    .proc2mngr_rdy    ( ctrl$proc2mngr_rdy ),
    .br_cond_ltu_X    ( ctrl$br_cond_ltu_X ),
    .imul_req_rdy_D   ( ctrl$imul_req_rdy_D ),
    .mngr2proc_val    ( ctrl$mngr2proc_val ),
    .br_cond_lt_X     ( ctrl$br_cond_lt_X ),
    .xcelreq_rdy      ( ctrl$xcelreq_rdy ),
    .inst_D           ( ctrl$inst_D ),
    .dmemreq_rdy      ( ctrl$dmemreq_rdy ),
    .imul_resp_val_X  ( ctrl$imul_resp_val_X ),
    .imemreq_rdy      ( ctrl$imemreq_rdy ),
    .xcelresp_val     ( ctrl$xcelresp_val ),
    .reset            ( ctrl$reset ),
    .dmemresp_val     ( ctrl$dmemresp_val ),
    .br_cond_eq_X     ( ctrl$br_cond_eq_X ),
    .imm_type_D       ( ctrl$imm_type_D ),
    .dmemreq_val      ( ctrl$dmemreq_val ),
    .mngr2proc_rdy    ( ctrl$mngr2proc_rdy ),
    .op1_byp_sel_D    ( ctrl$op1_byp_sel_D ),
    .dmemresp_rdy     ( ctrl$dmemresp_rdy ),
    .reg_en_X         ( ctrl$reg_en_X ),
    .xcelreq_val      ( ctrl$xcelreq_val ),
    .wb_result_sel_M  ( ctrl$wb_result_sel_M ),
    .reg_en_D         ( ctrl$reg_en_D ),
    .reg_en_F         ( ctrl$reg_en_F ),
    .reg_en_M         ( ctrl$reg_en_M ),
    .reg_en_W         ( ctrl$reg_en_W ),
    .alu_fn_X         ( ctrl$alu_fn_X ),
    .xcelreq_msg_type ( ctrl$xcelreq_msg_type ),
    .ex_result_sel_X  ( ctrl$ex_result_sel_X ),
    .csrr_sel_D       ( ctrl$csrr_sel_D ),
    .imul_resp_rdy_X  ( ctrl$imul_resp_rdy_X ),
    .op2_byp_sel_D    ( ctrl$op2_byp_sel_D ),
    .rf_wen_W         ( ctrl$rf_wen_W ),
    .dmemreq_msg_type ( ctrl$dmemreq_msg_type ),
    .rf_waddr_W       ( ctrl$rf_waddr_W ),
    .pc_sel_F         ( ctrl$pc_sel_F ),
    .proc2mngr_val    ( ctrl$proc2mngr_val ),
    .imul_req_val_D   ( ctrl$imul_req_val_D ),
    .commit_inst      ( ctrl$commit_inst ),
    .imemreq_val      ( ctrl$imemreq_val ),
    .imemresp_drop    ( ctrl$imemresp_drop ),
    .op1_sel_D        ( ctrl$op1_sel_D ),
    .xcelresp_rdy     ( ctrl$xcelresp_rdy ),
    .stats_en_wen_W   ( ctrl$stats_en_wen_W ),
    .imemresp_rdy     ( ctrl$imemresp_rdy ),
    .op2_sel_D        ( ctrl$op2_sel_D )
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

  // imemreq_queue temporaries
  wire   [   0:0] imemreq_queue$clk;
  wire   [  76:0] imemreq_queue$enq_msg;
  wire   [   0:0] imemreq_queue$enq_val;
  wire   [   0:0] imemreq_queue$reset;
  wire   [   0:0] imemreq_queue$deq_rdy;
  wire   [   0:0] imemreq_queue$enq_rdy;
  wire   [   0:0] imemreq_queue$empty;
  wire   [   0:0] imemreq_queue$full;
  wire   [  76:0] imemreq_queue$deq_msg;
  wire   [   0:0] imemreq_queue$deq_val;

  TwoElementBypassQueue_0x371fd9c705010e2 imemreq_queue
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
  wire   [  31:0] dpath$core_id;
  wire   [   1:0] dpath$op1_byp_sel_D;
  wire   [   0:0] dpath$reg_en_X;
  wire   [   1:0] dpath$wb_result_sel_M;
  wire   [   0:0] dpath$reg_en_D;
  wire   [   0:0] dpath$reg_en_F;
  wire   [   0:0] dpath$reg_en_M;
  wire   [   3:0] dpath$alu_fn_X;
  wire   [   1:0] dpath$ex_result_sel_X;
  wire   [   1:0] dpath$csrr_sel_D;
  wire   [   0:0] dpath$imul_resp_rdy_X;
  wire   [   1:0] dpath$op2_byp_sel_D;
  wire   [   0:0] dpath$rf_wen_W;
  wire   [   4:0] dpath$rf_waddr_W;
  wire   [   0:0] dpath$stats_en_wen_W;
  wire   [  31:0] dpath$mngr2proc_data;
  wire   [   0:0] dpath$reset;
  wire   [   1:0] dpath$pc_sel_F;
  wire   [   0:0] dpath$imul_req_val_D;
  wire   [   0:0] dpath$op1_sel_D;
  wire   [  31:0] dpath$xcelresp_msg_data;
  wire   [  31:0] dpath$imemresp_msg_data;
  wire   [  31:0] dpath$dmemresp_msg_data;
  wire   [   1:0] dpath$op2_sel_D;
  wire   [   0:0] dpath$stats_en;
  wire   [   0:0] dpath$br_cond_ltu_X;
  wire   [   0:0] dpath$imul_req_rdy_D;
  wire   [  31:0] dpath$dmemreq_msg_data;
  wire   [  31:0] dpath$proc2mngr_data;
  wire   [   0:0] dpath$br_cond_lt_X;
  wire   [  31:0] dpath$inst_D;
  wire   [   0:0] dpath$imul_resp_val_X;
  wire   [  31:0] dpath$dmemreq_msg_addr;
  wire   [   4:0] dpath$xcelreq_msg_raddr;
  wire   [   0:0] dpath$br_cond_eq_X;
  wire   [  31:0] dpath$xcelreq_msg_data;
  wire   [  76:0] dpath$imemreq_msg;

  ProcDpathPRTL_0x4a10d55468bee90e dpath
  (
    .imm_type_D        ( dpath$imm_type_D ),
    .clk               ( dpath$clk ),
    .reg_en_W          ( dpath$reg_en_W ),
    .core_id           ( dpath$core_id ),
    .op1_byp_sel_D     ( dpath$op1_byp_sel_D ),
    .reg_en_X          ( dpath$reg_en_X ),
    .wb_result_sel_M   ( dpath$wb_result_sel_M ),
    .reg_en_D          ( dpath$reg_en_D ),
    .reg_en_F          ( dpath$reg_en_F ),
    .reg_en_M          ( dpath$reg_en_M ),
    .alu_fn_X          ( dpath$alu_fn_X ),
    .ex_result_sel_X   ( dpath$ex_result_sel_X ),
    .csrr_sel_D        ( dpath$csrr_sel_D ),
    .imul_resp_rdy_X   ( dpath$imul_resp_rdy_X ),
    .op2_byp_sel_D     ( dpath$op2_byp_sel_D ),
    .rf_wen_W          ( dpath$rf_wen_W ),
    .rf_waddr_W        ( dpath$rf_waddr_W ),
    .stats_en_wen_W    ( dpath$stats_en_wen_W ),
    .mngr2proc_data    ( dpath$mngr2proc_data ),
    .reset             ( dpath$reset ),
    .pc_sel_F          ( dpath$pc_sel_F ),
    .imul_req_val_D    ( dpath$imul_req_val_D ),
    .op1_sel_D         ( dpath$op1_sel_D ),
    .xcelresp_msg_data ( dpath$xcelresp_msg_data ),
    .imemresp_msg_data ( dpath$imemresp_msg_data ),
    .dmemresp_msg_data ( dpath$dmemresp_msg_data ),
    .op2_sel_D         ( dpath$op2_sel_D ),
    .stats_en          ( dpath$stats_en ),
    .br_cond_ltu_X     ( dpath$br_cond_ltu_X ),
    .imul_req_rdy_D    ( dpath$imul_req_rdy_D ),
    .dmemreq_msg_data  ( dpath$dmemreq_msg_data ),
    .proc2mngr_data    ( dpath$proc2mngr_data ),
    .br_cond_lt_X      ( dpath$br_cond_lt_X ),
    .inst_D            ( dpath$inst_D ),
    .imul_resp_val_X   ( dpath$imul_resp_val_X ),
    .dmemreq_msg_addr  ( dpath$dmemreq_msg_addr ),
    .xcelreq_msg_raddr ( dpath$xcelreq_msg_raddr ),
    .br_cond_eq_X      ( dpath$br_cond_eq_X ),
    .xcelreq_msg_data  ( dpath$xcelreq_msg_data ),
    .imemreq_msg       ( dpath$imemreq_msg )
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
  wire   [  76:0] dmemreq_queue$enq_msg;
  wire   [   0:0] dmemreq_queue$enq_val;
  wire   [   0:0] dmemreq_queue$reset;
  wire   [   0:0] dmemreq_queue$deq_rdy;
  wire   [   0:0] dmemreq_queue$enq_rdy;
  wire   [   0:0] dmemreq_queue$full;
  wire   [  76:0] dmemreq_queue$deq_msg;
  wire   [   0:0] dmemreq_queue$deq_val;

  SingleElementBypassQueue_0x371fd9c705010e2 dmemreq_queue
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
  assign ctrl$br_cond_eq_X            = dpath$br_cond_eq_X;
  assign ctrl$br_cond_lt_X            = dpath$br_cond_lt_X;
  assign ctrl$br_cond_ltu_X           = dpath$br_cond_ltu_X;
  assign ctrl$clk                     = clk;
  assign ctrl$dmemreq_rdy             = dmemreq_queue$enq_rdy;
  assign ctrl$dmemresp_val            = dmemresp_val;
  assign ctrl$imemreq_rdy             = imemreq_queue$enq_rdy;
  assign ctrl$imemresp_val            = imemresp_drop_unit$out_val;
  assign ctrl$imul_req_rdy_D          = dpath$imul_req_rdy_D;
  assign ctrl$imul_resp_val_X         = dpath$imul_resp_val_X;
  assign ctrl$inst_D                  = dpath$inst_D;
  assign ctrl$mngr2proc_val           = mngr2proc_val;
  assign ctrl$proc2mngr_rdy           = proc2mngr_queue$enq_rdy;
  assign ctrl$reset                   = reset;
  assign ctrl$xcelreq_rdy             = xcelreq_queue$enq_rdy;
  assign ctrl$xcelresp_val            = xcelresp_val;
  assign dmemreq_msg                  = dmemreq_queue$deq_msg;
  assign dmemreq_queue$clk            = clk;
  assign dmemreq_queue$deq_rdy        = dmemreq_rdy;
  assign dmemreq_queue$enq_msg[31:0]  = dpath$dmemreq_msg_data;
  assign dmemreq_queue$enq_msg[65:34] = dpath$dmemreq_msg_addr;
  assign dmemreq_queue$enq_msg[76:74] = ctrl$dmemreq_msg_type;
  assign dmemreq_queue$enq_val        = ctrl$dmemreq_val;
  assign dmemreq_queue$reset          = reset;
  assign dmemreq_val                  = dmemreq_queue$deq_val;
  assign dmemresp_rdy                 = ctrl$dmemresp_rdy;
  assign dpath$alu_fn_X               = ctrl$alu_fn_X;
  assign dpath$clk                    = clk;
  assign dpath$core_id                = core_id;
  assign dpath$core_id                = core_id;
  assign dpath$csrr_sel_D             = ctrl$csrr_sel_D;
  assign dpath$dmemresp_msg_data      = dmemresp_msg[31:0];
  assign dpath$ex_result_sel_X        = ctrl$ex_result_sel_X;
  assign dpath$imemresp_msg_data      = imemresp_drop_unit$out_msg;
  assign dpath$imm_type_D             = ctrl$imm_type_D;
  assign dpath$imul_req_val_D         = ctrl$imul_req_val_D;
  assign dpath$imul_resp_rdy_X        = ctrl$imul_resp_rdy_X;
  assign dpath$mngr2proc_data         = mngr2proc_msg;
  assign dpath$op1_byp_sel_D          = ctrl$op1_byp_sel_D;
  assign dpath$op1_sel_D              = ctrl$op1_sel_D;
  assign dpath$op2_byp_sel_D          = ctrl$op2_byp_sel_D;
  assign dpath$op2_sel_D              = ctrl$op2_sel_D;
  assign dpath$pc_sel_F               = ctrl$pc_sel_F;
  assign dpath$reg_en_D               = ctrl$reg_en_D;
  assign dpath$reg_en_F               = ctrl$reg_en_F;
  assign dpath$reg_en_M               = ctrl$reg_en_M;
  assign dpath$reg_en_W               = ctrl$reg_en_W;
  assign dpath$reg_en_X               = ctrl$reg_en_X;
  assign dpath$reset                  = reset;
  assign dpath$rf_waddr_W             = ctrl$rf_waddr_W;
  assign dpath$rf_wen_W               = ctrl$rf_wen_W;
  assign dpath$stats_en_wen_W         = ctrl$stats_en_wen_W;
  assign dpath$wb_result_sel_M        = ctrl$wb_result_sel_M;
  assign dpath$xcelresp_msg_data      = xcelresp_msg[31:0];
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



endmodule // ProcPRTL_0xfd37d69f510b9a8
`default_nettype wire

//-----------------------------------------------------------------------------
// ProcCtrlPRTL_0x3dfd24416cd48613
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: proc.ProcCtrlPRTL {}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module ProcCtrlPRTL_0x3dfd24416cd48613
(
  output reg  [   3:0] alu_fn_X,
  input  wire [   0:0] br_cond_eq_X,
  input  wire [   0:0] br_cond_lt_X,
  input  wire [   0:0] br_cond_ltu_X,
  input  wire [   0:0] clk,
  output reg  [   0:0] commit_inst,
  output reg  [   1:0] csrr_sel_D,
  output reg  [   2:0] dmemreq_msg_type,
  input  wire [   0:0] dmemreq_rdy,
  output reg  [   0:0] dmemreq_val,
  output reg  [   0:0] dmemresp_rdy,
  input  wire [   0:0] dmemresp_val,
  output reg  [   1:0] ex_result_sel_X,
  input  wire [   0:0] imemreq_rdy,
  output reg  [   0:0] imemreq_val,
  output reg  [   0:0] imemresp_drop,
  output reg  [   0:0] imemresp_rdy,
  input  wire [   0:0] imemresp_val,
  output reg  [   2:0] imm_type_D,
  input  wire [   0:0] imul_req_rdy_D,
  output reg  [   0:0] imul_req_val_D,
  output reg  [   0:0] imul_resp_rdy_X,
  input  wire [   0:0] imul_resp_val_X,
  input  wire [  31:0] inst_D,
  output reg  [   0:0] mngr2proc_rdy,
  input  wire [   0:0] mngr2proc_val,
  output reg  [   1:0] op1_byp_sel_D,
  output reg  [   0:0] op1_sel_D,
  output reg  [   1:0] op2_byp_sel_D,
  output reg  [   1:0] op2_sel_D,
  output reg  [   1:0] pc_sel_F,
  input  wire [   0:0] proc2mngr_rdy,
  output reg  [   0:0] proc2mngr_val,
  output reg  [   0:0] reg_en_D,
  output reg  [   0:0] reg_en_F,
  output reg  [   0:0] reg_en_M,
  output reg  [   0:0] reg_en_W,
  output reg  [   0:0] reg_en_X,
  input  wire [   0:0] reset,
  output reg  [   4:0] rf_waddr_W,
  output reg  [   0:0] rf_wen_W,
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
  reg    [  26:0] cs;
  reg    [   0:0] csrr_D;
  reg    [   0:0] csrw_D;
  reg    [   1:0] dmemreq_type_D;
  reg    [   1:0] dmemreq_type_M;
  reg    [   1:0] dmemreq_type_X;
  reg    [   1:0] ex_result_sel_D;
  reg    [   7:0] inst__9;
  reg    [   7:0] inst_type_M;
  reg    [   7:0] inst_type_W;
  reg    [   7:0] inst_type_X;
  reg    [   0:0] inst_val_D;
  reg    [   0:0] jal_D;
  reg    [   0:0] mngr2proc_rdy_D;
  reg    [   0:0] mul_D;
  reg    [   0:0] mul_X;
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
  reg    [   0:0] ostall_csrrx_X_rs1_D;
  reg    [   0:0] ostall_csrrx_X_rs2_D;
  reg    [   0:0] ostall_dmem_M;
  reg    [   0:0] ostall_dmem_X;
  reg    [   0:0] ostall_hazard_D;
  reg    [   0:0] ostall_imul_D;
  reg    [   0:0] ostall_imul_X;
  reg    [   0:0] ostall_ld_X_rs1_D;
  reg    [   0:0] ostall_ld_X_rs2_D;
  reg    [   0:0] ostall_mngr_D;
  reg    [   0:0] ostall_xcel_M;
  reg    [   0:0] ostall_xcel_X;
  reg    [   0:0] pc_redirect_D;
  reg    [   0:0] pc_redirect_X;
  reg    [   0:0] proc2mngr_val_D;
  reg    [   0:0] proc2mngr_val_M;
  reg    [   0:0] proc2mngr_val_W;
  reg    [   0:0] proc2mngr_val_X;
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
  localparam ADD = 9;
  localparam ADDI = 10;
  localparam AND = 18;
  localparam ANDI = 19;
  localparam AUIPC = 13;
  localparam BEQ = 24;
  localparam BGE = 27;
  localparam BGEU = 29;
  localparam BLT = 26;
  localparam BLTU = 28;
  localparam BNE = 25;
  localparam CSRR = 33;
  localparam CSRRX = 36;
  localparam CSRW = 34;
  localparam CSR_COREID = 3860;
  localparam CSR_MNGR2PROC = 4032;
  localparam CSR_NUMCORES = 4033;
  localparam CSR_PROC2MNGR = 1984;
  localparam CSR_STATS_EN = 1985;
  localparam JAL = 30;
  localparam JALR = 31;
  localparam LUI = 12;
  localparam LW = 1;
  localparam MUL = 32;
  localparam NOP = 0;
  localparam OR = 16;
  localparam ORI = 17;
  localparam SLL = 3;
  localparam SLLI = 4;
  localparam SLT = 20;
  localparam SLTI = 21;
  localparam SLTIU = 23;
  localparam SLTU = 22;
  localparam SRA = 7;
  localparam SRAI = 8;
  localparam SRL = 5;
  localparam SRLI = 6;
  localparam SUB = 11;
  localparam SW = 2;
  localparam TYPE_READ = 0;
  localparam TYPE_WRITE = 1;
  localparam XOR = 14;
  localparam XORI = 15;
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
  localparam imm_b = 3'd2;
  localparam imm_i = 3'd0;
  localparam imm_j = 3'd4;
  localparam imm_s = 3'd1;
  localparam imm_u = 3'd3;
  localparam imm_x = 3'd0;
  localparam jalr = 3'd7;
  localparam ld = 2'd1;
  localparam n = 1'd0;
  localparam nr = 2'd0;
  localparam st = 2'd2;
  localparam wm_a = 2'd0;
  localparam wm_c = 2'd2;
  localparam wm_m = 2'd1;
  localparam wm_x = 2'd0;
  localparam xm_a = 2'd0;
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
  //         s.rf_wen_pending_X.next = s.rf_wen_pending_D
  //         s.inst_type_X.next      = s.inst_type_decoder_D.out
  //         s.alu_fn_X.next         = s.alu_fn_D
  //         s.rf_waddr_X.next       = s.rf_waddr_D
  //         s.proc2mngr_val_X.next  = s.proc2mngr_val_D
  //         s.dmemreq_type_X.next   = s.dmemreq_type_D
  //         s.wb_result_sel_X.next  = s.wb_result_sel_D
  //         s.stats_en_wen_X.next   = s.stats_en_wen_D
  //         s.br_type_X.next        = s.br_type_D
  //         s.mul_X.next            = s.mul_D
  //         s.ex_result_sel_X.next  = s.ex_result_sel_D
  //         s.xcelreq_X.next        = s.xcelreq_D
  //         s.xcelreq_type_X.next   = s.xcelreq_type_D

  // logic for reg_X()
  always @ (posedge clk) begin
    if (reset) begin
      val_X <= 0;
      stats_en_wen_X <= 0;
    end
    else begin
      if (reg_en_X) begin
        val_X <= next_val_D;
        rf_wen_pending_X <= rf_wen_pending_D;
        inst_type_X <= inst_type_decoder_D$out;
        alu_fn_X <= alu_fn_D;
        rf_waddr_X <= rf_waddr_D;
        proc2mngr_val_X <= proc2mngr_val_D;
        dmemreq_type_X <= dmemreq_type_D;
        wb_result_sel_X <= wb_result_sel_D;
        stats_en_wen_X <= stats_en_wen_D;
        br_type_X <= br_type_D;
        mul_X <= mul_D;
        ex_result_sel_X <= ex_result_sel_D;
        xcelreq_X <= xcelreq_D;
        xcelreq_type_X <= xcelreq_type_D;
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
  //         s.rf_wen_pending_M.next = s.rf_wen_pending_X
  //         s.inst_type_M.next      = s.inst_type_X
  //         s.rf_waddr_M.next       = s.rf_waddr_X
  //         s.proc2mngr_val_M.next  = s.proc2mngr_val_X
  //         s.dmemreq_type_M.next   = s.dmemreq_type_X
  //         s.wb_result_sel_M.next  = s.wb_result_sel_X
  //         s.stats_en_wen_M.next   = s.stats_en_wen_X
  //         # xcel
  //         s.xcelreq_M.next        = s.xcelreq_X

  // logic for reg_M()
  always @ (posedge clk) begin
    if (reset) begin
      val_M <= 0;
      stats_en_wen_M <= 0;
    end
    else begin
      if (reg_en_M) begin
        val_M <= next_val_X;
        rf_wen_pending_M <= rf_wen_pending_X;
        inst_type_M <= inst_type_X;
        rf_waddr_M <= rf_waddr_X;
        proc2mngr_val_M <= proc2mngr_val_X;
        dmemreq_type_M <= dmemreq_type_X;
        wb_result_sel_M <= wb_result_sel_X;
        stats_en_wen_M <= stats_en_wen_X;
        xcelreq_M <= xcelreq_X;
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
  //         s.rf_wen_pending_W.next       = s.rf_wen_pending_M
  //         s.inst_type_W.next            = s.inst_type_M
  //         s.rf_waddr_W.next             = s.rf_waddr_M
  //         s.proc2mngr_val_W.next        = s.proc2mngr_val_M
  //         s.stats_en_wen_pending_W.next = s.stats_en_wen_M

  // logic for reg_W()
  always @ (posedge clk) begin
    if (reset) begin
      val_W <= 0;
      stats_en_wen_pending_W <= 0;
    end
    else begin
      if (reg_en_W) begin
        val_W <= next_val_M;
        rf_wen_pending_W <= rf_wen_pending_M;
        inst_type_W <= inst_type_M;
        rf_waddr_W <= rf_waddr_M;
        proc2mngr_val_W <= proc2mngr_val_M;
        stats_en_wen_pending_W <= stats_en_wen_M;
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
  //         s.pc_sel_F.value = 0           # use pc+4

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
  // def comb_F():
  //       # ostall due to imemresp
  //
  //       s.ostall_F.value      = s.val_F & ~s.imemresp_val
  //
  //       # stall and squash in F stage
  //
  //       s.stall_F.value       = s.val_F & ( s.ostall_F  | s.ostall_D |
  //                                           s.ostall_X  | s.ostall_M |
  //                                           s.ostall_W                 )
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
    stall_F = (val_F&((((ostall_F|ostall_D)|ostall_X)|ostall_M)|ostall_W));
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
  //       #                                           br    jal op1   rs1 imm    op2    rs2 alu      dmm xres  wbmux rf      cs cs
  //       #                                       val type   D  muxsel en type   muxsel  en fn       typ sel   sel   wen mul rr rw
  //       if   inst == NOP  : s.cs.value = concat( y, br_na, n, am_x,  n, imm_x, bm_x,   n, alu_x,   nr, xm_x, wm_a, n,  n,  n, n )
  //       # xcel/csrr/csrw
  //       elif inst == CSRRX: s.cs.value = concat( y, br_na, n, am_x,  n, imm_i, bm_imm, n, alu_cp1, nr, xm_a, wm_c, y,  n,  y, n )
  //       elif inst == CSRR : s.cs.value = concat( y, br_na, n, am_x,  n, imm_i, bm_csr, n, alu_cp1, nr, xm_a, wm_a, y,  n,  y, n )
  //       elif inst == CSRW : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_cp0, nr, xm_a, wm_a, n,  n,  n, y )
  //       # reg-reg
  //       elif inst == ADD  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_add, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SUB  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sub, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == MUL  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_x  , nr, xm_m, wm_a, y,  y,  n, n )
  //       elif inst == AND  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_and, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == OR   : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_or , nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == XOR  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_xor, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLT  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_lt , nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLTU : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_ltu, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SRA  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sra, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SRL  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_srl, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLL  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_x, bm_rf,  y, alu_sll, nr, xm_a, wm_a, y,  n,  n, n )
  //       # reg-imm
  //       elif inst == ADDI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == ANDI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_and, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == ORI  : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_or , nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == XORI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_xor, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLTI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_lt , nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLTIU: s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_ltu, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SRAI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_sra, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SRLI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_srl, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == SLLI : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_sll, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == LUI  : s.cs.value = concat( y, br_na, n, am_x,  n, imm_u, bm_imm, n, alu_cp1, nr, xm_a, wm_a, y,  n,  n, n )
  //       elif inst == AUIPC: s.cs.value = concat( y, br_na, n, am_pc, n, imm_u, bm_imm, n, alu_add, nr, xm_a, wm_a, y,  n,  n, n )
  //       # mem
  //       elif inst == LW   : s.cs.value = concat( y, br_na, n, am_rf, y, imm_i, bm_imm, n, alu_add, ld, xm_a, wm_m, y,  n,  n, n )
  //       elif inst == SW   : s.cs.value = concat( y, br_na, n, am_rf, y, imm_s, bm_imm, y, alu_add, st, xm_a, wm_m, n,  n,  n, n )
  //       # branch
  //       elif inst == BNE  : s.cs.value = concat( y, br_ne, n, am_rf, y, imm_b, bm_rf,  y, alu_x,   nr, xm_a, wm_x, n,  n,  n, n )
  //       elif inst == BEQ  : s.cs.value = concat( y, br_eq, n, am_rf, y, imm_b, bm_rf,  y, alu_x,   nr, xm_a, wm_x, n,  n,  n, n )
  //       elif inst == BLT  : s.cs.value = concat( y, br_lt, n, am_rf, y, imm_b, bm_rf,  y, alu_lt,  nr, xm_a, wm_x, n,  n,  n, n )
  //       elif inst == BLTU : s.cs.value = concat( y, br_lu, n, am_rf, y, imm_b, bm_rf,  y, alu_ltu, nr, xm_a, wm_x, n,  n,  n, n )
  //       elif inst == BGE  : s.cs.value = concat( y, br_ge, n, am_rf, y, imm_b, bm_rf,  y, alu_lt,  nr, xm_a, wm_x, n,  n,  n, n )
  //       elif inst == BGEU : s.cs.value = concat( y, br_gu, n, am_rf, y, imm_b, bm_rf,  y, alu_ltu, nr, xm_a, wm_x, n,  n,  n, n )
  //       # jump
  //       elif inst == JAL  : s.cs.value = concat( y, br_na, y, am_x,  n, imm_j, bm_x,   n, alu_x,   nr, xm_p, wm_a, y,  n,  n, n )
  //       elif inst == JALR : s.cs.value = concat( y, jalr , n, am_rf, y, imm_i, bm_imm, n, alu_adz, nr, xm_p, wm_a, y,  n,  n, n )
  //       else:               s.cs.value = concat( n, br_x,  n, am_x,  n, imm_x, bm_x,   n, alu_x,   nr, xm_x, wm_x, n,  n,  n, n )
  //
  //       s.inst_val_D.value       = s.cs[26:27]
  //       s.br_type_D.value        = s.cs[23:26]
  //       s.jal_D.value            = s.cs[22:23]
  //       s.op1_sel_D.value        = s.cs[21:22]
  //       s.rs1_en_D.value         = s.cs[20:21]
  //       s.imm_type_D.value       = s.cs[17:20]
  //       s.op2_sel_D.value        = s.cs[15:17]
  //       s.rs2_en_D.value         = s.cs[14:15]
  //       s.alu_fn_D.value         = s.cs[10:14]
  //       s.dmemreq_type_D.value   = s.cs[8:10]
  //       s.ex_result_sel_D.value  = s.cs[6:8]
  //       s.wb_result_sel_D.value  = s.cs[4:6]
  //       s.rf_wen_pending_D.value = s.cs[3:4]
  //       s.mul_D.value            = s.cs[2:3]
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
    inst__9 = inst_type_decoder_D$out;
    if ((inst__9 == NOP)) begin
      cs = { y,br_na,n,am_x,n,imm_x,bm_x,n,alu_x,nr,xm_x,wm_a,n,n,n,n };
    end
    else begin
      if ((inst__9 == CSRRX)) begin
        cs = { y,br_na,n,am_x,n,imm_i,bm_imm,n,alu_cp1,nr,xm_a,wm_c,y,n,y,n };
      end
      else begin
        if ((inst__9 == CSRR)) begin
          cs = { y,br_na,n,am_x,n,imm_i,bm_csr,n,alu_cp1,nr,xm_a,wm_a,y,n,y,n };
        end
        else begin
          if ((inst__9 == CSRW)) begin
            cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_cp0,nr,xm_a,wm_a,n,n,n,y };
          end
          else begin
            if ((inst__9 == ADD)) begin
              cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_add,nr,xm_a,wm_a,y,n,n,n };
            end
            else begin
              if ((inst__9 == SUB)) begin
                cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sub,nr,xm_a,wm_a,y,n,n,n };
              end
              else begin
                if ((inst__9 == MUL)) begin
                  cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_x,nr,xm_m,wm_a,y,y,n,n };
                end
                else begin
                  if ((inst__9 == AND)) begin
                    cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_and,nr,xm_a,wm_a,y,n,n,n };
                  end
                  else begin
                    if ((inst__9 == OR)) begin
                      cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_or,nr,xm_a,wm_a,y,n,n,n };
                    end
                    else begin
                      if ((inst__9 == XOR)) begin
                        cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_xor,nr,xm_a,wm_a,y,n,n,n };
                      end
                      else begin
                        if ((inst__9 == SLT)) begin
                          cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_lt,nr,xm_a,wm_a,y,n,n,n };
                        end
                        else begin
                          if ((inst__9 == SLTU)) begin
                            cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_ltu,nr,xm_a,wm_a,y,n,n,n };
                          end
                          else begin
                            if ((inst__9 == SRA)) begin
                              cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sra,nr,xm_a,wm_a,y,n,n,n };
                            end
                            else begin
                              if ((inst__9 == SRL)) begin
                                cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_srl,nr,xm_a,wm_a,y,n,n,n };
                              end
                              else begin
                                if ((inst__9 == SLL)) begin
                                  cs = { y,br_na,n,am_rf,y,imm_x,bm_rf,y,alu_sll,nr,xm_a,wm_a,y,n,n,n };
                                end
                                else begin
                                  if ((inst__9 == ADDI)) begin
                                    cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,nr,xm_a,wm_a,y,n,n,n };
                                  end
                                  else begin
                                    if ((inst__9 == ANDI)) begin
                                      cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_and,nr,xm_a,wm_a,y,n,n,n };
                                    end
                                    else begin
                                      if ((inst__9 == ORI)) begin
                                        cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_or,nr,xm_a,wm_a,y,n,n,n };
                                      end
                                      else begin
                                        if ((inst__9 == XORI)) begin
                                          cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_xor,nr,xm_a,wm_a,y,n,n,n };
                                        end
                                        else begin
                                          if ((inst__9 == SLTI)) begin
                                            cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_lt,nr,xm_a,wm_a,y,n,n,n };
                                          end
                                          else begin
                                            if ((inst__9 == SLTIU)) begin
                                              cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_ltu,nr,xm_a,wm_a,y,n,n,n };
                                            end
                                            else begin
                                              if ((inst__9 == SRAI)) begin
                                                cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_sra,nr,xm_a,wm_a,y,n,n,n };
                                              end
                                              else begin
                                                if ((inst__9 == SRLI)) begin
                                                  cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_srl,nr,xm_a,wm_a,y,n,n,n };
                                                end
                                                else begin
                                                  if ((inst__9 == SLLI)) begin
                                                    cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_sll,nr,xm_a,wm_a,y,n,n,n };
                                                  end
                                                  else begin
                                                    if ((inst__9 == LUI)) begin
                                                      cs = { y,br_na,n,am_x,n,imm_u,bm_imm,n,alu_cp1,nr,xm_a,wm_a,y,n,n,n };
                                                    end
                                                    else begin
                                                      if ((inst__9 == AUIPC)) begin
                                                        cs = { y,br_na,n,am_pc,n,imm_u,bm_imm,n,alu_add,nr,xm_a,wm_a,y,n,n,n };
                                                      end
                                                      else begin
                                                        if ((inst__9 == LW)) begin
                                                          cs = { y,br_na,n,am_rf,y,imm_i,bm_imm,n,alu_add,ld,xm_a,wm_m,y,n,n,n };
                                                        end
                                                        else begin
                                                          if ((inst__9 == SW)) begin
                                                            cs = { y,br_na,n,am_rf,y,imm_s,bm_imm,y,alu_add,st,xm_a,wm_m,n,n,n,n };
                                                          end
                                                          else begin
                                                            if ((inst__9 == BNE)) begin
                                                              cs = { y,br_ne,n,am_rf,y,imm_b,bm_rf,y,alu_x,nr,xm_a,wm_x,n,n,n,n };
                                                            end
                                                            else begin
                                                              if ((inst__9 == BEQ)) begin
                                                                cs = { y,br_eq,n,am_rf,y,imm_b,bm_rf,y,alu_x,nr,xm_a,wm_x,n,n,n,n };
                                                              end
                                                              else begin
                                                                if ((inst__9 == BLT)) begin
                                                                  cs = { y,br_lt,n,am_rf,y,imm_b,bm_rf,y,alu_lt,nr,xm_a,wm_x,n,n,n,n };
                                                                end
                                                                else begin
                                                                  if ((inst__9 == BLTU)) begin
                                                                    cs = { y,br_lu,n,am_rf,y,imm_b,bm_rf,y,alu_ltu,nr,xm_a,wm_x,n,n,n,n };
                                                                  end
                                                                  else begin
                                                                    if ((inst__9 == BGE)) begin
                                                                      cs = { y,br_ge,n,am_rf,y,imm_b,bm_rf,y,alu_lt,nr,xm_a,wm_x,n,n,n,n };
                                                                    end
                                                                    else begin
                                                                      if ((inst__9 == BGEU)) begin
                                                                        cs = { y,br_gu,n,am_rf,y,imm_b,bm_rf,y,alu_ltu,nr,xm_a,wm_x,n,n,n,n };
                                                                      end
                                                                      else begin
                                                                        if ((inst__9 == JAL)) begin
                                                                          cs = { y,br_na,y,am_x,n,imm_j,bm_x,n,alu_x,nr,xm_p,wm_a,y,n,n,n };
                                                                        end
                                                                        else begin
                                                                          if ((inst__9 == JALR)) begin
                                                                            cs = { y,jalr,n,am_rf,y,imm_i,bm_imm,n,alu_adz,nr,xm_p,wm_a,y,n,n,n };
                                                                          end
                                                                          else begin
                                                                            cs = { n,br_x,n,am_x,n,imm_x,bm_x,n,alu_x,nr,xm_x,wm_x,n,n,n,n };
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
    inst_val_D = cs[(27)-1:26];
    br_type_D = cs[(26)-1:23];
    jal_D = cs[(23)-1:22];
    op1_sel_D = cs[(22)-1:21];
    rs1_en_D = cs[(21)-1:20];
    imm_type_D = cs[(20)-1:17];
    op2_sel_D = cs[(17)-1:15];
    rs2_en_D = cs[(15)-1:14];
    alu_fn_D = cs[(14)-1:10];
    dmemreq_type_D = cs[(10)-1:8];
    ex_result_sel_D = cs[(8)-1:6];
    wb_result_sel_D = cs[(6)-1:4];
    rf_wen_pending_D = cs[(4)-1:3];
    mul_D = cs[(3)-1:2];
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
  //         if   s.val_X & ( s.inst_D[ RS1 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //                      & s.rf_wen_pending_X:    s.op1_byp_sel_D.value = byp_x
  //         elif s.val_M & ( s.inst_D[ RS1 ] == s.rf_waddr_M ) & ( s.rf_waddr_M != 0 ) \
  //                      & s.rf_wen_pending_M:    s.op1_byp_sel_D.value = byp_m
  //         elif s.val_W & ( s.inst_D[ RS1 ] == s.rf_waddr_W ) & ( s.rf_waddr_W != 0 ) \
  //                      & s.rf_wen_pending_W:    s.op1_byp_sel_D.value = byp_w
  //
  //       s.op2_byp_sel_D.value = byp_d
  //
  //       if s.rs2_en_D:
  //
  //         if   s.val_X & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //                      & s.rf_wen_pending_X:    s.op2_byp_sel_D.value = byp_x
  //         elif s.val_M & ( s.inst_D[ RS2 ] == s.rf_waddr_M ) & ( s.rf_waddr_M != 0 ) \
  //                      & s.rf_wen_pending_M:    s.op2_byp_sel_D.value = byp_m
  //         elif s.val_W & ( s.inst_D[ RS2 ] == s.rf_waddr_W ) & ( s.rf_waddr_W != 0 ) \
  //                      & s.rf_wen_pending_W:    s.op2_byp_sel_D.value = byp_w

  // logic for comb_bypass_D()
  always @ (*) begin
    op1_byp_sel_D = byp_d;
    if (rs1_en_D) begin
      if ((((val_X&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&rf_wen_pending_X)) begin
        op1_byp_sel_D = byp_x;
      end
      else begin
        if ((((val_M&(inst_D[(20)-1:15] == rf_waddr_M))&(rf_waddr_M != 0))&rf_wen_pending_M)) begin
          op1_byp_sel_D = byp_m;
        end
        else begin
          if ((((val_W&(inst_D[(20)-1:15] == rf_waddr_W))&(rf_waddr_W != 0))&rf_wen_pending_W)) begin
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
      if ((((val_X&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&rf_wen_pending_X)) begin
        op2_byp_sel_D = byp_x;
      end
      else begin
        if ((((val_M&(inst_D[(25)-1:20] == rf_waddr_M))&(rf_waddr_M != 0))&rf_wen_pending_M)) begin
          op2_byp_sel_D = byp_m;
        end
        else begin
          if ((((val_W&(inst_D[(25)-1:20] == rf_waddr_W))&(rf_waddr_W != 0))&rf_wen_pending_W)) begin
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
  //         & ( s.dmemreq_type_X == ld )
  //
  //       s.ostall_ld_X_rs2_D.value =\
  //           s.rs2_en_D & s.val_X & s.rf_wen_pending_X \
  //         & ( s.inst_D[ RS2 ] == s.rf_waddr_X ) & ( s.rf_waddr_X != 0 ) \
  //         & ( s.dmemreq_type_X == ld )
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
  //         | s.ostall_csrrx_X_rs1_D | s.ostall_csrrx_X_rs2_D

  // logic for comb_hazard_D()
  always @ (*) begin
    ostall_ld_X_rs1_D = (((((rs1_en_D&val_X)&rf_wen_pending_X)&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&(dmemreq_type_X == ld));
    ostall_ld_X_rs2_D = (((((rs2_en_D&val_X)&rf_wen_pending_X)&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&(dmemreq_type_X == ld));
    ostall_csrrx_X_rs1_D = ((((((rs1_en_D&val_X)&rf_wen_pending_X)&(inst_D[(20)-1:15] == rf_waddr_X))&(rf_waddr_X != 0))&xcelreq_X)&(xcelreq_type_X == TYPE_READ));
    ostall_csrrx_X_rs2_D = ((((((rs2_en_D&val_X)&rf_wen_pending_X)&(inst_D[(25)-1:20] == rf_waddr_X))&(rf_waddr_X != 0))&xcelreq_X)&(xcelreq_type_X == TYPE_READ));
    ostall_hazard_D = (((ostall_ld_X_rs1_D|ostall_ld_X_rs2_D)|ostall_csrrx_X_rs1_D)|ostall_csrrx_X_rs2_D);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_D():
  //
  //       # ostall due to mngr2proc
  //       s.ostall_mngr_D.value = s.mngr2proc_rdy_D & ~s.mngr2proc_val
  //
  //       # ostall due to imul
  //       s.ostall_imul_D.value  = s.val_D & s.mul_D & ~s.imul_req_rdy_D
  //
  //       # put together all ostall conditions
  //
  //       s.ostall_D.value = s.val_D & ( s.ostall_mngr_D | s.ostall_hazard_D | s.ostall_imul_D );
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
  //       # imul request valid signal
  //
  //       s.imul_req_val_D.value = s.val_D & ~s.stall_D & ~s.squash_D & s.mul_D
  //
  //       # next valid bit
  //
  //       s.next_val_D.value = s.val_D & ~s.stall_D & ~s.squash_D

  // logic for comb_D()
  always @ (*) begin
    ostall_mngr_D = (mngr2proc_rdy_D&~mngr2proc_val);
    ostall_imul_D = ((val_D&mul_D)&~imul_req_rdy_D);
    ostall_D = (val_D&((ostall_mngr_D|ostall_hazard_D)|ostall_imul_D));
    stall_D = (val_D&(((ostall_D|ostall_X)|ostall_M)|ostall_W));
    osquash_D = ((val_D&~stall_D)&pc_redirect_D);
    squash_D = (val_D&osquash_X);
    mngr2proc_rdy = ((val_D&~stall_D)&mngr2proc_rdy_D);
    imul_req_val_D = (((val_D&~stall_D)&~squash_D)&mul_D);
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
  //       s.ostall_dmem_X.value = ( s.dmemreq_type_X != nr ) & ~s.dmemreq_rdy
  //
  //       # ostall due to imul
  //       s.ostall_imul_X.value = s.mul_X & ~s.imul_resp_val_X
  //
  //       s.ostall_X.value = s.val_X & ( s.ostall_dmem_X | s.ostall_imul_X | s.ostall_xcel_X )
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
  //       s.dmemreq_val.value = s.val_X & ~s.stall_X & ( s.dmemreq_type_X != nr )
  //
  //       # send xcelreq if not stalling
  //
  //       s.xcelreq_val.value = s.val_X & ~s.stall_X & s.xcelreq_X
  //       s.xcelreq_msg_type.value  = s.xcelreq_type_X
  //
  //       if s.dmemreq_type_X == st:
  //         s.dmemreq_msg_type.value = 1  # store
  //       else:
  //         s.dmemreq_msg_type.value = 0  # don't care / load
  //
  //       # imul resp ready signal
  //
  //       s.imul_resp_rdy_X.value = s.val_X & ~s.stall_X & s.mul_X
  //
  //       # next valid bit
  //
  //       s.next_val_X.value  = s.val_X & ~s.stall_X

  // logic for comb_X()
  always @ (*) begin
    ostall_xcel_X = (xcelreq_X&~xcelreq_rdy);
    ostall_dmem_X = ((dmemreq_type_X != nr)&~dmemreq_rdy);
    ostall_imul_X = (mul_X&~imul_resp_val_X);
    ostall_X = (val_X&((ostall_dmem_X|ostall_imul_X)|ostall_xcel_X));
    stall_X = (val_X&((ostall_X|ostall_M)|ostall_W));
    osquash_X = ((val_X&~stall_X)&pc_redirect_X);
    dmemreq_val = ((val_X&~stall_X)&(dmemreq_type_X != nr));
    xcelreq_val = ((val_X&~stall_X)&xcelreq_X);
    xcelreq_msg_type = xcelreq_type_X;
    if ((dmemreq_type_X == st)) begin
      dmemreq_msg_type = 1;
    end
    else begin
      dmemreq_msg_type = 0;
    end
    imul_resp_rdy_X = ((val_X&~stall_X)&mul_X);
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
  //       s.ostall_dmem_M.value = ( s.dmemreq_type_M != nr ) & ~s.dmemresp_val
  //
  //       s.ostall_M.value = s.val_M & ( s.ostall_dmem_M | s.ostall_xcel_M )
  //
  //       # stall in M stage
  //
  //       s.stall_M.value  = s.val_M & ( s.ostall_M | s.ostall_W )
  //
  //       # set dmemresp ready if not stalling
  //
  //       s.dmemresp_rdy.value = s.val_M & ~s.stall_M & ( s.dmemreq_type_M != nr )
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
    ostall_dmem_M = ((dmemreq_type_M != nr)&~dmemresp_val);
    ostall_M = (val_M&(ostall_dmem_M|ostall_xcel_M));
    stall_M = (val_M&(ostall_M|ostall_W));
    dmemresp_rdy = ((val_M&~stall_M)&(dmemreq_type_M != nr));
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


endmodule // ProcCtrlPRTL_0x3dfd24416cd48613
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
  localparam ADD = 9;
  localparam ADDI = 10;
  localparam AND = 18;
  localparam ANDI = 19;
  localparam AUIPC = 13;
  localparam BEQ = 24;
  localparam BGE = 27;
  localparam BGEU = 29;
  localparam BLT = 26;
  localparam BLTU = 28;
  localparam BNE = 25;
  localparam CSRR = 33;
  localparam CSRRX = 36;
  localparam CSRW = 34;
  localparam JAL = 30;
  localparam JALR = 31;
  localparam LUI = 12;
  localparam LW = 1;
  localparam MUL = 32;
  localparam NOP = 0;
  localparam OR = 16;
  localparam ORI = 17;
  localparam SLL = 3;
  localparam SLLI = 4;
  localparam SLT = 20;
  localparam SLTI = 21;
  localparam SLTIU = 23;
  localparam SLTU = 22;
  localparam SRA = 7;
  localparam SRAI = 8;
  localparam SRL = 5;
  localparam SRLI = 6;
  localparam SUB = 11;
  localparam SW = 2;
  localparam XOR = 14;
  localparam XORI = 15;
  localparam ZERO = 35;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //
  //       s.out.value = ZERO
  //
  //       if   s.in_ == 0b10011:               s.out.value = NOP
  //       elif s.in_[OPCODE] == 0b0110011:
  //         if   s.in_[FUNCT7] == 0b0000000:
  //           if   s.in_[FUNCT3] == 0b000:     s.out.value = ADD
  //           elif s.in_[FUNCT3] == 0b001:     s.out.value = SLL
  //           elif s.in_[FUNCT3] == 0b010:     s.out.value = SLT
  //           elif s.in_[FUNCT3] == 0b011:     s.out.value = SLTU
  //           elif s.in_[FUNCT3] == 0b100:     s.out.value = XOR
  //           elif s.in_[FUNCT3] == 0b101:     s.out.value = SRL
  //           elif s.in_[FUNCT3] == 0b110:     s.out.value = OR
  //           elif s.in_[FUNCT3] == 0b111:     s.out.value = AND
  //         elif s.in_[FUNCT7] == 0b0100000:
  //           if   s.in_[FUNCT3] == 0b000:     s.out.value = SUB
  //           elif s.in_[FUNCT3] == 0b101:     s.out.value = SRA
  //         elif s.in_[FUNCT7] == 0b0000001:
  //           if   s.in_[FUNCT3] == 0b000:     s.out.value = MUL
  //
  //       elif s.in_[OPCODE] == 0b0010011:
  //         if   s.in_[FUNCT3] == 0b000:       s.out.value = ADDI
  //         elif s.in_[FUNCT3] == 0b010:       s.out.value = SLTI
  //         elif s.in_[FUNCT3] == 0b011:       s.out.value = SLTIU
  //         elif s.in_[FUNCT3] == 0b100:       s.out.value = XORI
  //         elif s.in_[FUNCT3] == 0b110:       s.out.value = ORI
  //         elif s.in_[FUNCT3] == 0b111:       s.out.value = ANDI
  //         elif s.in_[FUNCT3] == 0b001:       s.out.value = SLLI
  //         elif s.in_[FUNCT3] == 0b101:
  //           if   s.in_[FUNCT7] == 0b0000000: s.out.value = SRLI
  //           elif s.in_[FUNCT7] == 0b0100000: s.out.value = SRAI
  //
  //       elif s.in_[OPCODE] == 0b0100011:
  //         if   s.in_[FUNCT3] == 0b010:       s.out.value = SW
  //
  //       elif s.in_[OPCODE] == 0b0000011:
  //         if   s.in_[FUNCT3] == 0b010:       s.out.value = LW
  //
  //       elif s.in_[OPCODE] == 0b1100011:
  //         if   s.in_[FUNCT3] == 0b000:       s.out.value = BEQ
  //         elif s.in_[FUNCT3] == 0b001:       s.out.value = BNE
  //         elif s.in_[FUNCT3] == 0b100:       s.out.value = BLT
  //         elif s.in_[FUNCT3] == 0b101:       s.out.value = BGE
  //         elif s.in_[FUNCT3] == 0b110:       s.out.value = BLTU
  //         elif s.in_[FUNCT3] == 0b111:       s.out.value = BGEU
  //
  //       elif s.in_[OPCODE] == 0b0110111:     s.out.value = LUI
  //
  //       elif s.in_[OPCODE] == 0b0010111:     s.out.value = AUIPC
  //
  //       elif s.in_[OPCODE] == 0b1101111:     s.out.value = JAL
  //
  //       elif s.in_[OPCODE] == 0b1100111:     s.out.value = JALR
  //
  //       elif s.in_[OPCODE] == 0b1110011:
  //         if   s.in_[FUNCT3] == 0b001:       s.out.value = CSRW
  //         elif s.in_[FUNCT3] == 0b010:
  //           if s.in_[FUNCT7] == 0b0111111:   s.out.value = CSRRX
  //           else:                            s.out.value = CSRR

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
            if ((in_[(15)-1:12] == 2)) begin
              out = SW;
            end
            else begin
            end
          end
          else begin
            if ((in_[(7)-1:0] == 3)) begin
              if ((in_[(15)-1:12] == 2)) begin
                out = LW;
              end
              else begin
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
// TwoElementBypassQueue_0x371fd9c705010e2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 77}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module TwoElementBypassQueue_0x371fd9c705010e2
(
  input  wire [   0:0] clk,
  output wire [  76:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  output reg  [   0:0] empty,
  input  wire [  76:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output reg  [   0:0] full,
  input  wire [   0:0] reset
);

  // queue1 temporaries
  wire   [   0:0] queue1$clk;
  wire   [  76:0] queue1$enq_msg;
  wire   [   0:0] queue1$enq_val;
  wire   [   0:0] queue1$reset;
  wire   [   0:0] queue1$deq_rdy;
  wire   [   0:0] queue1$enq_rdy;
  wire   [   0:0] queue1$full;
  wire   [  76:0] queue1$deq_msg;
  wire   [   0:0] queue1$deq_val;

  SingleElementBypassQueue_0x371fd9c705010e2 queue1
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
  wire   [  76:0] queue0$enq_msg;
  wire   [   0:0] queue0$enq_val;
  wire   [   0:0] queue0$reset;
  wire   [   0:0] queue0$deq_rdy;
  wire   [   0:0] queue0$enq_rdy;
  wire   [   0:0] queue0$full;
  wire   [  76:0] queue0$deq_msg;
  wire   [   0:0] queue0$deq_val;

  SingleElementBypassQueue_0x371fd9c705010e2 queue0
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


endmodule // TwoElementBypassQueue_0x371fd9c705010e2
`default_nettype wire

//-----------------------------------------------------------------------------
// SingleElementBypassQueue_0x371fd9c705010e2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 77}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueue_0x371fd9c705010e2
(
  input  wire [   0:0] clk,
  output wire [  76:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  76:0] enq_msg,
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
  wire   [  76:0] dpath$enq_bits;
  wire   [  76:0] dpath$deq_bits;

  SingleElementBypassQueueDpath_0x371fd9c705010e2 dpath
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



endmodule // SingleElementBypassQueue_0x371fd9c705010e2
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
// SingleElementBypassQueueDpath_0x371fd9c705010e2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.queues {"dtype": 77}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SingleElementBypassQueueDpath_0x371fd9c705010e2
(
  input  wire [   0:0] bypass_mux_sel,
  input  wire [   0:0] clk,
  output wire [  76:0] deq_bits,
  input  wire [  76:0] enq_bits,
  input  wire [   0:0] reset,
  input  wire [   0:0] wen
);

  // bypass_mux temporaries
  wire   [   0:0] bypass_mux$reset;
  wire   [  76:0] bypass_mux$in_$000;
  wire   [  76:0] bypass_mux$in_$001;
  wire   [   0:0] bypass_mux$clk;
  wire   [   0:0] bypass_mux$sel;
  wire   [  76:0] bypass_mux$out;

  Mux_0x64719cfd118f0912 bypass_mux
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
  wire   [  76:0] queue$in_;
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$en;
  wire   [  76:0] queue$out;

  RegEn_0x33930f124eddbcb queue
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



endmodule // SingleElementBypassQueueDpath_0x371fd9c705010e2
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x64719cfd118f0912
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 77, "nports": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x64719cfd118f0912
(
  input  wire [   0:0] clk,
  input  wire [  76:0] in_$000,
  input  wire [  76:0] in_$001,
  output reg  [  76:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  76:0] in_[0:1];
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


endmodule // Mux_0x64719cfd118f0912
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x33930f124eddbcb
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 77}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x33930f124eddbcb
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  76:0] in_,
  output reg  [  76:0] out,
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


endmodule // RegEn_0x33930f124eddbcb
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
  input  wire [  31:0] core_id,
  input  wire [   1:0] csrr_sel_D,
  output wire [  31:0] dmemreq_msg_addr,
  output wire [  31:0] dmemreq_msg_data,
  input  wire [  31:0] dmemresp_msg_data,
  input  wire [   1:0] ex_result_sel_X,
  output reg  [  76:0] imemreq_msg,
  input  wire [  31:0] imemresp_msg_data,
  input  wire [   2:0] imm_type_D,
  output wire [   0:0] imul_req_rdy_D,
  input  wire [   0:0] imul_req_val_D,
  input  wire [   0:0] imul_resp_rdy_X,
  output wire [   0:0] imul_resp_val_X,
  output wire [  31:0] inst_D,
  input  wire [  31:0] mngr2proc_data,
  input  wire [   1:0] op1_byp_sel_D,
  input  wire [   0:0] op1_sel_D,
  input  wire [   1:0] op2_byp_sel_D,
  input  wire [   1:0] op2_sel_D,
  input  wire [   1:0] pc_sel_F,
  output wire [  31:0] proc2mngr_data,
  input  wire [   0:0] reg_en_D,
  input  wire [   0:0] reg_en_F,
  input  wire [   0:0] reg_en_M,
  input  wire [   0:0] reg_en_W,
  input  wire [   0:0] reg_en_X,
  input  wire [   0:0] reset,
  input  wire [   4:0] rf_waddr_W,
  input  wire [   0:0] rf_wen_W,
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
  wire   [  31:0] byp_data_M;
  wire   [  31:0] byp_data_W;
  wire   [  31:0] byp_data_X;
  wire   [  31:0] pc_plus4_F;
  wire   [  31:0] br_target_X;
  wire   [  31:0] rf_rdata0_D;
  wire   [  31:0] pc_F;
  wire   [  31:0] jal_target_D;


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

  // imul temporaries
  wire   [   0:0] imul$resp_rdy;
  wire   [   0:0] imul$clk;
  wire   [  63:0] imul$req_msg;
  wire   [   0:0] imul$req_val;
  wire   [   0:0] imul$reset;
  wire   [  31:0] imul$resp_msg;
  wire   [   0:0] imul$resp_val;
  wire   [   0:0] imul$req_rdy;

  IntMulScycleRTL imul
  (
    .resp_rdy ( imul$resp_rdy ),
    .clk      ( imul$clk ),
    .req_msg  ( imul$req_msg ),
    .req_val  ( imul$req_val ),
    .reset    ( imul$reset ),
    .resp_msg ( imul$resp_msg ),
    .resp_val ( imul$resp_val ),
    .req_rdy  ( imul$req_rdy )
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
  wire   [   0:0] ex_result_sel_mux_X$clk;
  wire   [   1:0] ex_result_sel_mux_X$sel;
  wire   [  31:0] ex_result_sel_mux_X$out;

  Mux_0x4144ab3fc268acb4 ex_result_sel_mux_X
  (
    .reset   ( ex_result_sel_mux_X$reset ),
    .in_$000 ( ex_result_sel_mux_X$in_$000 ),
    .in_$001 ( ex_result_sel_mux_X$in_$001 ),
    .in_$002 ( ex_result_sel_mux_X$in_$002 ),
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
  wire   [   4:0] rf$rd_addr$000;
  wire   [   4:0] rf$rd_addr$001;
  wire   [  31:0] rf$wr_data;
  wire   [   0:0] rf$clk;
  wire   [   4:0] rf$wr_addr;
  wire   [   0:0] rf$wr_en;
  wire   [   0:0] rf$reset;
  wire   [  31:0] rf$rd_data$000;
  wire   [  31:0] rf$rd_data$001;

  RegisterFile_0x423b6d418e8d6ae7 rf
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
  assign ex_result_reg_M$clk         = clk;
  assign ex_result_reg_M$en          = reg_en_M;
  assign ex_result_reg_M$in_         = ex_result_sel_mux_X$out;
  assign ex_result_reg_M$reset       = reset;
  assign ex_result_sel_mux_X$clk     = clk;
  assign ex_result_sel_mux_X$in_$000 = alu_X$out;
  assign ex_result_sel_mux_X$in_$001 = imul$resp_msg;
  assign ex_result_sel_mux_X$in_$002 = pc_incr_X$out;
  assign ex_result_sel_mux_X$reset   = reset;
  assign ex_result_sel_mux_X$sel     = ex_result_sel_X;
  assign imm_gen_D$clk               = clk;
  assign imm_gen_D$imm_type          = imm_type_D;
  assign imm_gen_D$inst              = inst_D;
  assign imm_gen_D$reset             = reset;
  assign imul$clk                    = clk;
  assign imul$req_msg[31:0]          = op2_sel_mux_D$out;
  assign imul$req_msg[63:32]         = op1_sel_mux_D$out;
  assign imul$req_val                = imul_req_val_D;
  assign imul$reset                  = reset;
  assign imul$resp_rdy               = imul_resp_rdy_X;
  assign imul_req_rdy_D              = imul$req_rdy;
  assign imul_resp_val_X             = imul$resp_val;
  assign inst_D                      = inst_D_reg$out;
  assign inst_D_reg$clk              = clk;
  assign inst_D_reg$en               = reg_en_D;
  assign inst_D_reg$in_              = imemresp_msg_data;
  assign inst_D_reg$reset            = reset;
  assign jal_target_D                = pc_plus_imm_D$out;
  assign jalr_target_X               = alu_X$out;
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
  assign rf$rd_addr$000              = inst_D[19:15];
  assign rf$rd_addr$001              = inst_D[24:20];
  assign rf$reset                    = reset;
  assign rf$wr_addr                  = rf_waddr_W;
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
  assign wb_result_sel_mux_M$in_$001 = dmemresp_msg_data;
  assign wb_result_sel_mux_M$in_$002 = xcelresp_msg_data;
  assign wb_result_sel_mux_M$reset   = reset;
  assign wb_result_sel_mux_M$sel     = wb_result_sel_M;
  assign xcelreq_msg_data            = op1_reg_X$out;
  assign xcelreq_msg_raddr           = op2_reg_X$out[4:0];


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def imem_req_F():
  //       s.imemreq_msg.addr.value  = s.pc_sel_mux_F.out

  // logic for imem_req_F()
  always @ (*) begin
    imemreq_msg[(66)-1:34] = pc_sel_mux_F$out;
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
// IntMulScycleRTL
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: lab1_imul.IntMulScyclePRTL {"nstages": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module IntMulScycleRTL
(
  input  wire [   0:0] clk,
  input  wire [  63:0] req_msg,
  output wire [   0:0] req_rdy,
  input  wire [   0:0] req_val,
  input  wire [   0:0] reset,
  output wire [  31:0] resp_msg,
  input  wire [   0:0] resp_rdy,
  output wire [   0:0] resp_val
);

  // register declarations
  reg    [  31:0] resp_queue$enq_msg;
  reg    [  63:0] result;

  // a_reg temporaries
  wire   [   0:0] a_reg$reset;
  wire   [  31:0] a_reg$in_;
  wire   [   0:0] a_reg$clk;
  wire   [   0:0] a_reg$en;
  wire   [  31:0] a_reg$out;

  RegEn_0x3392d4dd30174d2 a_reg
  (
    .reset ( a_reg$reset ),
    .in_   ( a_reg$in_ ),
    .clk   ( a_reg$clk ),
    .en    ( a_reg$en ),
    .out   ( a_reg$out )
  );

  // resp_queue temporaries
  wire   [   0:0] resp_queue$clk;
  wire   [   0:0] resp_queue$enq_val;
  wire   [   0:0] resp_queue$reset;
  wire   [   0:0] resp_queue$deq_rdy;
  wire   [   0:0] resp_queue$enq_rdy;
  wire   [   0:0] resp_queue$full;
  wire   [  31:0] resp_queue$deq_msg;
  wire   [   0:0] resp_queue$deq_val;

  SingleElementBypassQueue_0x371f9f91c7b6145 resp_queue
  (
    .clk     ( resp_queue$clk ),
    .enq_msg ( resp_queue$enq_msg ),
    .enq_val ( resp_queue$enq_val ),
    .reset   ( resp_queue$reset ),
    .deq_rdy ( resp_queue$deq_rdy ),
    .enq_rdy ( resp_queue$enq_rdy ),
    .full    ( resp_queue$full ),
    .deq_msg ( resp_queue$deq_msg ),
    .deq_val ( resp_queue$deq_val )
  );

  // val_reg temporaries
  wire   [   0:0] val_reg$reset;
  wire   [   0:0] val_reg$in_;
  wire   [   0:0] val_reg$clk;
  wire   [   0:0] val_reg$en;
  wire   [   0:0] val_reg$out;

  RegEn_0x5e7e932e291f44db val_reg
  (
    .reset ( val_reg$reset ),
    .in_   ( val_reg$in_ ),
    .clk   ( val_reg$clk ),
    .en    ( val_reg$en ),
    .out   ( val_reg$out )
  );

  // b_reg temporaries
  wire   [   0:0] b_reg$reset;
  wire   [  31:0] b_reg$in_;
  wire   [   0:0] b_reg$clk;
  wire   [   0:0] b_reg$en;
  wire   [  31:0] b_reg$out;

  RegEn_0x3392d4dd30174d2 b_reg
  (
    .reset ( b_reg$reset ),
    .in_   ( b_reg$in_ ),
    .clk   ( b_reg$clk ),
    .en    ( b_reg$en ),
    .out   ( b_reg$out )
  );

  // signal connections
  assign a_reg$clk          = clk;
  assign a_reg$en           = resp_queue$enq_rdy;
  assign a_reg$in_          = req_msg[63:32];
  assign a_reg$reset        = reset;
  assign b_reg$clk          = clk;
  assign b_reg$en           = resp_queue$enq_rdy;
  assign b_reg$in_          = req_msg[31:0];
  assign b_reg$reset        = reset;
  assign req_rdy            = resp_queue$enq_rdy;
  assign resp_msg           = resp_queue$deq_msg;
  assign resp_queue$clk     = clk;
  assign resp_queue$deq_rdy = resp_rdy;
  assign resp_queue$enq_val = val_reg$out;
  assign resp_queue$reset   = reset;
  assign resp_val           = resp_queue$deq_val;
  assign val_reg$clk        = clk;
  assign val_reg$en         = resp_queue$enq_rdy;
  assign val_reg$in_        = req_val;
  assign val_reg$reset      = reset;


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def block():
  //       s.result.value = s.a_reg.out * s.b_reg.out
  //       s.resp_queue.enq.msg.value = s.result[0:32]

  // logic for block()
  always @ (*) begin
    result = (a_reg$out*b_reg$out);
    resp_queue$enq_msg = result[(32)-1:0];
  end


endmodule // IntMulScycleRTL
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
// RegEn_0x5e7e932e291f44db
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x5e7e932e291f44db
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [   0:0] in_,
  output reg  [   0:0] out,
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


endmodule // RegEn_0x5e7e932e291f44db
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
  localparam reset_value = 32'h3ffffff8;



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
  //         s.out.value[1:32] = s.tmp_b[1:32]
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
// RegisterFile_0x423b6d418e8d6ae7
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.RegisterFile {"const_zero": true, "dtype": 32, "nregs": 32, "rd_ports": 2, "wr_ports": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegisterFile_0x423b6d418e8d6ae7
(
  input  wire [   0:0] clk,
  input  wire [   4:0] rd_addr$000,
  input  wire [   4:0] rd_addr$001,
  output wire [  31:0] rd_data$000,
  output wire [  31:0] rd_data$001,
  input  wire [   0:0] reset,
  input  wire [   4:0] wr_addr,
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


  // localparam declarations
  localparam nregs = 32;
  localparam rd_ports = 2;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   4:0] rd_addr[0:1];
  assign rd_addr[  0] = rd_addr$000;
  assign rd_addr[  1] = rd_addr$001;
  reg    [  31:0] rd_data[0:1];
  assign rd_data$000 = rd_data[  0];
  assign rd_data$001 = rd_data[  1];
  reg    [  31:0] regs[0:31];
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


endmodule // RegisterFile_0x423b6d418e8d6ae7
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

