// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : OutputShiftReg
// Git hash  : 257eb1a112838047dc69fc54ad4c70da7b455b11

`timescale 1ns/1ps 
module OutputShiftReg (
  input               io_resIn_0_valid,
  input      [71:0]   io_resIn_0_payload,
  input               io_resIn_1_valid,
  input      [71:0]   io_resIn_1_payload,
  input               io_resIn_2_valid,
  input      [71:0]   io_resIn_2_payload,
  input               io_resIn_3_valid,
  input      [71:0]   io_resIn_3_payload,
  input               io_resIn_4_valid,
  input      [71:0]   io_resIn_4_payload,
  input               io_resIn_5_valid,
  input      [71:0]   io_resIn_5_payload,
  input               io_resIn_6_valid,
  input      [71:0]   io_resIn_6_payload,
  input               io_resIn_7_valid,
  input      [71:0]   io_resIn_7_payload,
  input               io_resIn_8_valid,
  input      [71:0]   io_resIn_8_payload,
  input               io_resIn_9_valid,
  input      [71:0]   io_resIn_9_payload,
  input               io_resIn_10_valid,
  input      [71:0]   io_resIn_10_payload,
  input               io_resIn_11_valid,
  input      [71:0]   io_resIn_11_payload,
  input               io_resIn_12_valid,
  input      [71:0]   io_resIn_12_payload,
  input               io_resIn_13_valid,
  input      [71:0]   io_resIn_13_payload,
  input               io_resIn_14_valid,
  input      [71:0]   io_resIn_14_payload,
  input               io_resIn_15_valid,
  input      [71:0]   io_resIn_15_payload,
  input               io_resIn_16_valid,
  input      [71:0]   io_resIn_16_payload,
  input               io_resIn_17_valid,
  input      [71:0]   io_resIn_17_payload,
  input               io_resIn_18_valid,
  input      [71:0]   io_resIn_18_payload,
  input               io_resIn_19_valid,
  input      [71:0]   io_resIn_19_payload,
  output reg          io_popOut_valid,
  output     [71:0]   io_popOut_payload,
  input               clk,
  input               clrn
);

  wire       [4:0]    _zz_outCounter_valueNext;
  wire       [0:0]    _zz_outCounter_valueNext_1;
  reg        [71:0]   shiftRegs_0;
  reg        [71:0]   shiftRegs_1;
  reg        [71:0]   shiftRegs_2;
  reg        [71:0]   shiftRegs_3;
  reg        [71:0]   shiftRegs_4;
  reg        [71:0]   shiftRegs_5;
  reg        [71:0]   shiftRegs_6;
  reg        [71:0]   shiftRegs_7;
  reg        [71:0]   shiftRegs_8;
  reg        [71:0]   shiftRegs_9;
  reg        [71:0]   shiftRegs_10;
  reg        [71:0]   shiftRegs_11;
  reg        [71:0]   shiftRegs_12;
  reg        [71:0]   shiftRegs_13;
  reg        [71:0]   shiftRegs_14;
  reg        [71:0]   shiftRegs_15;
  reg        [71:0]   shiftRegs_16;
  reg        [71:0]   shiftRegs_17;
  reg        [71:0]   shiftRegs_18;
  reg        [71:0]   shiftRegs_19;
  reg                 isShifting;
  reg        [19:0]   loadedRegs;
  wire                when_OutputShiftReg_l26;
  wire                when_OutputShiftReg_l26_1;
  wire                when_OutputShiftReg_l26_2;
  wire                when_OutputShiftReg_l26_3;
  wire                when_OutputShiftReg_l26_4;
  wire                when_OutputShiftReg_l26_5;
  wire                when_OutputShiftReg_l26_6;
  wire                when_OutputShiftReg_l26_7;
  wire                when_OutputShiftReg_l26_8;
  wire                when_OutputShiftReg_l26_9;
  wire                when_OutputShiftReg_l26_10;
  wire                when_OutputShiftReg_l26_11;
  wire                when_OutputShiftReg_l26_12;
  wire                when_OutputShiftReg_l26_13;
  wire                when_OutputShiftReg_l26_14;
  wire                when_OutputShiftReg_l26_15;
  wire                when_OutputShiftReg_l26_16;
  wire                when_OutputShiftReg_l26_17;
  wire                when_OutputShiftReg_l26_18;
  wire                when_OutputShiftReg_l26_19;
  reg                 outCounter_willIncrement;
  reg                 outCounter_willClear;
  reg        [4:0]    outCounter_valueNext;
  reg        [4:0]    outCounter_value;
  wire                outCounter_willOverflowIfInc;
  wire                outCounter_willOverflow;
  wire                when_OutputShiftReg_l40;

  assign _zz_outCounter_valueNext_1 = outCounter_willIncrement;
  assign _zz_outCounter_valueNext = {4'd0, _zz_outCounter_valueNext_1};
  always @(*) begin
    if(isShifting) begin
      io_popOut_valid = 1'b1;
    end else begin
      io_popOut_valid = 1'b0;
    end
  end

  assign when_OutputShiftReg_l26 = (io_resIn_0_valid && (! loadedRegs[0]));
  assign when_OutputShiftReg_l26_1 = (io_resIn_1_valid && (! loadedRegs[1]));
  assign when_OutputShiftReg_l26_2 = (io_resIn_2_valid && (! loadedRegs[2]));
  assign when_OutputShiftReg_l26_3 = (io_resIn_3_valid && (! loadedRegs[3]));
  assign when_OutputShiftReg_l26_4 = (io_resIn_4_valid && (! loadedRegs[4]));
  assign when_OutputShiftReg_l26_5 = (io_resIn_5_valid && (! loadedRegs[5]));
  assign when_OutputShiftReg_l26_6 = (io_resIn_6_valid && (! loadedRegs[6]));
  assign when_OutputShiftReg_l26_7 = (io_resIn_7_valid && (! loadedRegs[7]));
  assign when_OutputShiftReg_l26_8 = (io_resIn_8_valid && (! loadedRegs[8]));
  assign when_OutputShiftReg_l26_9 = (io_resIn_9_valid && (! loadedRegs[9]));
  assign when_OutputShiftReg_l26_10 = (io_resIn_10_valid && (! loadedRegs[10]));
  assign when_OutputShiftReg_l26_11 = (io_resIn_11_valid && (! loadedRegs[11]));
  assign when_OutputShiftReg_l26_12 = (io_resIn_12_valid && (! loadedRegs[12]));
  assign when_OutputShiftReg_l26_13 = (io_resIn_13_valid && (! loadedRegs[13]));
  assign when_OutputShiftReg_l26_14 = (io_resIn_14_valid && (! loadedRegs[14]));
  assign when_OutputShiftReg_l26_15 = (io_resIn_15_valid && (! loadedRegs[15]));
  assign when_OutputShiftReg_l26_16 = (io_resIn_16_valid && (! loadedRegs[16]));
  assign when_OutputShiftReg_l26_17 = (io_resIn_17_valid && (! loadedRegs[17]));
  assign when_OutputShiftReg_l26_18 = (io_resIn_18_valid && (! loadedRegs[18]));
  assign when_OutputShiftReg_l26_19 = (io_resIn_19_valid && (! loadedRegs[19]));
  always @(*) begin
    outCounter_willIncrement = 1'b0;
    if(isShifting) begin
      if(io_popOut_valid) begin
        outCounter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    outCounter_willClear = 1'b0;
    if(!isShifting) begin
      outCounter_willClear = 1'b1;
    end
  end

  assign outCounter_willOverflowIfInc = (outCounter_value == 5'h13);
  assign outCounter_willOverflow = (outCounter_willOverflowIfInc && outCounter_willIncrement);
  always @(*) begin
    if(outCounter_willOverflow) begin
      outCounter_valueNext = 5'h0;
    end else begin
      outCounter_valueNext = (outCounter_value + _zz_outCounter_valueNext);
    end
    if(outCounter_willClear) begin
      outCounter_valueNext = 5'h0;
    end
  end

  assign when_OutputShiftReg_l40 = (&loadedRegs);
  assign io_popOut_payload = shiftRegs_19;
  always @(posedge clk) begin
    if(!clrn) begin
      shiftRegs_0 <= 72'h0;
      shiftRegs_1 <= 72'h0;
      shiftRegs_2 <= 72'h0;
      shiftRegs_3 <= 72'h0;
      shiftRegs_4 <= 72'h0;
      shiftRegs_5 <= 72'h0;
      shiftRegs_6 <= 72'h0;
      shiftRegs_7 <= 72'h0;
      shiftRegs_8 <= 72'h0;
      shiftRegs_9 <= 72'h0;
      shiftRegs_10 <= 72'h0;
      shiftRegs_11 <= 72'h0;
      shiftRegs_12 <= 72'h0;
      shiftRegs_13 <= 72'h0;
      shiftRegs_14 <= 72'h0;
      shiftRegs_15 <= 72'h0;
      shiftRegs_16 <= 72'h0;
      shiftRegs_17 <= 72'h0;
      shiftRegs_18 <= 72'h0;
      shiftRegs_19 <= 72'h0;
      isShifting <= 1'b0;
      loadedRegs <= 20'h0;
      outCounter_value <= 5'h0;
    end else begin
      if(isShifting) begin
        loadedRegs <= 20'h0;
        if(io_popOut_valid) begin
          shiftRegs_1 <= shiftRegs_0;
        end
        if(io_popOut_valid) begin
          shiftRegs_2 <= shiftRegs_1;
        end
        if(io_popOut_valid) begin
          shiftRegs_3 <= shiftRegs_2;
        end
        if(io_popOut_valid) begin
          shiftRegs_4 <= shiftRegs_3;
        end
        if(io_popOut_valid) begin
          shiftRegs_5 <= shiftRegs_4;
        end
        if(io_popOut_valid) begin
          shiftRegs_6 <= shiftRegs_5;
        end
        if(io_popOut_valid) begin
          shiftRegs_7 <= shiftRegs_6;
        end
        if(io_popOut_valid) begin
          shiftRegs_8 <= shiftRegs_7;
        end
        if(io_popOut_valid) begin
          shiftRegs_9 <= shiftRegs_8;
        end
        if(io_popOut_valid) begin
          shiftRegs_10 <= shiftRegs_9;
        end
        if(io_popOut_valid) begin
          shiftRegs_11 <= shiftRegs_10;
        end
        if(io_popOut_valid) begin
          shiftRegs_12 <= shiftRegs_11;
        end
        if(io_popOut_valid) begin
          shiftRegs_13 <= shiftRegs_12;
        end
        if(io_popOut_valid) begin
          shiftRegs_14 <= shiftRegs_13;
        end
        if(io_popOut_valid) begin
          shiftRegs_15 <= shiftRegs_14;
        end
        if(io_popOut_valid) begin
          shiftRegs_16 <= shiftRegs_15;
        end
        if(io_popOut_valid) begin
          shiftRegs_17 <= shiftRegs_16;
        end
        if(io_popOut_valid) begin
          shiftRegs_18 <= shiftRegs_17;
        end
        if(io_popOut_valid) begin
          shiftRegs_19 <= shiftRegs_18;
        end
      end else begin
        if(when_OutputShiftReg_l26) begin
          shiftRegs_0 <= io_resIn_0_payload;
          loadedRegs[0] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_1) begin
          shiftRegs_1 <= io_resIn_1_payload;
          loadedRegs[1] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_2) begin
          shiftRegs_2 <= io_resIn_2_payload;
          loadedRegs[2] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_3) begin
          shiftRegs_3 <= io_resIn_3_payload;
          loadedRegs[3] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_4) begin
          shiftRegs_4 <= io_resIn_4_payload;
          loadedRegs[4] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_5) begin
          shiftRegs_5 <= io_resIn_5_payload;
          loadedRegs[5] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_6) begin
          shiftRegs_6 <= io_resIn_6_payload;
          loadedRegs[6] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_7) begin
          shiftRegs_7 <= io_resIn_7_payload;
          loadedRegs[7] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_8) begin
          shiftRegs_8 <= io_resIn_8_payload;
          loadedRegs[8] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_9) begin
          shiftRegs_9 <= io_resIn_9_payload;
          loadedRegs[9] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_10) begin
          shiftRegs_10 <= io_resIn_10_payload;
          loadedRegs[10] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_11) begin
          shiftRegs_11 <= io_resIn_11_payload;
          loadedRegs[11] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_12) begin
          shiftRegs_12 <= io_resIn_12_payload;
          loadedRegs[12] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_13) begin
          shiftRegs_13 <= io_resIn_13_payload;
          loadedRegs[13] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_14) begin
          shiftRegs_14 <= io_resIn_14_payload;
          loadedRegs[14] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_15) begin
          shiftRegs_15 <= io_resIn_15_payload;
          loadedRegs[15] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_16) begin
          shiftRegs_16 <= io_resIn_16_payload;
          loadedRegs[16] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_17) begin
          shiftRegs_17 <= io_resIn_17_payload;
          loadedRegs[17] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_18) begin
          shiftRegs_18 <= io_resIn_18_payload;
          loadedRegs[18] <= 1'b1;
        end
        if(when_OutputShiftReg_l26_19) begin
          shiftRegs_19 <= io_resIn_19_payload;
          loadedRegs[19] <= 1'b1;
        end
      end
      outCounter_value <= outCounter_valueNext;
      if(isShifting) begin
        if(outCounter_willOverflow) begin
          isShifting <= 1'b0;
        end
      end else begin
        if(when_OutputShiftReg_l40) begin
          isShifting <= 1'b1;
        end
      end
    end
  end


endmodule
