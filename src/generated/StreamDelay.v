// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : StreamDelay
// Git hash  : 49d0755e1ebad225e157f484ef3544456c6ad7b5

`timescale 1ns/1ps 
module StreamDelay (
  input               io_inputStream_valid,
  output              io_inputStream_ready,
  input      [71:0]   io_inputStream_payload,
  output              io_outputStream_valid,
  input               io_outputStream_ready,
  output     [71:0]   io_outputStream_payload,
  input               clk,
  input               clrn
);

  reg        [71:0]   outReg;
  reg        [71:0]   bufferReg;
  reg                 outValidReg;
  reg                 inReadyReg;
  reg                 isBufferLoaded;
  wire                when_Misc_l82;
  wire                io_inputStream_fire;
  wire                io_inputStream_fire_1;
  wire                io_outputStream_fire;
  wire                when_Misc_l88;
  wire                io_inputStream_fire_2;
  wire                io_inputStream_fire_3;
  wire                io_inputStream_fire_4;
  wire                when_Misc_l101;
  wire                io_outputStream_fire_1;
  wire                when_Misc_l91;

  assign when_Misc_l82 = (! outValidReg);
  assign io_inputStream_fire = (io_inputStream_valid && io_inputStream_ready);
  assign io_inputStream_fire_1 = (io_inputStream_valid && io_inputStream_ready);
  assign io_outputStream_fire = (io_outputStream_valid && io_outputStream_ready);
  assign when_Misc_l88 = (io_outputStream_fire && (! isBufferLoaded));
  assign io_inputStream_fire_2 = (io_inputStream_valid && io_inputStream_ready);
  assign io_inputStream_fire_3 = (io_inputStream_valid && io_inputStream_ready);
  assign io_inputStream_fire_4 = (io_inputStream_valid && io_inputStream_ready);
  assign when_Misc_l101 = (io_inputStream_fire_4 && (! isBufferLoaded));
  assign io_outputStream_fire_1 = (io_outputStream_valid && io_outputStream_ready);
  assign when_Misc_l91 = (io_outputStream_fire_1 && isBufferLoaded);
  assign io_outputStream_payload = outReg;
  assign io_inputStream_ready = inReadyReg;
  assign io_outputStream_valid = outValidReg;
  always @(posedge clk) begin
    if(!clrn) begin
      outValidReg <= 1'b0;
      inReadyReg <= 1'b1;
      isBufferLoaded <= 1'b0;
    end else begin
      inReadyReg <= io_outputStream_ready;
      if(when_Misc_l82) begin
        outValidReg <= io_inputStream_fire;
      end else begin
        if(when_Misc_l88) begin
          outValidReg <= io_inputStream_fire_2;
        end else begin
          if(when_Misc_l91) begin
            outValidReg <= 1'b1;
            if(io_inputStream_fire_3) begin
              isBufferLoaded <= 1'b1;
            end else begin
              isBufferLoaded <= 1'b0;
            end
          end else begin
            if(when_Misc_l101) begin
              isBufferLoaded <= 1'b1;
            end
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_Misc_l82) begin
      if(io_inputStream_fire_1) begin
        outReg <= io_inputStream_payload;
      end
    end else begin
      if(when_Misc_l88) begin
        outReg <= io_inputStream_payload;
      end else begin
        if(when_Misc_l91) begin
          outReg <= bufferReg;
          if(io_inputStream_fire_3) begin
            bufferReg <= io_inputStream_payload;
          end
        end else begin
          if(when_Misc_l101) begin
            bufferReg <= io_inputStream_payload;
          end
        end
      end
    end
  end


endmodule
