// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : InputShiftReg
// Git hash  : 49d0755e1ebad225e157f484ef3544456c6ad7b5

`timescale 1ns/1ps 
module InputShiftReg (
  input               io_pushIn_valid,
  output              io_pushIn_ready,
  input      [319:0]  io_pushIn_payload,
  output reg          io_dataOut_0_valid,
  input               io_dataOut_0_ready,
  output     [319:0]  io_dataOut_0_payload,
  output reg          io_dataOut_1_valid,
  input               io_dataOut_1_ready,
  output     [319:0]  io_dataOut_1_payload,
  output reg          io_dataOut_2_valid,
  input               io_dataOut_2_ready,
  output     [319:0]  io_dataOut_2_payload,
  output reg          io_dataOut_3_valid,
  input               io_dataOut_3_ready,
  output     [319:0]  io_dataOut_3_payload,
  output reg          io_dataOut_4_valid,
  input               io_dataOut_4_ready,
  output     [319:0]  io_dataOut_4_payload,
  input               clk,
  input               clrn
);

  wire       [2:0]    _zz_loadedNumRegs_valueNext;
  wire       [0:0]    _zz_loadedNumRegs_valueNext_1;
  reg        [319:0]  shiftRegs_0;
  reg        [319:0]  shiftRegs_1;
  reg        [319:0]  shiftRegs_2;
  reg        [319:0]  shiftRegs_3;
  reg        [319:0]  shiftRegs_4;
  reg                 isLoading;
  reg                 loadedNumRegs_willIncrement;
  reg                 loadedNumRegs_willClear;
  reg        [2:0]    loadedNumRegs_valueNext;
  reg        [2:0]    loadedNumRegs_value;
  wire                loadedNumRegs_willOverflowIfInc;
  wire                loadedNumRegs_willOverflow;
  wire                io_pushIn_fire;
  wire                io_pushIn_fire_1;
  wire                io_dataOut_0_fire;

  assign _zz_loadedNumRegs_valueNext_1 = loadedNumRegs_willIncrement;
  assign _zz_loadedNumRegs_valueNext = {2'd0, _zz_loadedNumRegs_valueNext_1};
  always @(*) begin
    loadedNumRegs_willIncrement = 1'b0;
    if(isLoading) begin
      if(io_pushIn_fire_1) begin
        loadedNumRegs_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    loadedNumRegs_willClear = 1'b0;
    if(!isLoading) begin
      loadedNumRegs_willClear = 1'b1;
    end
  end

  assign loadedNumRegs_willOverflowIfInc = (loadedNumRegs_value == 3'b100);
  assign loadedNumRegs_willOverflow = (loadedNumRegs_willOverflowIfInc && loadedNumRegs_willIncrement);
  always @(*) begin
    if(loadedNumRegs_willOverflow) begin
      loadedNumRegs_valueNext = 3'b000;
    end else begin
      loadedNumRegs_valueNext = (loadedNumRegs_value + _zz_loadedNumRegs_valueNext);
    end
    if(loadedNumRegs_willClear) begin
      loadedNumRegs_valueNext = 3'b000;
    end
  end

  assign io_pushIn_fire = (io_pushIn_valid && io_pushIn_ready);
  assign io_dataOut_0_payload = shiftRegs_0;
  assign io_dataOut_1_payload = shiftRegs_1;
  assign io_dataOut_2_payload = shiftRegs_2;
  assign io_dataOut_3_payload = shiftRegs_3;
  assign io_dataOut_4_payload = shiftRegs_4;
  always @(*) begin
    io_dataOut_0_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_0_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_1_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_1_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_2_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_2_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_3_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_3_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_4_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_4_valid = 1'b1;
    end
  end

  assign io_pushIn_fire_1 = (io_pushIn_valid && io_pushIn_ready);
  assign io_dataOut_0_fire = (io_dataOut_0_valid && io_dataOut_0_ready);
  assign io_pushIn_ready = isLoading;
  always @(posedge clk) begin
    if(!clrn) begin
      shiftRegs_0 <= 320'h0;
      shiftRegs_1 <= 320'h0;
      shiftRegs_2 <= 320'h0;
      shiftRegs_3 <= 320'h0;
      shiftRegs_4 <= 320'h0;
      isLoading <= 1'b0;
      loadedNumRegs_value <= 3'b000;
    end else begin
      loadedNumRegs_value <= loadedNumRegs_valueNext;
      if(isLoading) begin
        if(io_pushIn_fire) begin
          shiftRegs_0 <= io_pushIn_payload;
          shiftRegs_1 <= shiftRegs_0;
          shiftRegs_2 <= shiftRegs_1;
          shiftRegs_3 <= shiftRegs_2;
          shiftRegs_4 <= shiftRegs_3;
        end
      end
      if(isLoading) begin
        if(loadedNumRegs_willOverflow) begin
          isLoading <= 1'b0;
        end
      end else begin
        if(io_dataOut_0_fire) begin
          isLoading <= 1'b1;
        end
      end
    end
  end


endmodule
