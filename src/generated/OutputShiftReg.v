// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : OutputShiftReg
// Git hash  : bc7f4dec79ebddc91db05d9976770d5512bae44e


module OutputShiftReg (
  input               io_resIn_0_valid,
  output reg          io_resIn_0_ready,
  input      [71:0]   io_resIn_0_payload,
  input               io_resIn_1_valid,
  output reg          io_resIn_1_ready,
  input      [71:0]   io_resIn_1_payload,
  input               io_resIn_2_valid,
  output reg          io_resIn_2_ready,
  input      [71:0]   io_resIn_2_payload,
  input               io_resIn_3_valid,
  output reg          io_resIn_3_ready,
  input      [71:0]   io_resIn_3_payload,
  input               io_resIn_4_valid,
  output reg          io_resIn_4_ready,
  input      [71:0]   io_resIn_4_payload,
  input               io_resIn_5_valid,
  output reg          io_resIn_5_ready,
  input      [71:0]   io_resIn_5_payload,
  input               io_resIn_6_valid,
  output reg          io_resIn_6_ready,
  input      [71:0]   io_resIn_6_payload,
  input               io_resIn_7_valid,
  output reg          io_resIn_7_ready,
  input      [71:0]   io_resIn_7_payload,
  input               io_resIn_8_valid,
  output reg          io_resIn_8_ready,
  input      [71:0]   io_resIn_8_payload,
  input               io_resIn_9_valid,
  output reg          io_resIn_9_ready,
  input      [71:0]   io_resIn_9_payload,
  input               io_resIn_10_valid,
  output reg          io_resIn_10_ready,
  input      [71:0]   io_resIn_10_payload,
  input               io_resIn_11_valid,
  output reg          io_resIn_11_ready,
  input      [71:0]   io_resIn_11_payload,
  input               io_resIn_12_valid,
  output reg          io_resIn_12_ready,
  input      [71:0]   io_resIn_12_payload,
  input               io_resIn_13_valid,
  output reg          io_resIn_13_ready,
  input      [71:0]   io_resIn_13_payload,
  input               io_resIn_14_valid,
  output reg          io_resIn_14_ready,
  input      [71:0]   io_resIn_14_payload,
  input               io_resIn_15_valid,
  output reg          io_resIn_15_ready,
  input      [71:0]   io_resIn_15_payload,
  input               io_resIn_16_valid,
  output reg          io_resIn_16_ready,
  input      [71:0]   io_resIn_16_payload,
  input               io_resIn_17_valid,
  output reg          io_resIn_17_ready,
  input      [71:0]   io_resIn_17_payload,
  input               io_resIn_18_valid,
  output reg          io_resIn_18_ready,
  input      [71:0]   io_resIn_18_payload,
  input               io_resIn_19_valid,
  output reg          io_resIn_19_ready,
  input      [71:0]   io_resIn_19_payload,
  output reg          io_popOut_valid,
  input               io_popOut_ready,
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
  wire                io_popOut_fire;
  wire                io_popOut_fire_1;
  wire                io_popOut_fire_2;
  wire                io_popOut_fire_3;
  wire                io_popOut_fire_4;
  wire                io_popOut_fire_5;
  wire                io_popOut_fire_6;
  wire                io_popOut_fire_7;
  wire                io_popOut_fire_8;
  wire                io_popOut_fire_9;
  wire                io_popOut_fire_10;
  wire                io_popOut_fire_11;
  wire                io_popOut_fire_12;
  wire                io_popOut_fire_13;
  wire                io_popOut_fire_14;
  wire                io_popOut_fire_15;
  wire                io_popOut_fire_16;
  wire                io_popOut_fire_17;
  wire                io_popOut_fire_18;
  wire                io_resIn_0_fire;
  wire                when_OutputShiftReg_l28;
  wire                io_resIn_1_fire;
  wire                when_OutputShiftReg_l28_1;
  wire                io_resIn_2_fire;
  wire                when_OutputShiftReg_l28_2;
  wire                io_resIn_3_fire;
  wire                when_OutputShiftReg_l28_3;
  wire                io_resIn_4_fire;
  wire                when_OutputShiftReg_l28_4;
  wire                io_resIn_5_fire;
  wire                when_OutputShiftReg_l28_5;
  wire                io_resIn_6_fire;
  wire                when_OutputShiftReg_l28_6;
  wire                io_resIn_7_fire;
  wire                when_OutputShiftReg_l28_7;
  wire                io_resIn_8_fire;
  wire                when_OutputShiftReg_l28_8;
  wire                io_resIn_9_fire;
  wire                when_OutputShiftReg_l28_9;
  wire                io_resIn_10_fire;
  wire                when_OutputShiftReg_l28_10;
  wire                io_resIn_11_fire;
  wire                when_OutputShiftReg_l28_11;
  wire                io_resIn_12_fire;
  wire                when_OutputShiftReg_l28_12;
  wire                io_resIn_13_fire;
  wire                when_OutputShiftReg_l28_13;
  wire                io_resIn_14_fire;
  wire                when_OutputShiftReg_l28_14;
  wire                io_resIn_15_fire;
  wire                when_OutputShiftReg_l28_15;
  wire                io_resIn_16_fire;
  wire                when_OutputShiftReg_l28_16;
  wire                io_resIn_17_fire;
  wire                when_OutputShiftReg_l28_17;
  wire                io_resIn_18_fire;
  wire                when_OutputShiftReg_l28_18;
  wire                io_resIn_19_fire;
  wire                when_OutputShiftReg_l28_19;
  reg                 outCounter_willIncrement;
  reg                 outCounter_willClear;
  reg        [4:0]    outCounter_valueNext;
  reg        [4:0]    outCounter_value;
  wire                outCounter_willOverflowIfInc;
  wire                outCounter_willOverflow;
  wire                io_popOut_fire_19;
  wire                when_OutputShiftReg_l42;

  assign _zz_outCounter_valueNext_1 = outCounter_willIncrement;
  assign _zz_outCounter_valueNext = {4'd0, _zz_outCounter_valueNext_1};
  always @(*) begin
    if(isShifting) begin
      io_popOut_valid = 1'b1;
    end else begin
      io_popOut_valid = 1'b0;
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_0_ready = 1'b0;
    end else begin
      io_resIn_0_ready = (! loadedRegs[0]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_1_ready = 1'b0;
    end else begin
      io_resIn_1_ready = (! loadedRegs[1]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_2_ready = 1'b0;
    end else begin
      io_resIn_2_ready = (! loadedRegs[2]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_3_ready = 1'b0;
    end else begin
      io_resIn_3_ready = (! loadedRegs[3]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_4_ready = 1'b0;
    end else begin
      io_resIn_4_ready = (! loadedRegs[4]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_5_ready = 1'b0;
    end else begin
      io_resIn_5_ready = (! loadedRegs[5]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_6_ready = 1'b0;
    end else begin
      io_resIn_6_ready = (! loadedRegs[6]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_7_ready = 1'b0;
    end else begin
      io_resIn_7_ready = (! loadedRegs[7]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_8_ready = 1'b0;
    end else begin
      io_resIn_8_ready = (! loadedRegs[8]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_9_ready = 1'b0;
    end else begin
      io_resIn_9_ready = (! loadedRegs[9]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_10_ready = 1'b0;
    end else begin
      io_resIn_10_ready = (! loadedRegs[10]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_11_ready = 1'b0;
    end else begin
      io_resIn_11_ready = (! loadedRegs[11]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_12_ready = 1'b0;
    end else begin
      io_resIn_12_ready = (! loadedRegs[12]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_13_ready = 1'b0;
    end else begin
      io_resIn_13_ready = (! loadedRegs[13]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_14_ready = 1'b0;
    end else begin
      io_resIn_14_ready = (! loadedRegs[14]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_15_ready = 1'b0;
    end else begin
      io_resIn_15_ready = (! loadedRegs[15]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_16_ready = 1'b0;
    end else begin
      io_resIn_16_ready = (! loadedRegs[16]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_17_ready = 1'b0;
    end else begin
      io_resIn_17_ready = (! loadedRegs[17]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_18_ready = 1'b0;
    end else begin
      io_resIn_18_ready = (! loadedRegs[18]);
    end
  end

  always @(*) begin
    if(isShifting) begin
      io_resIn_19_ready = 1'b0;
    end else begin
      io_resIn_19_ready = (! loadedRegs[19]);
    end
  end

  assign io_popOut_fire = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_1 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_2 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_3 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_4 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_5 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_6 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_7 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_8 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_9 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_10 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_11 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_12 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_13 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_14 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_15 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_16 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_17 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_18 = (io_popOut_valid && io_popOut_ready);
  assign io_resIn_0_fire = (io_resIn_0_valid && io_resIn_0_ready);
  assign when_OutputShiftReg_l28 = (io_resIn_0_fire && (! loadedRegs[0]));
  assign io_resIn_1_fire = (io_resIn_1_valid && io_resIn_1_ready);
  assign when_OutputShiftReg_l28_1 = (io_resIn_1_fire && (! loadedRegs[1]));
  assign io_resIn_2_fire = (io_resIn_2_valid && io_resIn_2_ready);
  assign when_OutputShiftReg_l28_2 = (io_resIn_2_fire && (! loadedRegs[2]));
  assign io_resIn_3_fire = (io_resIn_3_valid && io_resIn_3_ready);
  assign when_OutputShiftReg_l28_3 = (io_resIn_3_fire && (! loadedRegs[3]));
  assign io_resIn_4_fire = (io_resIn_4_valid && io_resIn_4_ready);
  assign when_OutputShiftReg_l28_4 = (io_resIn_4_fire && (! loadedRegs[4]));
  assign io_resIn_5_fire = (io_resIn_5_valid && io_resIn_5_ready);
  assign when_OutputShiftReg_l28_5 = (io_resIn_5_fire && (! loadedRegs[5]));
  assign io_resIn_6_fire = (io_resIn_6_valid && io_resIn_6_ready);
  assign when_OutputShiftReg_l28_6 = (io_resIn_6_fire && (! loadedRegs[6]));
  assign io_resIn_7_fire = (io_resIn_7_valid && io_resIn_7_ready);
  assign when_OutputShiftReg_l28_7 = (io_resIn_7_fire && (! loadedRegs[7]));
  assign io_resIn_8_fire = (io_resIn_8_valid && io_resIn_8_ready);
  assign when_OutputShiftReg_l28_8 = (io_resIn_8_fire && (! loadedRegs[8]));
  assign io_resIn_9_fire = (io_resIn_9_valid && io_resIn_9_ready);
  assign when_OutputShiftReg_l28_9 = (io_resIn_9_fire && (! loadedRegs[9]));
  assign io_resIn_10_fire = (io_resIn_10_valid && io_resIn_10_ready);
  assign when_OutputShiftReg_l28_10 = (io_resIn_10_fire && (! loadedRegs[10]));
  assign io_resIn_11_fire = (io_resIn_11_valid && io_resIn_11_ready);
  assign when_OutputShiftReg_l28_11 = (io_resIn_11_fire && (! loadedRegs[11]));
  assign io_resIn_12_fire = (io_resIn_12_valid && io_resIn_12_ready);
  assign when_OutputShiftReg_l28_12 = (io_resIn_12_fire && (! loadedRegs[12]));
  assign io_resIn_13_fire = (io_resIn_13_valid && io_resIn_13_ready);
  assign when_OutputShiftReg_l28_13 = (io_resIn_13_fire && (! loadedRegs[13]));
  assign io_resIn_14_fire = (io_resIn_14_valid && io_resIn_14_ready);
  assign when_OutputShiftReg_l28_14 = (io_resIn_14_fire && (! loadedRegs[14]));
  assign io_resIn_15_fire = (io_resIn_15_valid && io_resIn_15_ready);
  assign when_OutputShiftReg_l28_15 = (io_resIn_15_fire && (! loadedRegs[15]));
  assign io_resIn_16_fire = (io_resIn_16_valid && io_resIn_16_ready);
  assign when_OutputShiftReg_l28_16 = (io_resIn_16_fire && (! loadedRegs[16]));
  assign io_resIn_17_fire = (io_resIn_17_valid && io_resIn_17_ready);
  assign when_OutputShiftReg_l28_17 = (io_resIn_17_fire && (! loadedRegs[17]));
  assign io_resIn_18_fire = (io_resIn_18_valid && io_resIn_18_ready);
  assign when_OutputShiftReg_l28_18 = (io_resIn_18_fire && (! loadedRegs[18]));
  assign io_resIn_19_fire = (io_resIn_19_valid && io_resIn_19_ready);
  assign when_OutputShiftReg_l28_19 = (io_resIn_19_fire && (! loadedRegs[19]));
  always @(*) begin
    outCounter_willIncrement = 1'b0;
    if(isShifting) begin
      if(io_popOut_fire_19) begin
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

  assign io_popOut_fire_19 = (io_popOut_valid && io_popOut_ready);
  assign when_OutputShiftReg_l42 = (loadedRegs == 20'hfffff);
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
        if(io_popOut_fire) begin
          shiftRegs_1 <= shiftRegs_0;
        end
        if(io_popOut_fire_1) begin
          shiftRegs_2 <= shiftRegs_1;
        end
        if(io_popOut_fire_2) begin
          shiftRegs_3 <= shiftRegs_2;
        end
        if(io_popOut_fire_3) begin
          shiftRegs_4 <= shiftRegs_3;
        end
        if(io_popOut_fire_4) begin
          shiftRegs_5 <= shiftRegs_4;
        end
        if(io_popOut_fire_5) begin
          shiftRegs_6 <= shiftRegs_5;
        end
        if(io_popOut_fire_6) begin
          shiftRegs_7 <= shiftRegs_6;
        end
        if(io_popOut_fire_7) begin
          shiftRegs_8 <= shiftRegs_7;
        end
        if(io_popOut_fire_8) begin
          shiftRegs_9 <= shiftRegs_8;
        end
        if(io_popOut_fire_9) begin
          shiftRegs_10 <= shiftRegs_9;
        end
        if(io_popOut_fire_10) begin
          shiftRegs_11 <= shiftRegs_10;
        end
        if(io_popOut_fire_11) begin
          shiftRegs_12 <= shiftRegs_11;
        end
        if(io_popOut_fire_12) begin
          shiftRegs_13 <= shiftRegs_12;
        end
        if(io_popOut_fire_13) begin
          shiftRegs_14 <= shiftRegs_13;
        end
        if(io_popOut_fire_14) begin
          shiftRegs_15 <= shiftRegs_14;
        end
        if(io_popOut_fire_15) begin
          shiftRegs_16 <= shiftRegs_15;
        end
        if(io_popOut_fire_16) begin
          shiftRegs_17 <= shiftRegs_16;
        end
        if(io_popOut_fire_17) begin
          shiftRegs_18 <= shiftRegs_17;
        end
        if(io_popOut_fire_18) begin
          shiftRegs_19 <= shiftRegs_18;
        end
      end else begin
        if(when_OutputShiftReg_l28) begin
          shiftRegs_0 <= io_resIn_0_payload;
          loadedRegs[0] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_1) begin
          shiftRegs_1 <= io_resIn_1_payload;
          loadedRegs[1] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_2) begin
          shiftRegs_2 <= io_resIn_2_payload;
          loadedRegs[2] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_3) begin
          shiftRegs_3 <= io_resIn_3_payload;
          loadedRegs[3] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_4) begin
          shiftRegs_4 <= io_resIn_4_payload;
          loadedRegs[4] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_5) begin
          shiftRegs_5 <= io_resIn_5_payload;
          loadedRegs[5] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_6) begin
          shiftRegs_6 <= io_resIn_6_payload;
          loadedRegs[6] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_7) begin
          shiftRegs_7 <= io_resIn_7_payload;
          loadedRegs[7] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_8) begin
          shiftRegs_8 <= io_resIn_8_payload;
          loadedRegs[8] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_9) begin
          shiftRegs_9 <= io_resIn_9_payload;
          loadedRegs[9] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_10) begin
          shiftRegs_10 <= io_resIn_10_payload;
          loadedRegs[10] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_11) begin
          shiftRegs_11 <= io_resIn_11_payload;
          loadedRegs[11] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_12) begin
          shiftRegs_12 <= io_resIn_12_payload;
          loadedRegs[12] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_13) begin
          shiftRegs_13 <= io_resIn_13_payload;
          loadedRegs[13] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_14) begin
          shiftRegs_14 <= io_resIn_14_payload;
          loadedRegs[14] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_15) begin
          shiftRegs_15 <= io_resIn_15_payload;
          loadedRegs[15] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_16) begin
          shiftRegs_16 <= io_resIn_16_payload;
          loadedRegs[16] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_17) begin
          shiftRegs_17 <= io_resIn_17_payload;
          loadedRegs[17] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_18) begin
          shiftRegs_18 <= io_resIn_18_payload;
          loadedRegs[18] <= 1'b1;
        end
        if(when_OutputShiftReg_l28_19) begin
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
        if(when_OutputShiftReg_l42) begin
          isShifting <= 1'b1;
        end
      end
    end
  end


endmodule
