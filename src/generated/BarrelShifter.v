// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : BarrelShifter
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module BarrelShifter (
  input  wire          io_dataIn_0_valid,
  input  wire [87:0]   io_dataIn_0_payload,
  input  wire          io_dataIn_1_valid,
  input  wire [87:0]   io_dataIn_1_payload,
  input  wire          io_dataIn_2_valid,
  input  wire [87:0]   io_dataIn_2_payload,
  input  wire          io_dataIn_3_valid,
  input  wire [87:0]   io_dataIn_3_payload,
  input  wire          io_dataIn_4_valid,
  input  wire [87:0]   io_dataIn_4_payload,
  input  wire          io_dataIn_5_valid,
  input  wire [87:0]   io_dataIn_5_payload,
  input  wire          io_dataIn_6_valid,
  input  wire [87:0]   io_dataIn_6_payload,
  input  wire          io_dataIn_7_valid,
  input  wire [87:0]   io_dataIn_7_payload,
  input  wire          io_dataIn_8_valid,
  input  wire [87:0]   io_dataIn_8_payload,
  input  wire          io_dataIn_9_valid,
  input  wire [87:0]   io_dataIn_9_payload,
  input  wire          io_dataIn_10_valid,
  input  wire [87:0]   io_dataIn_10_payload,
  input  wire          io_dataIn_11_valid,
  input  wire [87:0]   io_dataIn_11_payload,
  output wire          io_dataOut_0_valid,
  output wire [87:0]   io_dataOut_0_payload,
  output wire          io_dataOut_1_valid,
  output wire [87:0]   io_dataOut_1_payload,
  output wire          io_dataOut_2_valid,
  output wire [87:0]   io_dataOut_2_payload,
  output wire          io_dataOut_3_valid,
  output wire [87:0]   io_dataOut_3_payload,
  output wire          io_dataOut_4_valid,
  output wire [87:0]   io_dataOut_4_payload,
  output wire          io_dataOut_5_valid,
  output wire [87:0]   io_dataOut_5_payload,
  output wire          io_dataOut_6_valid,
  output wire [87:0]   io_dataOut_6_payload,
  output wire          io_dataOut_7_valid,
  output wire [87:0]   io_dataOut_7_payload,
  output wire          io_dataOut_8_valid,
  output wire [87:0]   io_dataOut_8_payload,
  output wire          io_dataOut_9_valid,
  output wire [87:0]   io_dataOut_9_payload,
  output wire          io_dataOut_10_valid,
  output wire [87:0]   io_dataOut_10_payload,
  output wire          io_dataOut_11_valid,
  output wire [87:0]   io_dataOut_11_payload,
  input  wire          io_shiftCtrl_valid,
  input  wire [11:0]   io_shiftCtrl_payload,
  input  wire          clk,
  input  wire          clrn
);

  reg                 shiftRegs_0_0_valid;
  reg        [87:0]   shiftRegs_0_0_payload;
  reg                 shiftRegs_0_1_valid;
  reg        [87:0]   shiftRegs_0_1_payload;
  reg                 shiftRegs_0_2_valid;
  reg        [87:0]   shiftRegs_0_2_payload;
  reg                 shiftRegs_0_3_valid;
  reg        [87:0]   shiftRegs_0_3_payload;
  reg                 shiftRegs_0_4_valid;
  reg        [87:0]   shiftRegs_0_4_payload;
  reg                 shiftRegs_0_5_valid;
  reg        [87:0]   shiftRegs_0_5_payload;
  reg                 shiftRegs_0_6_valid;
  reg        [87:0]   shiftRegs_0_6_payload;
  reg                 shiftRegs_0_7_valid;
  reg        [87:0]   shiftRegs_0_7_payload;
  reg                 shiftRegs_0_8_valid;
  reg        [87:0]   shiftRegs_0_8_payload;
  reg                 shiftRegs_0_9_valid;
  reg        [87:0]   shiftRegs_0_9_payload;
  reg                 shiftRegs_0_10_valid;
  reg        [87:0]   shiftRegs_0_10_payload;
  reg                 shiftRegs_0_11_valid;
  reg        [87:0]   shiftRegs_0_11_payload;
  reg                 shiftRegs_1_0_valid;
  reg        [87:0]   shiftRegs_1_0_payload;
  reg                 shiftRegs_1_1_valid;
  reg        [87:0]   shiftRegs_1_1_payload;
  reg                 shiftRegs_1_2_valid;
  reg        [87:0]   shiftRegs_1_2_payload;
  reg                 shiftRegs_1_3_valid;
  reg        [87:0]   shiftRegs_1_3_payload;
  reg                 shiftRegs_1_4_valid;
  reg        [87:0]   shiftRegs_1_4_payload;
  reg                 shiftRegs_1_5_valid;
  reg        [87:0]   shiftRegs_1_5_payload;
  reg                 shiftRegs_1_6_valid;
  reg        [87:0]   shiftRegs_1_6_payload;
  reg                 shiftRegs_1_7_valid;
  reg        [87:0]   shiftRegs_1_7_payload;
  reg                 shiftRegs_1_8_valid;
  reg        [87:0]   shiftRegs_1_8_payload;
  reg                 shiftRegs_1_9_valid;
  reg        [87:0]   shiftRegs_1_9_payload;
  reg                 shiftRegs_1_10_valid;
  reg        [87:0]   shiftRegs_1_10_payload;
  reg                 shiftRegs_1_11_valid;
  reg        [87:0]   shiftRegs_1_11_payload;
  reg                 shiftRegs_2_0_valid;
  reg        [87:0]   shiftRegs_2_0_payload;
  reg                 shiftRegs_2_1_valid;
  reg        [87:0]   shiftRegs_2_1_payload;
  reg                 shiftRegs_2_2_valid;
  reg        [87:0]   shiftRegs_2_2_payload;
  reg                 shiftRegs_2_3_valid;
  reg        [87:0]   shiftRegs_2_3_payload;
  reg                 shiftRegs_2_4_valid;
  reg        [87:0]   shiftRegs_2_4_payload;
  reg                 shiftRegs_2_5_valid;
  reg        [87:0]   shiftRegs_2_5_payload;
  reg                 shiftRegs_2_6_valid;
  reg        [87:0]   shiftRegs_2_6_payload;
  reg                 shiftRegs_2_7_valid;
  reg        [87:0]   shiftRegs_2_7_payload;
  reg                 shiftRegs_2_8_valid;
  reg        [87:0]   shiftRegs_2_8_payload;
  reg                 shiftRegs_2_9_valid;
  reg        [87:0]   shiftRegs_2_9_payload;
  reg                 shiftRegs_2_10_valid;
  reg        [87:0]   shiftRegs_2_10_payload;
  reg                 shiftRegs_2_11_valid;
  reg        [87:0]   shiftRegs_2_11_payload;
  reg                 shiftRegs_3_0_valid;
  reg        [87:0]   shiftRegs_3_0_payload;
  reg                 shiftRegs_3_1_valid;
  reg        [87:0]   shiftRegs_3_1_payload;
  reg                 shiftRegs_3_2_valid;
  reg        [87:0]   shiftRegs_3_2_payload;
  reg                 shiftRegs_3_3_valid;
  reg        [87:0]   shiftRegs_3_3_payload;
  reg                 shiftRegs_3_4_valid;
  reg        [87:0]   shiftRegs_3_4_payload;
  reg                 shiftRegs_3_5_valid;
  reg        [87:0]   shiftRegs_3_5_payload;
  reg                 shiftRegs_3_6_valid;
  reg        [87:0]   shiftRegs_3_6_payload;
  reg                 shiftRegs_3_7_valid;
  reg        [87:0]   shiftRegs_3_7_payload;
  reg                 shiftRegs_3_8_valid;
  reg        [87:0]   shiftRegs_3_8_payload;
  reg                 shiftRegs_3_9_valid;
  reg        [87:0]   shiftRegs_3_9_payload;
  reg                 shiftRegs_3_10_valid;
  reg        [87:0]   shiftRegs_3_10_payload;
  reg                 shiftRegs_3_11_valid;
  reg        [87:0]   shiftRegs_3_11_payload;
  reg                 shiftRegs_4_0_valid;
  reg        [87:0]   shiftRegs_4_0_payload;
  reg                 shiftRegs_4_1_valid;
  reg        [87:0]   shiftRegs_4_1_payload;
  reg                 shiftRegs_4_2_valid;
  reg        [87:0]   shiftRegs_4_2_payload;
  reg                 shiftRegs_4_3_valid;
  reg        [87:0]   shiftRegs_4_3_payload;
  reg                 shiftRegs_4_4_valid;
  reg        [87:0]   shiftRegs_4_4_payload;
  reg                 shiftRegs_4_5_valid;
  reg        [87:0]   shiftRegs_4_5_payload;
  reg                 shiftRegs_4_6_valid;
  reg        [87:0]   shiftRegs_4_6_payload;
  reg                 shiftRegs_4_7_valid;
  reg        [87:0]   shiftRegs_4_7_payload;
  reg                 shiftRegs_4_8_valid;
  reg        [87:0]   shiftRegs_4_8_payload;
  reg                 shiftRegs_4_9_valid;
  reg        [87:0]   shiftRegs_4_9_payload;
  reg                 shiftRegs_4_10_valid;
  reg        [87:0]   shiftRegs_4_10_payload;
  reg                 shiftRegs_4_11_valid;
  reg        [87:0]   shiftRegs_4_11_payload;
  reg        [11:0]   shiftCtrlReg_0;
  reg        [11:0]   shiftCtrlReg_1;
  reg        [11:0]   shiftCtrlReg_2;
  reg        [11:0]   shiftCtrlReg_3;
  wire                when_BarrelShifter_l20;
  wire                when_BarrelShifter_l20_1;
  wire                when_BarrelShifter_l20_2;
  wire                when_BarrelShifter_l20_3;
  wire                when_BarrelShifter_l20_4;
  wire                when_BarrelShifter_l20_5;
  wire                when_BarrelShifter_l20_6;
  wire                when_BarrelShifter_l20_7;
  wire                when_BarrelShifter_l20_8;
  wire                when_BarrelShifter_l20_9;
  wire                when_BarrelShifter_l20_10;
  wire                when_BarrelShifter_l20_11;
  wire                when_BarrelShifter_l20_12;
  wire                when_BarrelShifter_l20_13;
  wire                when_BarrelShifter_l20_14;
  wire                when_BarrelShifter_l20_15;
  wire                when_BarrelShifter_l20_16;
  wire                when_BarrelShifter_l20_17;
  wire                when_BarrelShifter_l20_18;
  wire                when_BarrelShifter_l20_19;
  wire                when_BarrelShifter_l20_20;
  wire                when_BarrelShifter_l20_21;
  wire                when_BarrelShifter_l20_22;
  wire                when_BarrelShifter_l20_23;
  wire                when_BarrelShifter_l20_24;
  wire                when_BarrelShifter_l20_25;
  wire                when_BarrelShifter_l20_26;
  wire                when_BarrelShifter_l20_27;
  wire                when_BarrelShifter_l20_28;
  wire                when_BarrelShifter_l20_29;
  wire                when_BarrelShifter_l20_30;
  wire                when_BarrelShifter_l20_31;
  wire                when_BarrelShifter_l20_32;
  wire                when_BarrelShifter_l20_33;
  wire                when_BarrelShifter_l20_34;
  wire                when_BarrelShifter_l20_35;
  wire                when_BarrelShifter_l20_36;
  wire                when_BarrelShifter_l20_37;
  wire                when_BarrelShifter_l20_38;
  wire                when_BarrelShifter_l20_39;
  wire                when_BarrelShifter_l20_40;
  wire                when_BarrelShifter_l20_41;
  wire                when_BarrelShifter_l20_42;
  wire                when_BarrelShifter_l20_43;
  wire                when_BarrelShifter_l20_44;
  wire                when_BarrelShifter_l20_45;
  wire                when_BarrelShifter_l20_46;
  wire                when_BarrelShifter_l20_47;

  assign when_BarrelShifter_l20 = shiftCtrlReg_0[0];
  assign when_BarrelShifter_l20_1 = shiftCtrlReg_0[1];
  assign when_BarrelShifter_l20_2 = shiftCtrlReg_0[2];
  assign when_BarrelShifter_l20_3 = shiftCtrlReg_0[3];
  assign when_BarrelShifter_l20_4 = shiftCtrlReg_0[4];
  assign when_BarrelShifter_l20_5 = shiftCtrlReg_0[5];
  assign when_BarrelShifter_l20_6 = shiftCtrlReg_0[6];
  assign when_BarrelShifter_l20_7 = shiftCtrlReg_0[7];
  assign when_BarrelShifter_l20_8 = shiftCtrlReg_0[8];
  assign when_BarrelShifter_l20_9 = shiftCtrlReg_0[9];
  assign when_BarrelShifter_l20_10 = shiftCtrlReg_0[10];
  assign when_BarrelShifter_l20_11 = shiftCtrlReg_0[11];
  assign when_BarrelShifter_l20_12 = shiftCtrlReg_1[0];
  assign when_BarrelShifter_l20_13 = shiftCtrlReg_1[1];
  assign when_BarrelShifter_l20_14 = shiftCtrlReg_1[2];
  assign when_BarrelShifter_l20_15 = shiftCtrlReg_1[3];
  assign when_BarrelShifter_l20_16 = shiftCtrlReg_1[4];
  assign when_BarrelShifter_l20_17 = shiftCtrlReg_1[5];
  assign when_BarrelShifter_l20_18 = shiftCtrlReg_1[6];
  assign when_BarrelShifter_l20_19 = shiftCtrlReg_1[7];
  assign when_BarrelShifter_l20_20 = shiftCtrlReg_1[8];
  assign when_BarrelShifter_l20_21 = shiftCtrlReg_1[9];
  assign when_BarrelShifter_l20_22 = shiftCtrlReg_1[10];
  assign when_BarrelShifter_l20_23 = shiftCtrlReg_1[11];
  assign when_BarrelShifter_l20_24 = shiftCtrlReg_2[0];
  assign when_BarrelShifter_l20_25 = shiftCtrlReg_2[1];
  assign when_BarrelShifter_l20_26 = shiftCtrlReg_2[2];
  assign when_BarrelShifter_l20_27 = shiftCtrlReg_2[3];
  assign when_BarrelShifter_l20_28 = shiftCtrlReg_2[4];
  assign when_BarrelShifter_l20_29 = shiftCtrlReg_2[5];
  assign when_BarrelShifter_l20_30 = shiftCtrlReg_2[6];
  assign when_BarrelShifter_l20_31 = shiftCtrlReg_2[7];
  assign when_BarrelShifter_l20_32 = shiftCtrlReg_2[8];
  assign when_BarrelShifter_l20_33 = shiftCtrlReg_2[9];
  assign when_BarrelShifter_l20_34 = shiftCtrlReg_2[10];
  assign when_BarrelShifter_l20_35 = shiftCtrlReg_2[11];
  assign when_BarrelShifter_l20_36 = shiftCtrlReg_3[0];
  assign when_BarrelShifter_l20_37 = shiftCtrlReg_3[1];
  assign when_BarrelShifter_l20_38 = shiftCtrlReg_3[2];
  assign when_BarrelShifter_l20_39 = shiftCtrlReg_3[3];
  assign when_BarrelShifter_l20_40 = shiftCtrlReg_3[4];
  assign when_BarrelShifter_l20_41 = shiftCtrlReg_3[5];
  assign when_BarrelShifter_l20_42 = shiftCtrlReg_3[6];
  assign when_BarrelShifter_l20_43 = shiftCtrlReg_3[7];
  assign when_BarrelShifter_l20_44 = shiftCtrlReg_3[8];
  assign when_BarrelShifter_l20_45 = shiftCtrlReg_3[9];
  assign when_BarrelShifter_l20_46 = shiftCtrlReg_3[10];
  assign when_BarrelShifter_l20_47 = shiftCtrlReg_3[11];
  assign io_dataOut_0_valid = shiftRegs_4_0_valid;
  assign io_dataOut_0_payload = shiftRegs_4_0_payload;
  assign io_dataOut_1_valid = shiftRegs_4_1_valid;
  assign io_dataOut_1_payload = shiftRegs_4_1_payload;
  assign io_dataOut_2_valid = shiftRegs_4_2_valid;
  assign io_dataOut_2_payload = shiftRegs_4_2_payload;
  assign io_dataOut_3_valid = shiftRegs_4_3_valid;
  assign io_dataOut_3_payload = shiftRegs_4_3_payload;
  assign io_dataOut_4_valid = shiftRegs_4_4_valid;
  assign io_dataOut_4_payload = shiftRegs_4_4_payload;
  assign io_dataOut_5_valid = shiftRegs_4_5_valid;
  assign io_dataOut_5_payload = shiftRegs_4_5_payload;
  assign io_dataOut_6_valid = shiftRegs_4_6_valid;
  assign io_dataOut_6_payload = shiftRegs_4_6_payload;
  assign io_dataOut_7_valid = shiftRegs_4_7_valid;
  assign io_dataOut_7_payload = shiftRegs_4_7_payload;
  assign io_dataOut_8_valid = shiftRegs_4_8_valid;
  assign io_dataOut_8_payload = shiftRegs_4_8_payload;
  assign io_dataOut_9_valid = shiftRegs_4_9_valid;
  assign io_dataOut_9_payload = shiftRegs_4_9_payload;
  assign io_dataOut_10_valid = shiftRegs_4_10_valid;
  assign io_dataOut_10_payload = shiftRegs_4_10_payload;
  assign io_dataOut_11_valid = shiftRegs_4_11_valid;
  assign io_dataOut_11_payload = shiftRegs_4_11_payload;
  always @(posedge clk) begin
    if(!clrn) begin
      shiftRegs_0_0_valid <= 1'b0;
      shiftRegs_0_1_valid <= 1'b0;
      shiftRegs_0_2_valid <= 1'b0;
      shiftRegs_0_3_valid <= 1'b0;
      shiftRegs_0_4_valid <= 1'b0;
      shiftRegs_0_5_valid <= 1'b0;
      shiftRegs_0_6_valid <= 1'b0;
      shiftRegs_0_7_valid <= 1'b0;
      shiftRegs_0_8_valid <= 1'b0;
      shiftRegs_0_9_valid <= 1'b0;
      shiftRegs_0_10_valid <= 1'b0;
      shiftRegs_0_11_valid <= 1'b0;
      shiftRegs_1_0_valid <= 1'b0;
      shiftRegs_1_1_valid <= 1'b0;
      shiftRegs_1_2_valid <= 1'b0;
      shiftRegs_1_3_valid <= 1'b0;
      shiftRegs_1_4_valid <= 1'b0;
      shiftRegs_1_5_valid <= 1'b0;
      shiftRegs_1_6_valid <= 1'b0;
      shiftRegs_1_7_valid <= 1'b0;
      shiftRegs_1_8_valid <= 1'b0;
      shiftRegs_1_9_valid <= 1'b0;
      shiftRegs_1_10_valid <= 1'b0;
      shiftRegs_1_11_valid <= 1'b0;
      shiftRegs_2_0_valid <= 1'b0;
      shiftRegs_2_1_valid <= 1'b0;
      shiftRegs_2_2_valid <= 1'b0;
      shiftRegs_2_3_valid <= 1'b0;
      shiftRegs_2_4_valid <= 1'b0;
      shiftRegs_2_5_valid <= 1'b0;
      shiftRegs_2_6_valid <= 1'b0;
      shiftRegs_2_7_valid <= 1'b0;
      shiftRegs_2_8_valid <= 1'b0;
      shiftRegs_2_9_valid <= 1'b0;
      shiftRegs_2_10_valid <= 1'b0;
      shiftRegs_2_11_valid <= 1'b0;
      shiftRegs_3_0_valid <= 1'b0;
      shiftRegs_3_1_valid <= 1'b0;
      shiftRegs_3_2_valid <= 1'b0;
      shiftRegs_3_3_valid <= 1'b0;
      shiftRegs_3_4_valid <= 1'b0;
      shiftRegs_3_5_valid <= 1'b0;
      shiftRegs_3_6_valid <= 1'b0;
      shiftRegs_3_7_valid <= 1'b0;
      shiftRegs_3_8_valid <= 1'b0;
      shiftRegs_3_9_valid <= 1'b0;
      shiftRegs_3_10_valid <= 1'b0;
      shiftRegs_3_11_valid <= 1'b0;
      shiftRegs_4_0_valid <= 1'b0;
      shiftRegs_4_1_valid <= 1'b0;
      shiftRegs_4_2_valid <= 1'b0;
      shiftRegs_4_3_valid <= 1'b0;
      shiftRegs_4_4_valid <= 1'b0;
      shiftRegs_4_5_valid <= 1'b0;
      shiftRegs_4_6_valid <= 1'b0;
      shiftRegs_4_7_valid <= 1'b0;
      shiftRegs_4_8_valid <= 1'b0;
      shiftRegs_4_9_valid <= 1'b0;
      shiftRegs_4_10_valid <= 1'b0;
      shiftRegs_4_11_valid <= 1'b0;
      shiftCtrlReg_0 <= 12'h000;
      shiftCtrlReg_1 <= 12'h000;
      shiftCtrlReg_2 <= 12'h000;
      shiftCtrlReg_3 <= 12'h000;
    end else begin
      if(when_BarrelShifter_l20) begin
        shiftRegs_1_0_valid <= shiftRegs_0_0_valid;
      end else begin
        shiftRegs_1_0_valid <= shiftRegs_0_1_valid;
      end
      if(when_BarrelShifter_l20_1) begin
        shiftRegs_1_1_valid <= shiftRegs_0_1_valid;
      end else begin
        shiftRegs_1_1_valid <= shiftRegs_0_2_valid;
      end
      if(when_BarrelShifter_l20_2) begin
        shiftRegs_1_2_valid <= shiftRegs_0_2_valid;
      end else begin
        shiftRegs_1_2_valid <= shiftRegs_0_3_valid;
      end
      if(when_BarrelShifter_l20_3) begin
        shiftRegs_1_3_valid <= shiftRegs_0_3_valid;
      end else begin
        shiftRegs_1_3_valid <= shiftRegs_0_4_valid;
      end
      if(when_BarrelShifter_l20_4) begin
        shiftRegs_1_4_valid <= shiftRegs_0_4_valid;
      end else begin
        shiftRegs_1_4_valid <= shiftRegs_0_5_valid;
      end
      if(when_BarrelShifter_l20_5) begin
        shiftRegs_1_5_valid <= shiftRegs_0_5_valid;
      end else begin
        shiftRegs_1_5_valid <= shiftRegs_0_6_valid;
      end
      if(when_BarrelShifter_l20_6) begin
        shiftRegs_1_6_valid <= shiftRegs_0_6_valid;
      end else begin
        shiftRegs_1_6_valid <= shiftRegs_0_7_valid;
      end
      if(when_BarrelShifter_l20_7) begin
        shiftRegs_1_7_valid <= shiftRegs_0_7_valid;
      end else begin
        shiftRegs_1_7_valid <= shiftRegs_0_8_valid;
      end
      if(when_BarrelShifter_l20_8) begin
        shiftRegs_1_8_valid <= shiftRegs_0_8_valid;
      end else begin
        shiftRegs_1_8_valid <= shiftRegs_0_9_valid;
      end
      if(when_BarrelShifter_l20_9) begin
        shiftRegs_1_9_valid <= shiftRegs_0_9_valid;
      end else begin
        shiftRegs_1_9_valid <= shiftRegs_0_10_valid;
      end
      if(when_BarrelShifter_l20_10) begin
        shiftRegs_1_10_valid <= shiftRegs_0_10_valid;
      end else begin
        shiftRegs_1_10_valid <= shiftRegs_0_11_valid;
      end
      if(when_BarrelShifter_l20_11) begin
        shiftRegs_1_11_valid <= shiftRegs_0_11_valid;
      end else begin
        shiftRegs_1_11_valid <= shiftRegs_0_0_valid;
      end
      if(when_BarrelShifter_l20_12) begin
        shiftRegs_2_0_valid <= shiftRegs_1_0_valid;
      end else begin
        shiftRegs_2_0_valid <= shiftRegs_1_2_valid;
      end
      if(when_BarrelShifter_l20_13) begin
        shiftRegs_2_1_valid <= shiftRegs_1_1_valid;
      end else begin
        shiftRegs_2_1_valid <= shiftRegs_1_3_valid;
      end
      if(when_BarrelShifter_l20_14) begin
        shiftRegs_2_2_valid <= shiftRegs_1_2_valid;
      end else begin
        shiftRegs_2_2_valid <= shiftRegs_1_4_valid;
      end
      if(when_BarrelShifter_l20_15) begin
        shiftRegs_2_3_valid <= shiftRegs_1_3_valid;
      end else begin
        shiftRegs_2_3_valid <= shiftRegs_1_5_valid;
      end
      if(when_BarrelShifter_l20_16) begin
        shiftRegs_2_4_valid <= shiftRegs_1_4_valid;
      end else begin
        shiftRegs_2_4_valid <= shiftRegs_1_6_valid;
      end
      if(when_BarrelShifter_l20_17) begin
        shiftRegs_2_5_valid <= shiftRegs_1_5_valid;
      end else begin
        shiftRegs_2_5_valid <= shiftRegs_1_7_valid;
      end
      if(when_BarrelShifter_l20_18) begin
        shiftRegs_2_6_valid <= shiftRegs_1_6_valid;
      end else begin
        shiftRegs_2_6_valid <= shiftRegs_1_8_valid;
      end
      if(when_BarrelShifter_l20_19) begin
        shiftRegs_2_7_valid <= shiftRegs_1_7_valid;
      end else begin
        shiftRegs_2_7_valid <= shiftRegs_1_9_valid;
      end
      if(when_BarrelShifter_l20_20) begin
        shiftRegs_2_8_valid <= shiftRegs_1_8_valid;
      end else begin
        shiftRegs_2_8_valid <= shiftRegs_1_10_valid;
      end
      if(when_BarrelShifter_l20_21) begin
        shiftRegs_2_9_valid <= shiftRegs_1_9_valid;
      end else begin
        shiftRegs_2_9_valid <= shiftRegs_1_11_valid;
      end
      if(when_BarrelShifter_l20_22) begin
        shiftRegs_2_10_valid <= shiftRegs_1_10_valid;
      end else begin
        shiftRegs_2_10_valid <= shiftRegs_1_0_valid;
      end
      if(when_BarrelShifter_l20_23) begin
        shiftRegs_2_11_valid <= shiftRegs_1_11_valid;
      end else begin
        shiftRegs_2_11_valid <= shiftRegs_1_1_valid;
      end
      if(when_BarrelShifter_l20_24) begin
        shiftRegs_3_0_valid <= shiftRegs_2_0_valid;
      end else begin
        shiftRegs_3_0_valid <= shiftRegs_2_4_valid;
      end
      if(when_BarrelShifter_l20_25) begin
        shiftRegs_3_1_valid <= shiftRegs_2_1_valid;
      end else begin
        shiftRegs_3_1_valid <= shiftRegs_2_5_valid;
      end
      if(when_BarrelShifter_l20_26) begin
        shiftRegs_3_2_valid <= shiftRegs_2_2_valid;
      end else begin
        shiftRegs_3_2_valid <= shiftRegs_2_6_valid;
      end
      if(when_BarrelShifter_l20_27) begin
        shiftRegs_3_3_valid <= shiftRegs_2_3_valid;
      end else begin
        shiftRegs_3_3_valid <= shiftRegs_2_7_valid;
      end
      if(when_BarrelShifter_l20_28) begin
        shiftRegs_3_4_valid <= shiftRegs_2_4_valid;
      end else begin
        shiftRegs_3_4_valid <= shiftRegs_2_8_valid;
      end
      if(when_BarrelShifter_l20_29) begin
        shiftRegs_3_5_valid <= shiftRegs_2_5_valid;
      end else begin
        shiftRegs_3_5_valid <= shiftRegs_2_9_valid;
      end
      if(when_BarrelShifter_l20_30) begin
        shiftRegs_3_6_valid <= shiftRegs_2_6_valid;
      end else begin
        shiftRegs_3_6_valid <= shiftRegs_2_10_valid;
      end
      if(when_BarrelShifter_l20_31) begin
        shiftRegs_3_7_valid <= shiftRegs_2_7_valid;
      end else begin
        shiftRegs_3_7_valid <= shiftRegs_2_11_valid;
      end
      if(when_BarrelShifter_l20_32) begin
        shiftRegs_3_8_valid <= shiftRegs_2_8_valid;
      end else begin
        shiftRegs_3_8_valid <= shiftRegs_2_0_valid;
      end
      if(when_BarrelShifter_l20_33) begin
        shiftRegs_3_9_valid <= shiftRegs_2_9_valid;
      end else begin
        shiftRegs_3_9_valid <= shiftRegs_2_1_valid;
      end
      if(when_BarrelShifter_l20_34) begin
        shiftRegs_3_10_valid <= shiftRegs_2_10_valid;
      end else begin
        shiftRegs_3_10_valid <= shiftRegs_2_2_valid;
      end
      if(when_BarrelShifter_l20_35) begin
        shiftRegs_3_11_valid <= shiftRegs_2_11_valid;
      end else begin
        shiftRegs_3_11_valid <= shiftRegs_2_3_valid;
      end
      if(when_BarrelShifter_l20_36) begin
        shiftRegs_4_0_valid <= shiftRegs_3_0_valid;
      end else begin
        shiftRegs_4_0_valid <= shiftRegs_3_8_valid;
      end
      if(when_BarrelShifter_l20_37) begin
        shiftRegs_4_1_valid <= shiftRegs_3_1_valid;
      end else begin
        shiftRegs_4_1_valid <= shiftRegs_3_9_valid;
      end
      if(when_BarrelShifter_l20_38) begin
        shiftRegs_4_2_valid <= shiftRegs_3_2_valid;
      end else begin
        shiftRegs_4_2_valid <= shiftRegs_3_10_valid;
      end
      if(when_BarrelShifter_l20_39) begin
        shiftRegs_4_3_valid <= shiftRegs_3_3_valid;
      end else begin
        shiftRegs_4_3_valid <= shiftRegs_3_11_valid;
      end
      if(when_BarrelShifter_l20_40) begin
        shiftRegs_4_4_valid <= shiftRegs_3_4_valid;
      end else begin
        shiftRegs_4_4_valid <= shiftRegs_3_0_valid;
      end
      if(when_BarrelShifter_l20_41) begin
        shiftRegs_4_5_valid <= shiftRegs_3_5_valid;
      end else begin
        shiftRegs_4_5_valid <= shiftRegs_3_1_valid;
      end
      if(when_BarrelShifter_l20_42) begin
        shiftRegs_4_6_valid <= shiftRegs_3_6_valid;
      end else begin
        shiftRegs_4_6_valid <= shiftRegs_3_2_valid;
      end
      if(when_BarrelShifter_l20_43) begin
        shiftRegs_4_7_valid <= shiftRegs_3_7_valid;
      end else begin
        shiftRegs_4_7_valid <= shiftRegs_3_3_valid;
      end
      if(when_BarrelShifter_l20_44) begin
        shiftRegs_4_8_valid <= shiftRegs_3_8_valid;
      end else begin
        shiftRegs_4_8_valid <= shiftRegs_3_4_valid;
      end
      if(when_BarrelShifter_l20_45) begin
        shiftRegs_4_9_valid <= shiftRegs_3_9_valid;
      end else begin
        shiftRegs_4_9_valid <= shiftRegs_3_5_valid;
      end
      if(when_BarrelShifter_l20_46) begin
        shiftRegs_4_10_valid <= shiftRegs_3_10_valid;
      end else begin
        shiftRegs_4_10_valid <= shiftRegs_3_6_valid;
      end
      if(when_BarrelShifter_l20_47) begin
        shiftRegs_4_11_valid <= shiftRegs_3_11_valid;
      end else begin
        shiftRegs_4_11_valid <= shiftRegs_3_7_valid;
      end
      shiftRegs_0_0_valid <= io_dataIn_0_valid;
      shiftRegs_0_1_valid <= io_dataIn_1_valid;
      shiftRegs_0_2_valid <= io_dataIn_2_valid;
      shiftRegs_0_3_valid <= io_dataIn_3_valid;
      shiftRegs_0_4_valid <= io_dataIn_4_valid;
      shiftRegs_0_5_valid <= io_dataIn_5_valid;
      shiftRegs_0_6_valid <= io_dataIn_6_valid;
      shiftRegs_0_7_valid <= io_dataIn_7_valid;
      shiftRegs_0_8_valid <= io_dataIn_8_valid;
      shiftRegs_0_9_valid <= io_dataIn_9_valid;
      shiftRegs_0_10_valid <= io_dataIn_10_valid;
      shiftRegs_0_11_valid <= io_dataIn_11_valid;
      if(io_shiftCtrl_valid) begin
        shiftCtrlReg_1 <= shiftCtrlReg_0;
        shiftCtrlReg_2 <= shiftCtrlReg_1;
        shiftCtrlReg_3 <= shiftCtrlReg_2;
        shiftCtrlReg_0 <= io_shiftCtrl_payload;
      end
    end
  end

  always @(posedge clk) begin
    if(when_BarrelShifter_l20) begin
      shiftRegs_1_0_payload <= shiftRegs_0_0_payload;
    end else begin
      shiftRegs_1_0_payload <= shiftRegs_0_1_payload;
    end
    if(when_BarrelShifter_l20_1) begin
      shiftRegs_1_1_payload <= shiftRegs_0_1_payload;
    end else begin
      shiftRegs_1_1_payload <= shiftRegs_0_2_payload;
    end
    if(when_BarrelShifter_l20_2) begin
      shiftRegs_1_2_payload <= shiftRegs_0_2_payload;
    end else begin
      shiftRegs_1_2_payload <= shiftRegs_0_3_payload;
    end
    if(when_BarrelShifter_l20_3) begin
      shiftRegs_1_3_payload <= shiftRegs_0_3_payload;
    end else begin
      shiftRegs_1_3_payload <= shiftRegs_0_4_payload;
    end
    if(when_BarrelShifter_l20_4) begin
      shiftRegs_1_4_payload <= shiftRegs_0_4_payload;
    end else begin
      shiftRegs_1_4_payload <= shiftRegs_0_5_payload;
    end
    if(when_BarrelShifter_l20_5) begin
      shiftRegs_1_5_payload <= shiftRegs_0_5_payload;
    end else begin
      shiftRegs_1_5_payload <= shiftRegs_0_6_payload;
    end
    if(when_BarrelShifter_l20_6) begin
      shiftRegs_1_6_payload <= shiftRegs_0_6_payload;
    end else begin
      shiftRegs_1_6_payload <= shiftRegs_0_7_payload;
    end
    if(when_BarrelShifter_l20_7) begin
      shiftRegs_1_7_payload <= shiftRegs_0_7_payload;
    end else begin
      shiftRegs_1_7_payload <= shiftRegs_0_8_payload;
    end
    if(when_BarrelShifter_l20_8) begin
      shiftRegs_1_8_payload <= shiftRegs_0_8_payload;
    end else begin
      shiftRegs_1_8_payload <= shiftRegs_0_9_payload;
    end
    if(when_BarrelShifter_l20_9) begin
      shiftRegs_1_9_payload <= shiftRegs_0_9_payload;
    end else begin
      shiftRegs_1_9_payload <= shiftRegs_0_10_payload;
    end
    if(when_BarrelShifter_l20_10) begin
      shiftRegs_1_10_payload <= shiftRegs_0_10_payload;
    end else begin
      shiftRegs_1_10_payload <= shiftRegs_0_11_payload;
    end
    if(when_BarrelShifter_l20_11) begin
      shiftRegs_1_11_payload <= shiftRegs_0_11_payload;
    end else begin
      shiftRegs_1_11_payload <= shiftRegs_0_0_payload;
    end
    if(when_BarrelShifter_l20_12) begin
      shiftRegs_2_0_payload <= shiftRegs_1_0_payload;
    end else begin
      shiftRegs_2_0_payload <= shiftRegs_1_2_payload;
    end
    if(when_BarrelShifter_l20_13) begin
      shiftRegs_2_1_payload <= shiftRegs_1_1_payload;
    end else begin
      shiftRegs_2_1_payload <= shiftRegs_1_3_payload;
    end
    if(when_BarrelShifter_l20_14) begin
      shiftRegs_2_2_payload <= shiftRegs_1_2_payload;
    end else begin
      shiftRegs_2_2_payload <= shiftRegs_1_4_payload;
    end
    if(when_BarrelShifter_l20_15) begin
      shiftRegs_2_3_payload <= shiftRegs_1_3_payload;
    end else begin
      shiftRegs_2_3_payload <= shiftRegs_1_5_payload;
    end
    if(when_BarrelShifter_l20_16) begin
      shiftRegs_2_4_payload <= shiftRegs_1_4_payload;
    end else begin
      shiftRegs_2_4_payload <= shiftRegs_1_6_payload;
    end
    if(when_BarrelShifter_l20_17) begin
      shiftRegs_2_5_payload <= shiftRegs_1_5_payload;
    end else begin
      shiftRegs_2_5_payload <= shiftRegs_1_7_payload;
    end
    if(when_BarrelShifter_l20_18) begin
      shiftRegs_2_6_payload <= shiftRegs_1_6_payload;
    end else begin
      shiftRegs_2_6_payload <= shiftRegs_1_8_payload;
    end
    if(when_BarrelShifter_l20_19) begin
      shiftRegs_2_7_payload <= shiftRegs_1_7_payload;
    end else begin
      shiftRegs_2_7_payload <= shiftRegs_1_9_payload;
    end
    if(when_BarrelShifter_l20_20) begin
      shiftRegs_2_8_payload <= shiftRegs_1_8_payload;
    end else begin
      shiftRegs_2_8_payload <= shiftRegs_1_10_payload;
    end
    if(when_BarrelShifter_l20_21) begin
      shiftRegs_2_9_payload <= shiftRegs_1_9_payload;
    end else begin
      shiftRegs_2_9_payload <= shiftRegs_1_11_payload;
    end
    if(when_BarrelShifter_l20_22) begin
      shiftRegs_2_10_payload <= shiftRegs_1_10_payload;
    end else begin
      shiftRegs_2_10_payload <= shiftRegs_1_0_payload;
    end
    if(when_BarrelShifter_l20_23) begin
      shiftRegs_2_11_payload <= shiftRegs_1_11_payload;
    end else begin
      shiftRegs_2_11_payload <= shiftRegs_1_1_payload;
    end
    if(when_BarrelShifter_l20_24) begin
      shiftRegs_3_0_payload <= shiftRegs_2_0_payload;
    end else begin
      shiftRegs_3_0_payload <= shiftRegs_2_4_payload;
    end
    if(when_BarrelShifter_l20_25) begin
      shiftRegs_3_1_payload <= shiftRegs_2_1_payload;
    end else begin
      shiftRegs_3_1_payload <= shiftRegs_2_5_payload;
    end
    if(when_BarrelShifter_l20_26) begin
      shiftRegs_3_2_payload <= shiftRegs_2_2_payload;
    end else begin
      shiftRegs_3_2_payload <= shiftRegs_2_6_payload;
    end
    if(when_BarrelShifter_l20_27) begin
      shiftRegs_3_3_payload <= shiftRegs_2_3_payload;
    end else begin
      shiftRegs_3_3_payload <= shiftRegs_2_7_payload;
    end
    if(when_BarrelShifter_l20_28) begin
      shiftRegs_3_4_payload <= shiftRegs_2_4_payload;
    end else begin
      shiftRegs_3_4_payload <= shiftRegs_2_8_payload;
    end
    if(when_BarrelShifter_l20_29) begin
      shiftRegs_3_5_payload <= shiftRegs_2_5_payload;
    end else begin
      shiftRegs_3_5_payload <= shiftRegs_2_9_payload;
    end
    if(when_BarrelShifter_l20_30) begin
      shiftRegs_3_6_payload <= shiftRegs_2_6_payload;
    end else begin
      shiftRegs_3_6_payload <= shiftRegs_2_10_payload;
    end
    if(when_BarrelShifter_l20_31) begin
      shiftRegs_3_7_payload <= shiftRegs_2_7_payload;
    end else begin
      shiftRegs_3_7_payload <= shiftRegs_2_11_payload;
    end
    if(when_BarrelShifter_l20_32) begin
      shiftRegs_3_8_payload <= shiftRegs_2_8_payload;
    end else begin
      shiftRegs_3_8_payload <= shiftRegs_2_0_payload;
    end
    if(when_BarrelShifter_l20_33) begin
      shiftRegs_3_9_payload <= shiftRegs_2_9_payload;
    end else begin
      shiftRegs_3_9_payload <= shiftRegs_2_1_payload;
    end
    if(when_BarrelShifter_l20_34) begin
      shiftRegs_3_10_payload <= shiftRegs_2_10_payload;
    end else begin
      shiftRegs_3_10_payload <= shiftRegs_2_2_payload;
    end
    if(when_BarrelShifter_l20_35) begin
      shiftRegs_3_11_payload <= shiftRegs_2_11_payload;
    end else begin
      shiftRegs_3_11_payload <= shiftRegs_2_3_payload;
    end
    if(when_BarrelShifter_l20_36) begin
      shiftRegs_4_0_payload <= shiftRegs_3_0_payload;
    end else begin
      shiftRegs_4_0_payload <= shiftRegs_3_8_payload;
    end
    if(when_BarrelShifter_l20_37) begin
      shiftRegs_4_1_payload <= shiftRegs_3_1_payload;
    end else begin
      shiftRegs_4_1_payload <= shiftRegs_3_9_payload;
    end
    if(when_BarrelShifter_l20_38) begin
      shiftRegs_4_2_payload <= shiftRegs_3_2_payload;
    end else begin
      shiftRegs_4_2_payload <= shiftRegs_3_10_payload;
    end
    if(when_BarrelShifter_l20_39) begin
      shiftRegs_4_3_payload <= shiftRegs_3_3_payload;
    end else begin
      shiftRegs_4_3_payload <= shiftRegs_3_11_payload;
    end
    if(when_BarrelShifter_l20_40) begin
      shiftRegs_4_4_payload <= shiftRegs_3_4_payload;
    end else begin
      shiftRegs_4_4_payload <= shiftRegs_3_0_payload;
    end
    if(when_BarrelShifter_l20_41) begin
      shiftRegs_4_5_payload <= shiftRegs_3_5_payload;
    end else begin
      shiftRegs_4_5_payload <= shiftRegs_3_1_payload;
    end
    if(when_BarrelShifter_l20_42) begin
      shiftRegs_4_6_payload <= shiftRegs_3_6_payload;
    end else begin
      shiftRegs_4_6_payload <= shiftRegs_3_2_payload;
    end
    if(when_BarrelShifter_l20_43) begin
      shiftRegs_4_7_payload <= shiftRegs_3_7_payload;
    end else begin
      shiftRegs_4_7_payload <= shiftRegs_3_3_payload;
    end
    if(when_BarrelShifter_l20_44) begin
      shiftRegs_4_8_payload <= shiftRegs_3_8_payload;
    end else begin
      shiftRegs_4_8_payload <= shiftRegs_3_4_payload;
    end
    if(when_BarrelShifter_l20_45) begin
      shiftRegs_4_9_payload <= shiftRegs_3_9_payload;
    end else begin
      shiftRegs_4_9_payload <= shiftRegs_3_5_payload;
    end
    if(when_BarrelShifter_l20_46) begin
      shiftRegs_4_10_payload <= shiftRegs_3_10_payload;
    end else begin
      shiftRegs_4_10_payload <= shiftRegs_3_6_payload;
    end
    if(when_BarrelShifter_l20_47) begin
      shiftRegs_4_11_payload <= shiftRegs_3_11_payload;
    end else begin
      shiftRegs_4_11_payload <= shiftRegs_3_7_payload;
    end
    shiftRegs_0_0_payload <= io_dataIn_0_payload;
    shiftRegs_0_1_payload <= io_dataIn_1_payload;
    shiftRegs_0_2_payload <= io_dataIn_2_payload;
    shiftRegs_0_3_payload <= io_dataIn_3_payload;
    shiftRegs_0_4_payload <= io_dataIn_4_payload;
    shiftRegs_0_5_payload <= io_dataIn_5_payload;
    shiftRegs_0_6_payload <= io_dataIn_6_payload;
    shiftRegs_0_7_payload <= io_dataIn_7_payload;
    shiftRegs_0_8_payload <= io_dataIn_8_payload;
    shiftRegs_0_9_payload <= io_dataIn_9_payload;
    shiftRegs_0_10_payload <= io_dataIn_10_payload;
    shiftRegs_0_11_payload <= io_dataIn_11_payload;
  end


endmodule
