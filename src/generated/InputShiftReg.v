// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : InputShiftReg
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module InputShiftReg (
  input  wire          io_pushIn_valid,
  input  wire [319:0]  io_pushIn_payload,
  output reg           io_dataOut_0_valid,
  input  wire          io_dataOut_0_ready,
  output wire [319:0]  io_dataOut_0_payload,
  output reg           io_dataOut_1_valid,
  input  wire          io_dataOut_1_ready,
  output wire [319:0]  io_dataOut_1_payload,
  output reg           io_dataOut_2_valid,
  input  wire          io_dataOut_2_ready,
  output wire [319:0]  io_dataOut_2_payload,
  output reg           io_dataOut_3_valid,
  input  wire          io_dataOut_3_ready,
  output wire [319:0]  io_dataOut_3_payload,
  output reg           io_dataOut_4_valid,
  input  wire          io_dataOut_4_ready,
  output wire [319:0]  io_dataOut_4_payload,
  output reg           io_dataOut_5_valid,
  input  wire          io_dataOut_5_ready,
  output wire [319:0]  io_dataOut_5_payload,
  output reg           io_dataOut_6_valid,
  input  wire          io_dataOut_6_ready,
  output wire [319:0]  io_dataOut_6_payload,
  output reg           io_dataOut_7_valid,
  input  wire          io_dataOut_7_ready,
  output wire [319:0]  io_dataOut_7_payload,
  output reg           io_dataOut_8_valid,
  input  wire          io_dataOut_8_ready,
  output wire [319:0]  io_dataOut_8_payload,
  output reg           io_dataOut_9_valid,
  input  wire          io_dataOut_9_ready,
  output wire [319:0]  io_dataOut_9_payload,
  output reg           io_dataOut_10_valid,
  input  wire          io_dataOut_10_ready,
  output wire [319:0]  io_dataOut_10_payload,
  output reg           io_dataOut_11_valid,
  output wire [319:0]  io_dataOut_11_payload,
  input  wire          clk,
  input  wire          clrn
);

  wire       [3:0]    _zz_regVaildCnterArray_0_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_0_valueNext_1;
  wire       [3:0]    _zz_regVaildCnterArray_1_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_1_valueNext_1;
  wire       [3:0]    _zz_regVaildCnterArray_2_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_2_valueNext_1;
  wire       [3:0]    _zz_regVaildCnterArray_3_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_3_valueNext_1;
  wire       [2:0]    _zz_regVaildCnterArray_4_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_4_valueNext_1;
  wire       [2:0]    _zz_regVaildCnterArray_5_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_5_valueNext_1;
  wire       [2:0]    _zz_regVaildCnterArray_6_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_6_valueNext_1;
  wire       [2:0]    _zz_regVaildCnterArray_7_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_7_valueNext_1;
  wire       [1:0]    _zz_regVaildCnterArray_8_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_8_valueNext_1;
  wire       [1:0]    _zz_regVaildCnterArray_9_valueNext;
  wire       [0:0]    _zz_regVaildCnterArray_9_valueNext_1;
  reg        [319:0]  shiftRegs_0;
  reg        [319:0]  shiftRegs_1;
  reg        [319:0]  shiftRegs_2;
  reg        [319:0]  shiftRegs_3;
  reg        [319:0]  shiftRegs_4;
  reg        [319:0]  shiftRegs_5;
  reg        [319:0]  shiftRegs_6;
  reg        [319:0]  shiftRegs_7;
  reg        [319:0]  shiftRegs_8;
  reg        [319:0]  shiftRegs_9;
  reg        [319:0]  shiftRegs_10;
  reg        [319:0]  shiftRegs_11;
  reg                 shiftValid_0;
  reg                 shiftValid_1;
  reg                 shiftValid_2;
  reg                 shiftValid_3;
  reg                 shiftValid_4;
  reg                 shiftValid_5;
  reg                 shiftValid_6;
  reg                 shiftValid_7;
  reg                 shiftValid_8;
  reg                 shiftValid_9;
  reg                 shiftValid_10;
  reg                 regVaildCnterArray_0_willIncrement;
  reg                 regVaildCnterArray_0_willClear;
  reg        [3:0]    regVaildCnterArray_0_valueNext;
  reg        [3:0]    regVaildCnterArray_0_value;
  wire                regVaildCnterArray_0_willOverflowIfInc;
  wire                regVaildCnterArray_0_willOverflow;
  reg                 regVaildCnterArray_1_willIncrement;
  reg                 regVaildCnterArray_1_willClear;
  reg        [3:0]    regVaildCnterArray_1_valueNext;
  reg        [3:0]    regVaildCnterArray_1_value;
  wire                regVaildCnterArray_1_willOverflowIfInc;
  wire                regVaildCnterArray_1_willOverflow;
  reg                 regVaildCnterArray_2_willIncrement;
  reg                 regVaildCnterArray_2_willClear;
  reg        [3:0]    regVaildCnterArray_2_valueNext;
  reg        [3:0]    regVaildCnterArray_2_value;
  wire                regVaildCnterArray_2_willOverflowIfInc;
  wire                regVaildCnterArray_2_willOverflow;
  reg                 regVaildCnterArray_3_willIncrement;
  reg                 regVaildCnterArray_3_willClear;
  reg        [3:0]    regVaildCnterArray_3_valueNext;
  reg        [3:0]    regVaildCnterArray_3_value;
  wire                regVaildCnterArray_3_willOverflowIfInc;
  wire                regVaildCnterArray_3_willOverflow;
  reg                 regVaildCnterArray_4_willIncrement;
  reg                 regVaildCnterArray_4_willClear;
  reg        [2:0]    regVaildCnterArray_4_valueNext;
  reg        [2:0]    regVaildCnterArray_4_value;
  wire                regVaildCnterArray_4_willOverflowIfInc;
  reg                 regVaildCnterArray_5_willIncrement;
  reg                 regVaildCnterArray_5_willClear;
  reg        [2:0]    regVaildCnterArray_5_valueNext;
  reg        [2:0]    regVaildCnterArray_5_value;
  wire                regVaildCnterArray_5_willOverflowIfInc;
  wire                regVaildCnterArray_5_willOverflow;
  reg                 regVaildCnterArray_6_willIncrement;
  reg                 regVaildCnterArray_6_willClear;
  reg        [2:0]    regVaildCnterArray_6_valueNext;
  reg        [2:0]    regVaildCnterArray_6_value;
  wire                regVaildCnterArray_6_willOverflowIfInc;
  wire                regVaildCnterArray_6_willOverflow;
  reg                 regVaildCnterArray_7_willIncrement;
  reg                 regVaildCnterArray_7_willClear;
  reg        [2:0]    regVaildCnterArray_7_valueNext;
  reg        [2:0]    regVaildCnterArray_7_value;
  wire                regVaildCnterArray_7_willOverflowIfInc;
  wire                regVaildCnterArray_7_willOverflow;
  reg                 regVaildCnterArray_8_willIncrement;
  reg                 regVaildCnterArray_8_willClear;
  reg        [1:0]    regVaildCnterArray_8_valueNext;
  reg        [1:0]    regVaildCnterArray_8_value;
  wire                regVaildCnterArray_8_willOverflowIfInc;
  reg                 regVaildCnterArray_9_willIncrement;
  reg                 regVaildCnterArray_9_willClear;
  reg        [1:0]    regVaildCnterArray_9_valueNext;
  reg        [1:0]    regVaildCnterArray_9_value;
  wire                regVaildCnterArray_9_willOverflowIfInc;
  wire                regVaildCnterArray_9_willOverflow;
  reg                 regVaildCnterArray_10_willIncrement;
  reg                 regVaildCnterArray_10_willClear;
  reg        [0:0]    regVaildCnterArray_10_valueNext;
  reg        [0:0]    regVaildCnterArray_10_value;
  wire                regVaildCnterArray_10_willOverflowIfInc;
  wire                regVaildCnterArray_11_willOverflowIfInc;
  wire                io_dataOut_1_fire;
  wire                io_dataOut_2_fire;
  wire                io_dataOut_3_fire;
  wire                io_dataOut_4_fire;
  wire                io_dataOut_5_fire;
  wire                io_dataOut_6_fire;
  wire                io_dataOut_7_fire;
  wire                io_dataOut_8_fire;
  wire                io_dataOut_9_fire;
  wire                io_dataOut_10_fire;
  wire                io_dataOut_0_fire;

  assign _zz_regVaildCnterArray_0_valueNext_1 = regVaildCnterArray_0_willIncrement;
  assign _zz_regVaildCnterArray_0_valueNext = {3'd0, _zz_regVaildCnterArray_0_valueNext_1};
  assign _zz_regVaildCnterArray_1_valueNext_1 = regVaildCnterArray_1_willIncrement;
  assign _zz_regVaildCnterArray_1_valueNext = {3'd0, _zz_regVaildCnterArray_1_valueNext_1};
  assign _zz_regVaildCnterArray_2_valueNext_1 = regVaildCnterArray_2_willIncrement;
  assign _zz_regVaildCnterArray_2_valueNext = {3'd0, _zz_regVaildCnterArray_2_valueNext_1};
  assign _zz_regVaildCnterArray_3_valueNext_1 = regVaildCnterArray_3_willIncrement;
  assign _zz_regVaildCnterArray_3_valueNext = {3'd0, _zz_regVaildCnterArray_3_valueNext_1};
  assign _zz_regVaildCnterArray_4_valueNext_1 = regVaildCnterArray_4_willIncrement;
  assign _zz_regVaildCnterArray_4_valueNext = {2'd0, _zz_regVaildCnterArray_4_valueNext_1};
  assign _zz_regVaildCnterArray_5_valueNext_1 = regVaildCnterArray_5_willIncrement;
  assign _zz_regVaildCnterArray_5_valueNext = {2'd0, _zz_regVaildCnterArray_5_valueNext_1};
  assign _zz_regVaildCnterArray_6_valueNext_1 = regVaildCnterArray_6_willIncrement;
  assign _zz_regVaildCnterArray_6_valueNext = {2'd0, _zz_regVaildCnterArray_6_valueNext_1};
  assign _zz_regVaildCnterArray_7_valueNext_1 = regVaildCnterArray_7_willIncrement;
  assign _zz_regVaildCnterArray_7_valueNext = {2'd0, _zz_regVaildCnterArray_7_valueNext_1};
  assign _zz_regVaildCnterArray_8_valueNext_1 = regVaildCnterArray_8_willIncrement;
  assign _zz_regVaildCnterArray_8_valueNext = {1'd0, _zz_regVaildCnterArray_8_valueNext_1};
  assign _zz_regVaildCnterArray_9_valueNext_1 = regVaildCnterArray_9_willIncrement;
  assign _zz_regVaildCnterArray_9_valueNext = {1'd0, _zz_regVaildCnterArray_9_valueNext_1};
  always @(*) begin
    regVaildCnterArray_0_willIncrement = 1'b0;
    if(!regVaildCnterArray_0_willOverflowIfInc) begin
      if(io_pushIn_valid) begin
        regVaildCnterArray_0_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_0_willClear = 1'b0;
    if(regVaildCnterArray_0_willOverflowIfInc) begin
      if(io_dataOut_0_fire) begin
        regVaildCnterArray_0_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_0_willOverflowIfInc = (regVaildCnterArray_0_value == 4'b1011);
  assign regVaildCnterArray_0_willOverflow = (regVaildCnterArray_0_willOverflowIfInc && regVaildCnterArray_0_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_0_willOverflow) begin
      regVaildCnterArray_0_valueNext = 4'b0000;
    end else begin
      regVaildCnterArray_0_valueNext = (regVaildCnterArray_0_value + _zz_regVaildCnterArray_0_valueNext);
    end
    if(regVaildCnterArray_0_willClear) begin
      regVaildCnterArray_0_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    regVaildCnterArray_1_willIncrement = 1'b0;
    if(!regVaildCnterArray_1_willOverflowIfInc) begin
      if(shiftValid_0) begin
        regVaildCnterArray_1_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_1_willClear = 1'b0;
    if(regVaildCnterArray_1_willOverflowIfInc) begin
      if(io_dataOut_1_fire) begin
        regVaildCnterArray_1_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_1_willOverflowIfInc = (regVaildCnterArray_1_value == 4'b1010);
  assign regVaildCnterArray_1_willOverflow = (regVaildCnterArray_1_willOverflowIfInc && regVaildCnterArray_1_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_1_willOverflow) begin
      regVaildCnterArray_1_valueNext = 4'b0000;
    end else begin
      regVaildCnterArray_1_valueNext = (regVaildCnterArray_1_value + _zz_regVaildCnterArray_1_valueNext);
    end
    if(regVaildCnterArray_1_willClear) begin
      regVaildCnterArray_1_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    regVaildCnterArray_2_willIncrement = 1'b0;
    if(!regVaildCnterArray_2_willOverflowIfInc) begin
      if(shiftValid_1) begin
        regVaildCnterArray_2_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_2_willClear = 1'b0;
    if(regVaildCnterArray_2_willOverflowIfInc) begin
      if(io_dataOut_2_fire) begin
        regVaildCnterArray_2_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_2_willOverflowIfInc = (regVaildCnterArray_2_value == 4'b1001);
  assign regVaildCnterArray_2_willOverflow = (regVaildCnterArray_2_willOverflowIfInc && regVaildCnterArray_2_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_2_willOverflow) begin
      regVaildCnterArray_2_valueNext = 4'b0000;
    end else begin
      regVaildCnterArray_2_valueNext = (regVaildCnterArray_2_value + _zz_regVaildCnterArray_2_valueNext);
    end
    if(regVaildCnterArray_2_willClear) begin
      regVaildCnterArray_2_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    regVaildCnterArray_3_willIncrement = 1'b0;
    if(!regVaildCnterArray_3_willOverflowIfInc) begin
      if(shiftValid_2) begin
        regVaildCnterArray_3_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_3_willClear = 1'b0;
    if(regVaildCnterArray_3_willOverflowIfInc) begin
      if(io_dataOut_3_fire) begin
        regVaildCnterArray_3_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_3_willOverflowIfInc = (regVaildCnterArray_3_value == 4'b1000);
  assign regVaildCnterArray_3_willOverflow = (regVaildCnterArray_3_willOverflowIfInc && regVaildCnterArray_3_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_3_willOverflow) begin
      regVaildCnterArray_3_valueNext = 4'b0000;
    end else begin
      regVaildCnterArray_3_valueNext = (regVaildCnterArray_3_value + _zz_regVaildCnterArray_3_valueNext);
    end
    if(regVaildCnterArray_3_willClear) begin
      regVaildCnterArray_3_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    regVaildCnterArray_4_willIncrement = 1'b0;
    if(!regVaildCnterArray_4_willOverflowIfInc) begin
      if(shiftValid_3) begin
        regVaildCnterArray_4_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_4_willClear = 1'b0;
    if(regVaildCnterArray_4_willOverflowIfInc) begin
      if(io_dataOut_4_fire) begin
        regVaildCnterArray_4_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_4_willOverflowIfInc = (regVaildCnterArray_4_value == 3'b111);
  always @(*) begin
    regVaildCnterArray_4_valueNext = (regVaildCnterArray_4_value + _zz_regVaildCnterArray_4_valueNext);
    if(regVaildCnterArray_4_willClear) begin
      regVaildCnterArray_4_valueNext = 3'b000;
    end
  end

  always @(*) begin
    regVaildCnterArray_5_willIncrement = 1'b0;
    if(!regVaildCnterArray_5_willOverflowIfInc) begin
      if(shiftValid_4) begin
        regVaildCnterArray_5_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_5_willClear = 1'b0;
    if(regVaildCnterArray_5_willOverflowIfInc) begin
      if(io_dataOut_5_fire) begin
        regVaildCnterArray_5_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_5_willOverflowIfInc = (regVaildCnterArray_5_value == 3'b110);
  assign regVaildCnterArray_5_willOverflow = (regVaildCnterArray_5_willOverflowIfInc && regVaildCnterArray_5_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_5_willOverflow) begin
      regVaildCnterArray_5_valueNext = 3'b000;
    end else begin
      regVaildCnterArray_5_valueNext = (regVaildCnterArray_5_value + _zz_regVaildCnterArray_5_valueNext);
    end
    if(regVaildCnterArray_5_willClear) begin
      regVaildCnterArray_5_valueNext = 3'b000;
    end
  end

  always @(*) begin
    regVaildCnterArray_6_willIncrement = 1'b0;
    if(!regVaildCnterArray_6_willOverflowIfInc) begin
      if(shiftValid_5) begin
        regVaildCnterArray_6_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_6_willClear = 1'b0;
    if(regVaildCnterArray_6_willOverflowIfInc) begin
      if(io_dataOut_6_fire) begin
        regVaildCnterArray_6_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_6_willOverflowIfInc = (regVaildCnterArray_6_value == 3'b101);
  assign regVaildCnterArray_6_willOverflow = (regVaildCnterArray_6_willOverflowIfInc && regVaildCnterArray_6_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_6_willOverflow) begin
      regVaildCnterArray_6_valueNext = 3'b000;
    end else begin
      regVaildCnterArray_6_valueNext = (regVaildCnterArray_6_value + _zz_regVaildCnterArray_6_valueNext);
    end
    if(regVaildCnterArray_6_willClear) begin
      regVaildCnterArray_6_valueNext = 3'b000;
    end
  end

  always @(*) begin
    regVaildCnterArray_7_willIncrement = 1'b0;
    if(!regVaildCnterArray_7_willOverflowIfInc) begin
      if(shiftValid_6) begin
        regVaildCnterArray_7_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_7_willClear = 1'b0;
    if(regVaildCnterArray_7_willOverflowIfInc) begin
      if(io_dataOut_7_fire) begin
        regVaildCnterArray_7_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_7_willOverflowIfInc = (regVaildCnterArray_7_value == 3'b100);
  assign regVaildCnterArray_7_willOverflow = (regVaildCnterArray_7_willOverflowIfInc && regVaildCnterArray_7_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_7_willOverflow) begin
      regVaildCnterArray_7_valueNext = 3'b000;
    end else begin
      regVaildCnterArray_7_valueNext = (regVaildCnterArray_7_value + _zz_regVaildCnterArray_7_valueNext);
    end
    if(regVaildCnterArray_7_willClear) begin
      regVaildCnterArray_7_valueNext = 3'b000;
    end
  end

  always @(*) begin
    regVaildCnterArray_8_willIncrement = 1'b0;
    if(!regVaildCnterArray_8_willOverflowIfInc) begin
      if(shiftValid_7) begin
        regVaildCnterArray_8_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_8_willClear = 1'b0;
    if(regVaildCnterArray_8_willOverflowIfInc) begin
      if(io_dataOut_8_fire) begin
        regVaildCnterArray_8_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_8_willOverflowIfInc = (regVaildCnterArray_8_value == 2'b11);
  always @(*) begin
    regVaildCnterArray_8_valueNext = (regVaildCnterArray_8_value + _zz_regVaildCnterArray_8_valueNext);
    if(regVaildCnterArray_8_willClear) begin
      regVaildCnterArray_8_valueNext = 2'b00;
    end
  end

  always @(*) begin
    regVaildCnterArray_9_willIncrement = 1'b0;
    if(!regVaildCnterArray_9_willOverflowIfInc) begin
      if(shiftValid_8) begin
        regVaildCnterArray_9_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_9_willClear = 1'b0;
    if(regVaildCnterArray_9_willOverflowIfInc) begin
      if(io_dataOut_9_fire) begin
        regVaildCnterArray_9_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_9_willOverflowIfInc = (regVaildCnterArray_9_value == 2'b10);
  assign regVaildCnterArray_9_willOverflow = (regVaildCnterArray_9_willOverflowIfInc && regVaildCnterArray_9_willIncrement);
  always @(*) begin
    if(regVaildCnterArray_9_willOverflow) begin
      regVaildCnterArray_9_valueNext = 2'b00;
    end else begin
      regVaildCnterArray_9_valueNext = (regVaildCnterArray_9_value + _zz_regVaildCnterArray_9_valueNext);
    end
    if(regVaildCnterArray_9_willClear) begin
      regVaildCnterArray_9_valueNext = 2'b00;
    end
  end

  always @(*) begin
    regVaildCnterArray_10_willIncrement = 1'b0;
    if(!regVaildCnterArray_10_willOverflowIfInc) begin
      if(shiftValid_9) begin
        regVaildCnterArray_10_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    regVaildCnterArray_10_willClear = 1'b0;
    if(regVaildCnterArray_10_willOverflowIfInc) begin
      if(io_dataOut_10_fire) begin
        regVaildCnterArray_10_willClear = 1'b1;
      end
    end
  end

  assign regVaildCnterArray_10_willOverflowIfInc = (regVaildCnterArray_10_value == 1'b1);
  always @(*) begin
    regVaildCnterArray_10_valueNext = (regVaildCnterArray_10_value + regVaildCnterArray_10_willIncrement);
    if(regVaildCnterArray_10_willClear) begin
      regVaildCnterArray_10_valueNext = 1'b0;
    end
  end

  assign regVaildCnterArray_11_willOverflowIfInc = 1'b1;
  always @(*) begin
    if(regVaildCnterArray_1_willOverflowIfInc) begin
      io_dataOut_1_valid = 1'b1;
    end else begin
      io_dataOut_1_valid = 1'b0;
    end
  end

  assign io_dataOut_1_fire = (io_dataOut_1_valid && io_dataOut_1_ready);
  always @(*) begin
    if(regVaildCnterArray_2_willOverflowIfInc) begin
      io_dataOut_2_valid = 1'b1;
    end else begin
      io_dataOut_2_valid = 1'b0;
    end
  end

  assign io_dataOut_2_fire = (io_dataOut_2_valid && io_dataOut_2_ready);
  always @(*) begin
    if(regVaildCnterArray_3_willOverflowIfInc) begin
      io_dataOut_3_valid = 1'b1;
    end else begin
      io_dataOut_3_valid = 1'b0;
    end
  end

  assign io_dataOut_3_fire = (io_dataOut_3_valid && io_dataOut_3_ready);
  always @(*) begin
    if(regVaildCnterArray_4_willOverflowIfInc) begin
      io_dataOut_4_valid = 1'b1;
    end else begin
      io_dataOut_4_valid = 1'b0;
    end
  end

  assign io_dataOut_4_fire = (io_dataOut_4_valid && io_dataOut_4_ready);
  always @(*) begin
    if(regVaildCnterArray_5_willOverflowIfInc) begin
      io_dataOut_5_valid = 1'b1;
    end else begin
      io_dataOut_5_valid = 1'b0;
    end
  end

  assign io_dataOut_5_fire = (io_dataOut_5_valid && io_dataOut_5_ready);
  always @(*) begin
    if(regVaildCnterArray_6_willOverflowIfInc) begin
      io_dataOut_6_valid = 1'b1;
    end else begin
      io_dataOut_6_valid = 1'b0;
    end
  end

  assign io_dataOut_6_fire = (io_dataOut_6_valid && io_dataOut_6_ready);
  always @(*) begin
    if(regVaildCnterArray_7_willOverflowIfInc) begin
      io_dataOut_7_valid = 1'b1;
    end else begin
      io_dataOut_7_valid = 1'b0;
    end
  end

  assign io_dataOut_7_fire = (io_dataOut_7_valid && io_dataOut_7_ready);
  always @(*) begin
    if(regVaildCnterArray_8_willOverflowIfInc) begin
      io_dataOut_8_valid = 1'b1;
    end else begin
      io_dataOut_8_valid = 1'b0;
    end
  end

  assign io_dataOut_8_fire = (io_dataOut_8_valid && io_dataOut_8_ready);
  always @(*) begin
    if(regVaildCnterArray_9_willOverflowIfInc) begin
      io_dataOut_9_valid = 1'b1;
    end else begin
      io_dataOut_9_valid = 1'b0;
    end
  end

  assign io_dataOut_9_fire = (io_dataOut_9_valid && io_dataOut_9_ready);
  always @(*) begin
    if(regVaildCnterArray_10_willOverflowIfInc) begin
      io_dataOut_10_valid = 1'b1;
    end else begin
      io_dataOut_10_valid = 1'b0;
    end
  end

  assign io_dataOut_10_fire = (io_dataOut_10_valid && io_dataOut_10_ready);
  always @(*) begin
    if(regVaildCnterArray_11_willOverflowIfInc) begin
      io_dataOut_11_valid = 1'b1;
    end else begin
      io_dataOut_11_valid = 1'b0;
    end
  end

  always @(*) begin
    if(regVaildCnterArray_0_willOverflowIfInc) begin
      io_dataOut_0_valid = 1'b1;
    end else begin
      io_dataOut_0_valid = 1'b0;
    end
  end

  assign io_dataOut_0_fire = (io_dataOut_0_valid && io_dataOut_0_ready);
  assign io_dataOut_0_payload = shiftRegs_0;
  assign io_dataOut_1_payload = shiftRegs_1;
  assign io_dataOut_2_payload = shiftRegs_2;
  assign io_dataOut_3_payload = shiftRegs_3;
  assign io_dataOut_4_payload = shiftRegs_4;
  assign io_dataOut_5_payload = shiftRegs_5;
  assign io_dataOut_6_payload = shiftRegs_6;
  assign io_dataOut_7_payload = shiftRegs_7;
  assign io_dataOut_8_payload = shiftRegs_8;
  assign io_dataOut_9_payload = shiftRegs_9;
  assign io_dataOut_10_payload = shiftRegs_10;
  assign io_dataOut_11_payload = shiftRegs_11;
  always @(posedge clk) begin
    if(!clrn) begin
      regVaildCnterArray_0_value <= 4'b0000;
      regVaildCnterArray_1_value <= 4'b0000;
      regVaildCnterArray_2_value <= 4'b0000;
      regVaildCnterArray_3_value <= 4'b0000;
      regVaildCnterArray_4_value <= 3'b000;
      regVaildCnterArray_5_value <= 3'b000;
      regVaildCnterArray_6_value <= 3'b000;
      regVaildCnterArray_7_value <= 3'b000;
      regVaildCnterArray_8_value <= 2'b00;
      regVaildCnterArray_9_value <= 2'b00;
      regVaildCnterArray_10_value <= 1'b0;
    end else begin
      regVaildCnterArray_0_value <= regVaildCnterArray_0_valueNext;
      regVaildCnterArray_1_value <= regVaildCnterArray_1_valueNext;
      regVaildCnterArray_2_value <= regVaildCnterArray_2_valueNext;
      regVaildCnterArray_3_value <= regVaildCnterArray_3_valueNext;
      regVaildCnterArray_4_value <= regVaildCnterArray_4_valueNext;
      regVaildCnterArray_5_value <= regVaildCnterArray_5_valueNext;
      regVaildCnterArray_6_value <= regVaildCnterArray_6_valueNext;
      regVaildCnterArray_7_value <= regVaildCnterArray_7_valueNext;
      regVaildCnterArray_8_value <= regVaildCnterArray_8_valueNext;
      regVaildCnterArray_9_value <= regVaildCnterArray_9_valueNext;
      regVaildCnterArray_10_value <= regVaildCnterArray_10_valueNext;
    end
  end

  always @(posedge clk) begin
    if(regVaildCnterArray_1_willOverflowIfInc) begin
      if(io_dataOut_1_fire) begin
        shiftValid_1 <= 1'b0;
      end
    end else begin
      if(shiftValid_0) begin
        shiftRegs_1 <= shiftRegs_0;
        shiftValid_1 <= shiftValid_0;
      end
    end
    if(regVaildCnterArray_2_willOverflowIfInc) begin
      if(io_dataOut_2_fire) begin
        shiftValid_2 <= 1'b0;
      end
    end else begin
      if(shiftValid_1) begin
        shiftRegs_2 <= shiftRegs_1;
        shiftValid_2 <= shiftValid_1;
      end
    end
    if(regVaildCnterArray_3_willOverflowIfInc) begin
      if(io_dataOut_3_fire) begin
        shiftValid_3 <= 1'b0;
      end
    end else begin
      if(shiftValid_2) begin
        shiftRegs_3 <= shiftRegs_2;
        shiftValid_3 <= shiftValid_2;
      end
    end
    if(regVaildCnterArray_4_willOverflowIfInc) begin
      if(io_dataOut_4_fire) begin
        shiftValid_4 <= 1'b0;
      end
    end else begin
      if(shiftValid_3) begin
        shiftRegs_4 <= shiftRegs_3;
        shiftValid_4 <= shiftValid_3;
      end
    end
    if(regVaildCnterArray_5_willOverflowIfInc) begin
      if(io_dataOut_5_fire) begin
        shiftValid_5 <= 1'b0;
      end
    end else begin
      if(shiftValid_4) begin
        shiftRegs_5 <= shiftRegs_4;
        shiftValid_5 <= shiftValid_4;
      end
    end
    if(regVaildCnterArray_6_willOverflowIfInc) begin
      if(io_dataOut_6_fire) begin
        shiftValid_6 <= 1'b0;
      end
    end else begin
      if(shiftValid_5) begin
        shiftRegs_6 <= shiftRegs_5;
        shiftValid_6 <= shiftValid_5;
      end
    end
    if(regVaildCnterArray_7_willOverflowIfInc) begin
      if(io_dataOut_7_fire) begin
        shiftValid_7 <= 1'b0;
      end
    end else begin
      if(shiftValid_6) begin
        shiftRegs_7 <= shiftRegs_6;
        shiftValid_7 <= shiftValid_6;
      end
    end
    if(regVaildCnterArray_8_willOverflowIfInc) begin
      if(io_dataOut_8_fire) begin
        shiftValid_8 <= 1'b0;
      end
    end else begin
      if(shiftValid_7) begin
        shiftRegs_8 <= shiftRegs_7;
        shiftValid_8 <= shiftValid_7;
      end
    end
    if(regVaildCnterArray_9_willOverflowIfInc) begin
      if(io_dataOut_9_fire) begin
        shiftValid_9 <= 1'b0;
      end
    end else begin
      if(shiftValid_8) begin
        shiftRegs_9 <= shiftRegs_8;
        shiftValid_9 <= shiftValid_8;
      end
    end
    if(regVaildCnterArray_10_willOverflowIfInc) begin
      if(io_dataOut_10_fire) begin
        shiftValid_10 <= 1'b0;
      end
    end else begin
      if(shiftValid_9) begin
        shiftRegs_10 <= shiftRegs_9;
        shiftValid_10 <= shiftValid_9;
      end
    end
    if(!regVaildCnterArray_11_willOverflowIfInc) begin
      if(shiftValid_10) begin
        shiftRegs_11 <= shiftRegs_10;
      end
    end
    if(regVaildCnterArray_0_willOverflowIfInc) begin
      if(io_dataOut_0_fire) begin
        shiftValid_0 <= io_pushIn_valid;
        shiftRegs_0 <= (io_pushIn_valid ? io_pushIn_payload : 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000);
      end
    end else begin
      if(io_pushIn_valid) begin
        shiftRegs_0 <= io_pushIn_payload;
        shiftValid_0 <= 1'b1;
      end
    end
  end


endmodule
