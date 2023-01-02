// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : InputShiftReg
// Git hash  : 0bb1bc1ae0d66d050090da7c42b30392afe42cab

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
  output reg          io_dataOut_5_valid,
  input               io_dataOut_5_ready,
  output     [319:0]  io_dataOut_5_payload,
  output reg          io_dataOut_6_valid,
  input               io_dataOut_6_ready,
  output     [319:0]  io_dataOut_6_payload,
  output reg          io_dataOut_7_valid,
  input               io_dataOut_7_ready,
  output     [319:0]  io_dataOut_7_payload,
  output reg          io_dataOut_8_valid,
  input               io_dataOut_8_ready,
  output     [319:0]  io_dataOut_8_payload,
  output reg          io_dataOut_9_valid,
  input               io_dataOut_9_ready,
  output     [319:0]  io_dataOut_9_payload,
  output reg          io_dataOut_10_valid,
  input               io_dataOut_10_ready,
  output     [319:0]  io_dataOut_10_payload,
  output reg          io_dataOut_11_valid,
  input               io_dataOut_11_ready,
  output     [319:0]  io_dataOut_11_payload,
  output reg          io_dataOut_12_valid,
  input               io_dataOut_12_ready,
  output     [319:0]  io_dataOut_12_payload,
  output reg          io_dataOut_13_valid,
  input               io_dataOut_13_ready,
  output     [319:0]  io_dataOut_13_payload,
  output reg          io_dataOut_14_valid,
  input               io_dataOut_14_ready,
  output     [319:0]  io_dataOut_14_payload,
  output reg          io_dataOut_15_valid,
  input               io_dataOut_15_ready,
  output     [319:0]  io_dataOut_15_payload,
  output reg          io_dataOut_16_valid,
  input               io_dataOut_16_ready,
  output     [319:0]  io_dataOut_16_payload,
  output reg          io_dataOut_17_valid,
  input               io_dataOut_17_ready,
  output     [319:0]  io_dataOut_17_payload,
  output reg          io_dataOut_18_valid,
  input               io_dataOut_18_ready,
  output     [319:0]  io_dataOut_18_payload,
  output reg          io_dataOut_19_valid,
  input               io_dataOut_19_ready,
  output     [319:0]  io_dataOut_19_payload,
  input               clk,
  input               clrn
);

  wire       [4:0]    _zz_loadedNumRegs_valueNext;
  wire       [0:0]    _zz_loadedNumRegs_valueNext_1;
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
  reg        [319:0]  shiftRegs_12;
  reg        [319:0]  shiftRegs_13;
  reg        [319:0]  shiftRegs_14;
  reg        [319:0]  shiftRegs_15;
  reg        [319:0]  shiftRegs_16;
  reg        [319:0]  shiftRegs_17;
  reg        [319:0]  shiftRegs_18;
  reg        [319:0]  shiftRegs_19;
  reg                 isLoading;
  reg                 loadedNumRegs_willIncrement;
  reg                 loadedNumRegs_willClear;
  reg        [4:0]    loadedNumRegs_valueNext;
  reg        [4:0]    loadedNumRegs_value;
  wire                loadedNumRegs_willOverflowIfInc;
  wire                loadedNumRegs_willOverflow;
  wire                io_pushIn_fire;
  wire                io_pushIn_fire_1;
  wire                io_dataOut_0_fire;

  assign _zz_loadedNumRegs_valueNext_1 = loadedNumRegs_willIncrement;
  assign _zz_loadedNumRegs_valueNext = {4'd0, _zz_loadedNumRegs_valueNext_1};
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

  assign loadedNumRegs_willOverflowIfInc = (loadedNumRegs_value == 5'h13);
  assign loadedNumRegs_willOverflow = (loadedNumRegs_willOverflowIfInc && loadedNumRegs_willIncrement);
  always @(*) begin
    if(loadedNumRegs_willOverflow) begin
      loadedNumRegs_valueNext = 5'h0;
    end else begin
      loadedNumRegs_valueNext = (loadedNumRegs_value + _zz_loadedNumRegs_valueNext);
    end
    if(loadedNumRegs_willClear) begin
      loadedNumRegs_valueNext = 5'h0;
    end
  end

  assign io_pushIn_fire = (io_pushIn_valid && io_pushIn_ready);
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
  assign io_dataOut_12_payload = shiftRegs_12;
  assign io_dataOut_13_payload = shiftRegs_13;
  assign io_dataOut_14_payload = shiftRegs_14;
  assign io_dataOut_15_payload = shiftRegs_15;
  assign io_dataOut_16_payload = shiftRegs_16;
  assign io_dataOut_17_payload = shiftRegs_17;
  assign io_dataOut_18_payload = shiftRegs_18;
  assign io_dataOut_19_payload = shiftRegs_19;
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

  always @(*) begin
    io_dataOut_5_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_5_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_6_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_6_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_7_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_7_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_8_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_8_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_9_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_9_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_10_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_10_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_11_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_11_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_12_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_12_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_13_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_13_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_14_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_14_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_15_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_15_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_16_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_16_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_17_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_17_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_18_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_18_valid = 1'b1;
    end
  end

  always @(*) begin
    io_dataOut_19_valid = 1'b0;
    if(!isLoading) begin
      io_dataOut_19_valid = 1'b1;
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
      shiftRegs_5 <= 320'h0;
      shiftRegs_6 <= 320'h0;
      shiftRegs_7 <= 320'h0;
      shiftRegs_8 <= 320'h0;
      shiftRegs_9 <= 320'h0;
      shiftRegs_10 <= 320'h0;
      shiftRegs_11 <= 320'h0;
      shiftRegs_12 <= 320'h0;
      shiftRegs_13 <= 320'h0;
      shiftRegs_14 <= 320'h0;
      shiftRegs_15 <= 320'h0;
      shiftRegs_16 <= 320'h0;
      shiftRegs_17 <= 320'h0;
      shiftRegs_18 <= 320'h0;
      shiftRegs_19 <= 320'h0;
      isLoading <= 1'b0;
      loadedNumRegs_value <= 5'h0;
    end else begin
      loadedNumRegs_value <= loadedNumRegs_valueNext;
      if(isLoading) begin
        if(io_pushIn_fire) begin
          shiftRegs_0 <= io_pushIn_payload;
          shiftRegs_1 <= shiftRegs_0;
          shiftRegs_2 <= shiftRegs_1;
          shiftRegs_3 <= shiftRegs_2;
          shiftRegs_4 <= shiftRegs_3;
          shiftRegs_5 <= shiftRegs_4;
          shiftRegs_6 <= shiftRegs_5;
          shiftRegs_7 <= shiftRegs_6;
          shiftRegs_8 <= shiftRegs_7;
          shiftRegs_9 <= shiftRegs_8;
          shiftRegs_10 <= shiftRegs_9;
          shiftRegs_11 <= shiftRegs_10;
          shiftRegs_12 <= shiftRegs_11;
          shiftRegs_13 <= shiftRegs_12;
          shiftRegs_14 <= shiftRegs_13;
          shiftRegs_15 <= shiftRegs_14;
          shiftRegs_16 <= shiftRegs_15;
          shiftRegs_17 <= shiftRegs_16;
          shiftRegs_18 <= shiftRegs_17;
          shiftRegs_19 <= shiftRegs_18;
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
