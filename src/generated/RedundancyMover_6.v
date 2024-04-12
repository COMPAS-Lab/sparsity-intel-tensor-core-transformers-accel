// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyMover_6
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyMover_6 (
  input  wire [10:0]   io_inputSeq_0,
  input  wire [10:0]   io_inputSeq_1,
  input  wire [10:0]   io_inputSeq_2,
  input  wire [10:0]   io_inputSeq_3,
  output wire [10:0]   io_outputSeq_0,
  output wire [10:0]   io_outputSeq_1,
  output wire [10:0]   io_outputSeq_2,
  output wire [10:0]   io_outputSeq_3
);

  reg        [10:0]   _zz_io_outputSeq_1;
  wire       [0:0]    _zz_io_outputSeq_1_1;
  reg        [10:0]   _zz_io_outputSeq_2;
  wire       [0:0]    _zz_io_outputSeq_2_1;
  reg        [10:0]   _zz_io_outputSeq_3;
  reg        [10:0]   lower_half_0;
  reg        [10:0]   lower_half_1;
  wire       [1:0]    switch_RedundancyMover_l17;
  reg        [10:0]   upper_half_0;
  reg        [10:0]   upper_half_1;
  wire       [1:0]    switch_RedundancyMover_l17_1;
  wire       [10:0]   upper_candidates_0;
  wire       [10:0]   upper_candidates_1;
  wire       [0:0]    switch_RedundancyMover_l68;

  assign _zz_io_outputSeq_1_1 = lower_half_1[10];
  assign _zz_io_outputSeq_2_1 = (lower_half_1[10] == 1'b1);
  always @(*) begin
    case(_zz_io_outputSeq_1_1)
      1'b0 : _zz_io_outputSeq_1 = upper_candidates_0;
      default : _zz_io_outputSeq_1 = upper_candidates_1;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_2_1)
      1'b0 : _zz_io_outputSeq_2 = upper_half_0;
      default : _zz_io_outputSeq_2 = upper_half_1;
    endcase
  end

  assign switch_RedundancyMover_l17 = {io_inputSeq_0[10],io_inputSeq_1[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0 = io_inputSeq_0;
      end
      default : begin
        lower_half_0 = io_inputSeq_1;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1 = io_inputSeq_1;
      end
      default : begin
        lower_half_1 = io_inputSeq_0;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_1 = {io_inputSeq_2[10],io_inputSeq_3[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_1)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0 = io_inputSeq_2;
      end
      default : begin
        upper_half_0 = io_inputSeq_3;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_1)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1 = io_inputSeq_3;
      end
      default : begin
        upper_half_1 = io_inputSeq_2;
      end
    endcase
  end

  assign upper_candidates_0 = lower_half_1;
  assign upper_candidates_1 = upper_half_0;
  assign switch_RedundancyMover_l68 = (lower_half_1[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68)
      1'b0 : begin
        _zz_io_outputSeq_3 = upper_half_1;
      end
      default : begin
        _zz_io_outputSeq_3 = {1'b1,10'h000};
      end
    endcase
  end

  assign io_outputSeq_0 = lower_half_0;
  assign io_outputSeq_1 = _zz_io_outputSeq_1;
  assign io_outputSeq_2 = _zz_io_outputSeq_2;
  assign io_outputSeq_3 = _zz_io_outputSeq_3;

endmodule
