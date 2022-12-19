// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : OutputShiftReg
// Git hash  : 49d0755e1ebad225e157f484ef3544456c6ad7b5

`timescale 1ns/1ps 
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
  output reg          io_popOut_valid,
  input               io_popOut_ready,
  output     [71:0]   io_popOut_payload,
  input               clk,
  input               clrn
);

  wire       [2:0]    _zz_outCounter_valueNext;
  wire       [0:0]    _zz_outCounter_valueNext_1;
  reg        [71:0]   shiftRegs_0;
  reg        [71:0]   shiftRegs_1;
  reg        [71:0]   shiftRegs_2;
  reg        [71:0]   shiftRegs_3;
  reg        [71:0]   shiftRegs_4;
  reg                 isShifting;
  reg        [4:0]    loadedRegs;
  wire                io_popOut_fire;
  wire                io_popOut_fire_1;
  wire                io_popOut_fire_2;
  wire                io_popOut_fire_3;
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
  reg                 outCounter_willIncrement;
  reg                 outCounter_willClear;
  reg        [2:0]    outCounter_valueNext;
  reg        [2:0]    outCounter_value;
  wire                outCounter_willOverflowIfInc;
  wire                outCounter_willOverflow;
  wire                io_popOut_fire_4;
  wire                when_OutputShiftReg_l42;

  assign _zz_outCounter_valueNext_1 = outCounter_willIncrement;
  assign _zz_outCounter_valueNext = {2'd0, _zz_outCounter_valueNext_1};
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

  assign io_popOut_fire = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_1 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_2 = (io_popOut_valid && io_popOut_ready);
  assign io_popOut_fire_3 = (io_popOut_valid && io_popOut_ready);
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
  always @(*) begin
    outCounter_willIncrement = 1'b0;
    if(isShifting) begin
      if(io_popOut_fire_4) begin
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

  assign outCounter_willOverflowIfInc = (outCounter_value == 3'b100);
  assign outCounter_willOverflow = (outCounter_willOverflowIfInc && outCounter_willIncrement);
  always @(*) begin
    if(outCounter_willOverflow) begin
      outCounter_valueNext = 3'b000;
    end else begin
      outCounter_valueNext = (outCounter_value + _zz_outCounter_valueNext);
    end
    if(outCounter_willClear) begin
      outCounter_valueNext = 3'b000;
    end
  end

  assign io_popOut_fire_4 = (io_popOut_valid && io_popOut_ready);
  assign when_OutputShiftReg_l42 = (&loadedRegs);
  assign io_popOut_payload = shiftRegs_4;
  always @(posedge clk) begin
    if(!clrn) begin
      shiftRegs_0 <= 72'h0;
      shiftRegs_1 <= 72'h0;
      shiftRegs_2 <= 72'h0;
      shiftRegs_3 <= 72'h0;
      shiftRegs_4 <= 72'h0;
      isShifting <= 1'b0;
      loadedRegs <= 5'h0;
      outCounter_value <= 3'b000;
    end else begin
      if(isShifting) begin
        loadedRegs <= 5'h0;
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
