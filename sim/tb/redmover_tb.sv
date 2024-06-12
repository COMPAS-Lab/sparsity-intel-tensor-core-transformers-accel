`timescale 1ns/1ps

module redmover_tb ();

logic [8:0] io_inputSeq_0;
logic [8:0] io_inputSeq_1;
logic [8:0] io_inputSeq_2;
logic [8:0] io_inputSeq_3;
logic [8:0] io_outputSeq_0;
logic [8:0] io_outputSeq_1;
logic [8:0] io_outputSeq_2;
logic [8:0] io_outputSeq_3;

logic clk=1;
logic resetn=0;

RedundancyMover u_RedundancyMover(
    .io_inputSeq_0  (io_inputSeq_0  ),
    .io_inputSeq_1  (io_inputSeq_1  ),
    .io_inputSeq_2  (io_inputSeq_2  ),
    .io_inputSeq_3  (io_inputSeq_3  ),
    .io_outputSeq_0 (io_outputSeq_0 ),
    .io_outputSeq_1 (io_outputSeq_1 ),
    .io_outputSeq_2 (io_outputSeq_2 ),
    .io_outputSeq_3 (io_outputSeq_3 ),
    .clk            (clk            ),
    .resetn         (resetn         )
);

initial begin
    {io_inputSeq_0, io_inputSeq_1, io_inputSeq_2, io_inputSeq_3} = '1;
    #41 resetn = 1'b1;

    @(posedge clk)
    #1
    {io_inputSeq_0, io_inputSeq_1, io_inputSeq_2, io_inputSeq_3} = {9'd5, 9'd3, 9'd2, 9'd0};

    @(posedge clk)
    #1
    {io_inputSeq_0, io_inputSeq_1, io_inputSeq_2, io_inputSeq_3} = {9'd12, 9'h1ff, 9'd1, 9'd0};

    @(posedge clk)
    #1
    {io_inputSeq_0, io_inputSeq_1, io_inputSeq_2, io_inputSeq_3} = {9'h1ff, 9'h1ff, 9'd1, 9'd0};

end

always #5 clk = ! clk;

endmodule