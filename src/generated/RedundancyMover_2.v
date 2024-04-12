// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyMover_2
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyMover_2 (
  input  wire [10:0]   io_inputSeq_0,
  input  wire [10:0]   io_inputSeq_1,
  input  wire [10:0]   io_inputSeq_2,
  input  wire [10:0]   io_inputSeq_3,
  input  wire [10:0]   io_inputSeq_4,
  input  wire [10:0]   io_inputSeq_5,
  input  wire [10:0]   io_inputSeq_6,
  input  wire [10:0]   io_inputSeq_7,
  output wire [10:0]   io_outputSeq_0,
  output wire [10:0]   io_outputSeq_1,
  output wire [10:0]   io_outputSeq_2,
  output wire [10:0]   io_outputSeq_3,
  output wire [10:0]   io_outputSeq_4,
  output wire [10:0]   io_outputSeq_5,
  output wire [10:0]   io_outputSeq_6,
  output wire [10:0]   io_outputSeq_7
);

  reg        [10:0]   _zz_lower_half_1;
  wire       [0:0]    _zz_lower_half_1_1;
  reg        [10:0]   _zz_lower_half_2;
  wire       [0:0]    _zz_lower_half_2_1;
  reg        [10:0]   _zz_upper_half_1_1;
  wire       [0:0]    _zz_upper_half_1_1_1;
  reg        [10:0]   _zz_upper_half_2;
  wire       [0:0]    _zz_upper_half_2_1;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_2;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_2_1;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_3;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_3_1;
  reg        [10:0]   _zz_io_outputSeq_2;
  wire       [0:0]    _zz_io_outputSeq_2_1;
  reg        [10:0]   _zz_io_outputSeq_3_1;
  wire       [1:0]    _zz_io_outputSeq_3_2;
  wire       [1:0]    _zz_io_outputSeq_3_3;
  wire       [0:0]    _zz_io_outputSeq_3_4;
  reg        [10:0]   _zz_io_outputSeq_4_1;
  wire       [1:0]    _zz_io_outputSeq_4_2;
  wire       [1:0]    _zz_io_outputSeq_4_3;
  wire       [0:0]    _zz_io_outputSeq_4_4;
  reg        [10:0]   _zz_io_outputSeq_5_1;
  wire       [1:0]    _zz_io_outputSeq_5_2;
  wire       [1:0]    _zz_io_outputSeq_5_3;
  wire       [0:0]    _zz_io_outputSeq_5_4;
  reg        [10:0]   _zz_io_outputSeq_6;
  reg        [10:0]   _zz_io_outputSeq_7;
  wire       [10:0]   _zz_io_outputSeq_6_1;
  wire       [10:0]   lower_half_0;
  wire       [10:0]   lower_half_1;
  wire       [10:0]   lower_half_2;
  reg        [10:0]   lower_half_3;
  reg        [10:0]   lower_half_0_1;
  reg        [10:0]   lower_half_1_1;
  wire       [1:0]    switch_RedundancyMover_l17;
  reg        [10:0]   upper_half_0;
  reg        [10:0]   upper_half_1;
  wire       [1:0]    switch_RedundancyMover_l17_1;
  wire       [10:0]   upper_candidates_0;
  wire       [10:0]   upper_candidates_1;
  wire       [0:0]    switch_RedundancyMover_l68;
  wire       [10:0]   upper_half_0_1;
  wire       [10:0]   upper_half_1_1;
  wire       [10:0]   upper_half_2;
  reg        [10:0]   upper_half_3;
  reg        [10:0]   lower_half_0_2;
  reg        [10:0]   lower_half_1_2;
  wire       [1:0]    switch_RedundancyMover_l17_2;
  reg        [10:0]   upper_half_0_2;
  reg        [10:0]   upper_half_1_2;
  wire       [1:0]    switch_RedundancyMover_l17_3;
  wire       [10:0]   upper_candidates_0_1;
  wire       [10:0]   upper_candidates_1_1;
  wire       [0:0]    switch_RedundancyMover_l68_1;
  wire       [10:0]   upper_candidates_0_2;
  wire       [10:0]   upper_candidates_1_2;
  wire       [10:0]   upper_candidates_0_3;
  wire       [10:0]   upper_candidates_1_3;
  wire       [10:0]   upper_candidates_2;
  wire                _zz_io_outputSeq_3;
  wire                _zz_io_outputSeq_4;
  wire                _zz_io_outputSeq_5;
  wire                _zz_switch_RedundancyMover_l68;
  wire       [1:0]    switch_RedundancyMover_l68_2;
  wire                _zz_switch_RedundancyMover_l68_1;
  wire       [1:0]    switch_RedundancyMover_l68_3;

  assign _zz_switch_RedundancyMover_l68_2_1 = (lower_half_3[10] == _zz_switch_RedundancyMover_l68);
  assign _zz_switch_RedundancyMover_l68_2 = {1'd0, _zz_switch_RedundancyMover_l68_2_1};
  assign _zz_switch_RedundancyMover_l68_3_1 = (lower_half_3[10] == _zz_switch_RedundancyMover_l68_1);
  assign _zz_switch_RedundancyMover_l68_3 = {1'd0, _zz_switch_RedundancyMover_l68_3_1};
  assign _zz_io_outputSeq_3_2 = ({1'b0,(lower_half_2[10] == _zz_io_outputSeq_3)} + _zz_io_outputSeq_3_3);
  assign _zz_io_outputSeq_3_4 = (lower_half_3[10] == _zz_io_outputSeq_3);
  assign _zz_io_outputSeq_3_3 = {1'd0, _zz_io_outputSeq_3_4};
  assign _zz_io_outputSeq_4_2 = ({1'b0,(lower_half_2[10] == _zz_io_outputSeq_4)} + _zz_io_outputSeq_4_3);
  assign _zz_io_outputSeq_4_4 = (lower_half_3[10] == _zz_io_outputSeq_4);
  assign _zz_io_outputSeq_4_3 = {1'd0, _zz_io_outputSeq_4_4};
  assign _zz_io_outputSeq_5_2 = ({1'b0,(lower_half_2[10] == _zz_io_outputSeq_5)} + _zz_io_outputSeq_5_3);
  assign _zz_io_outputSeq_5_4 = (lower_half_3[10] == _zz_io_outputSeq_5);
  assign _zz_io_outputSeq_5_3 = {1'd0, _zz_io_outputSeq_5_4};
  assign _zz_lower_half_1_1 = lower_half_1_1[10];
  assign _zz_lower_half_2_1 = (lower_half_1_1[10] == 1'b1);
  assign _zz_upper_half_1_1_1 = lower_half_1_2[10];
  assign _zz_upper_half_2_1 = (lower_half_1_2[10] == 1'b1);
  assign _zz_io_outputSeq_2_1 = lower_half_2[10];
  always @(*) begin
    case(_zz_lower_half_1_1)
      1'b0 : _zz_lower_half_1 = upper_candidates_0;
      default : _zz_lower_half_1 = upper_candidates_1;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_2_1)
      1'b0 : _zz_lower_half_2 = upper_half_0;
      default : _zz_lower_half_2 = upper_half_1;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_1_1_1)
      1'b0 : _zz_upper_half_1_1 = upper_candidates_0_1;
      default : _zz_upper_half_1_1 = upper_candidates_1_1;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_2_1)
      1'b0 : _zz_upper_half_2 = upper_half_0_2;
      default : _zz_upper_half_2 = upper_half_1_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_2_1)
      1'b0 : _zz_io_outputSeq_2 = upper_candidates_0_2;
      default : _zz_io_outputSeq_2 = upper_candidates_1_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_3_2)
      2'b00 : _zz_io_outputSeq_3_1 = upper_candidates_0_3;
      2'b01 : _zz_io_outputSeq_3_1 = upper_candidates_1_3;
      default : _zz_io_outputSeq_3_1 = upper_candidates_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_4_2)
      2'b00 : _zz_io_outputSeq_4_1 = upper_half_0_1;
      2'b01 : _zz_io_outputSeq_4_1 = upper_half_1_1;
      default : _zz_io_outputSeq_4_1 = upper_half_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_5_2)
      2'b00 : _zz_io_outputSeq_5_1 = upper_half_1_1;
      2'b01 : _zz_io_outputSeq_5_1 = upper_half_2;
      default : _zz_io_outputSeq_5_1 = upper_half_3;
    endcase
  end

  assign _zz_io_outputSeq_6_1 = {1'b1,10'h000};
  assign switch_RedundancyMover_l17 = {io_inputSeq_0[10],io_inputSeq_1[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_1 = io_inputSeq_0;
      end
      default : begin
        lower_half_0_1 = io_inputSeq_1;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_1 = io_inputSeq_1;
      end
      default : begin
        lower_half_1_1 = io_inputSeq_0;
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

  assign lower_half_0 = lower_half_0_1;
  assign upper_candidates_0 = lower_half_1_1;
  assign upper_candidates_1 = upper_half_0;
  assign lower_half_1 = _zz_lower_half_1;
  assign lower_half_2 = _zz_lower_half_2;
  assign switch_RedundancyMover_l68 = (lower_half_1_1[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68)
      1'b0 : begin
        lower_half_3 = upper_half_1;
      end
      default : begin
        lower_half_3 = {1'b1,10'h000};
      end
    endcase
  end

  assign switch_RedundancyMover_l17_2 = {io_inputSeq_4[10],io_inputSeq_5[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_2)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_2 = io_inputSeq_4;
      end
      default : begin
        lower_half_0_2 = io_inputSeq_5;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_2)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_2 = io_inputSeq_5;
      end
      default : begin
        lower_half_1_2 = io_inputSeq_4;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_3 = {io_inputSeq_6[10],io_inputSeq_7[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_3)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0_2 = io_inputSeq_6;
      end
      default : begin
        upper_half_0_2 = io_inputSeq_7;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_3)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1_2 = io_inputSeq_7;
      end
      default : begin
        upper_half_1_2 = io_inputSeq_6;
      end
    endcase
  end

  assign upper_half_0_1 = lower_half_0_2;
  assign upper_candidates_0_1 = lower_half_1_2;
  assign upper_candidates_1_1 = upper_half_0_2;
  assign upper_half_1_1 = _zz_upper_half_1_1;
  assign upper_half_2 = _zz_upper_half_2;
  assign switch_RedundancyMover_l68_1 = (lower_half_1_2[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68_1)
      1'b0 : begin
        upper_half_3 = upper_half_1_2;
      end
      default : begin
        upper_half_3 = {1'b1,10'h000};
      end
    endcase
  end

  assign upper_candidates_0_2 = lower_half_2;
  assign upper_candidates_1_2 = upper_half_0_1;
  assign upper_candidates_0_3 = lower_half_3;
  assign upper_candidates_1_3 = upper_half_0_1;
  assign upper_candidates_2 = upper_half_1_1;
  assign _zz_io_outputSeq_3 = 1'b1;
  assign _zz_io_outputSeq_4 = 1'b1;
  assign _zz_io_outputSeq_5 = 1'b1;
  assign _zz_switch_RedundancyMover_l68 = 1'b1;
  assign switch_RedundancyMover_l68_2 = ({1'b0,(lower_half_2[10] == _zz_switch_RedundancyMover_l68)} + _zz_switch_RedundancyMover_l68_2);
  always @(*) begin
    case(switch_RedundancyMover_l68_2)
      2'b00 : begin
        _zz_io_outputSeq_6 = upper_half_2;
      end
      2'b01 : begin
        _zz_io_outputSeq_6 = upper_half_3;
      end
      default : begin
        _zz_io_outputSeq_6 = _zz_io_outputSeq_6_1;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_1 = 1'b1;
  assign switch_RedundancyMover_l68_3 = ({1'b0,(lower_half_2[10] == _zz_switch_RedundancyMover_l68_1)} + _zz_switch_RedundancyMover_l68_3);
  always @(*) begin
    case(switch_RedundancyMover_l68_3)
      2'b00 : begin
        _zz_io_outputSeq_7 = upper_half_3;
      end
      default : begin
        _zz_io_outputSeq_7 = _zz_io_outputSeq_6_1;
      end
    endcase
  end

  assign io_outputSeq_0 = lower_half_0;
  assign io_outputSeq_1 = lower_half_1;
  assign io_outputSeq_2 = _zz_io_outputSeq_2;
  assign io_outputSeq_3 = _zz_io_outputSeq_3_1;
  assign io_outputSeq_4 = _zz_io_outputSeq_4_1;
  assign io_outputSeq_5 = _zz_io_outputSeq_5_1;
  assign io_outputSeq_6 = _zz_io_outputSeq_6;
  assign io_outputSeq_7 = _zz_io_outputSeq_7;

endmodule
