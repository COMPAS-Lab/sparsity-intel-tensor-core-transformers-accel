`timescale 1ns/100ps

module RedundancyRemoverTb ();

localparam DWIDTH = 11;
localparam ITER = 6;
localparam INWORDS = 4;

logic io_upperIns_valid = '0;
logic [DWIDTH-1 : 0] io_upperIns_payload_0 = '0;
logic [DWIDTH-1 : 0] io_upperIns_payload_1 = '0;
logic [DWIDTH-1 : 0] io_upperIns_payload_2 = '0;
logic [DWIDTH-1 : 0] io_upperIns_payload_3 = '0;
logic io_lowerIns_valid = '0;
logic [DWIDTH-1 : 0] io_lowerIns_payload_0 = '0;
logic [DWIDTH-1 : 0] io_lowerIns_payload_1 = '0;
logic [DWIDTH-1 : 0] io_lowerIns_payload_2 = '0;
logic [DWIDTH-1 : 0] io_lowerIns_payload_3 = '0;
logic [DWIDTH-1 : 0] io_outs_0;
logic [DWIDTH-1 : 0] io_outs_1;
logic [DWIDTH-1 : 0] io_outs_2;
logic [DWIDTH-1 : 0] io_outs_3;
logic [DWIDTH-1 : 0] io_outs_4;
logic [DWIDTH-1 : 0] io_outs_5;
logic [DWIDTH-1 : 0] io_outs_6;
logic [DWIDTH-1 : 0] io_outs_7;
logic io_lastGrpIn='0;
logic io_sortIterFinished;
logic io_outs_valid;
logic clk=1;
logic resetn=0;

RedundancyRemover dut_RedundancyRemover(
  .io_upperIns_valid     (io_upperIns_valid     ),
  .io_upperIns_payload_0 (io_upperIns_payload_0 ),
  .io_upperIns_payload_1 (io_upperIns_payload_1 ),
  .io_upperIns_payload_2 (io_upperIns_payload_2 ),
  .io_upperIns_payload_3 (io_upperIns_payload_3 ),
  .io_lowerIns_valid     (io_lowerIns_valid     ),
  .io_lowerIns_payload_0 (io_lowerIns_payload_0 ),
  .io_lowerIns_payload_1 (io_lowerIns_payload_1 ),
  .io_lowerIns_payload_2 (io_lowerIns_payload_2 ),
  .io_lowerIns_payload_3 (io_lowerIns_payload_3 ),
  .io_outs_payload_0     (io_outs_0             ),
  .io_outs_payload_1     (io_outs_1             ),
  .io_outs_payload_2     (io_outs_2             ),
  .io_outs_payload_3     (io_outs_3             ),
  .io_outs_payload_4     (io_outs_4             ),
  .io_outs_payload_5     (io_outs_5             ),
  .io_outs_payload_6     (io_outs_6             ),
  .io_outs_payload_7     (io_outs_7             ),
  .io_outs_valid         (io_outs_valid         ),
  .io_lastGrpIn          (io_lastGrpIn          ),
  .io_sortIterFinished   (io_sortIterFinished   ),
  .clk                   (clk                   ),
  .resetn                (resetn                )
);

logic [INWORDS*DWIDTH-1:0] upperInDat [ITER-1:0];
logic [INWORDS*DWIDTH-1:0] lowerInDat [ITER-1:0];

integer i;

initial begin
  $readmemb("./tb/sorted_data_upper.bin", upperInDat);
  $readmemb("./tb/sorted_data_lower.bin", lowerInDat);
  #41 resetn = 1'b1;

  @(posedge clk);
  for (i = 0; i < ITER; i++) begin
    @(posedge clk);
    #1
    {io_upperIns_payload_3, io_upperIns_payload_2,
    io_upperIns_payload_1, io_upperIns_payload_0} = upperInDat[i];
    io_upperIns_valid = 1'b1;

    {io_lowerIns_payload_3, io_lowerIns_payload_2,
    io_lowerIns_payload_1, io_lowerIns_payload_0} = lowerInDat[i];
    io_lowerIns_valid = 1'b1;

    if (i == (ITER-1)) begin
      io_lastGrpIn = '1;
    end
  end

  @(posedge clk);
  #1
  io_lastGrpIn = '0;
  io_upperIns_valid = 1'b0;
  {io_lowerIns_payload_0, io_lowerIns_payload_1,
  io_lowerIns_payload_2, io_lowerIns_payload_3} = '0;
  io_lowerIns_valid = 1'b0;
  {io_upperIns_payload_0, io_upperIns_payload_1, 
  io_upperIns_payload_2, io_upperIns_payload_3} = '0;
end

always #5 clk = ! clk ;

endmodule