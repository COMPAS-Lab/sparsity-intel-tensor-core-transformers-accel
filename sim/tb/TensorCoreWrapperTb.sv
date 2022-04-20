`timescale 1ns/100ps

module TensorCoreWrapperTb;

logic          clrn=0;                                              // 0: global reset 
logic          clk=0;                                               // Clock
logic [7:0]    start;                                             
logic [7:0]    iter;                                             
logic [15:0]   in_buffer_id;                                      
logic [31:0]   rd_addr;                                           
logic [31:0]   wr_addr;                                           
logic [31:0]   load_start;                                        
logic          hbm_0_ready=1;                                     // 1: Memory controller is ready for use, 0: Initializing (due to reset)
logic          start_tcarray_in_0;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic          select_tcarray_in_0;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0]  data_tcarray_in_0;                                 // Data from port tcarray_in_0 of MultiPort cross_bar_0
logic [31:0]   addr_tcarray_in_0;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic          almost_empty_tcarray_in_0;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic          port_error_tcarray_in_0 = 0;                       // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic          hbm_1_ready=1;                                     // 1: Memory controller is ready for use, 0: Initializing (due to reset)
logic          start_tcarray_in_1;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic          select_tcarray_in_1;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0]  data_tcarray_in_1;                                 // Data from port tcarray_in_1 of MultiPort cross_bar_1
logic [31:0]   addr_tcarray_in_1;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic          almost_empty_tcarray_in_1;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic          port_error_tcarray_in_1=0;                         // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic          hbm_2_ready=1;                                     // 1: Memory controller is ready for use, 0: Initializing (due to reset)
logic          start_tcarray_out_0;                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic          select_tcarray_out_0;                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
logic [255:0]  data_tcarray_out_0;                                // Data to port tcarray_out_0 of MultiPort cross_bar_2
logic [31:0]   addr_tcarray_out_0;                                // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic          almost_full_tcarray_out_0;                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
logic          port_error_tcarray_out_0=0;                        // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic          hbm_3_ready=1;                                     // 1: Memory controller is ready for use, 0: Initializing (due to reset)
logic          start_tcarray_out_1;                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic          select_tcarray_out_1;                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
logic [255:0]  data_tcarray_out_1;                                // Data to port tcarray_out_1 of MultiPort tcarray_out_1
logic [31:0]   addr_tcarray_out_1;
logic          almost_full_tcarray_out_1;                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
logic          port_error_tcarray_out_1=0;

tensor_core_array_wrapper dut (.*);

logic [255:0] input_lower [243-1:0];
logic [255:0] input_upper [243-1:0];

integer i, j, rd_ptr;
initial begin
  $readmemh("./tb/onchip_mem_lower_str.mem", input_lower);
  $readmemh("./tb/onchip_mem_upper_str.mem", input_upper);
  start = 0;
  iter = 'd3;
  in_buffer_id = 'd0;
  rd_addr = 'd0; wr_addr = 'd0;
  load_start = 'd0;

  data_tcarray_in_0 = 'd0; data_tcarray_in_1 = 'd0;
  almost_empty_tcarray_in_0 = 1; almost_empty_tcarray_in_1 = 1;
  
  for (i = 0; i < 10; i++) begin
    @(posedge clk);
  end
  #9 clrn = 1;

  for (j=0; j<9; j++) begin
    @(posedge clk);
    #9 load_start = 1;
    @(posedge clk);
    #9 load_start = 0;

    data_tcarray_in_0 = '0;
    data_tcarray_in_1 = '0; 

    for (i = 0; i < 10; i++) begin
      @(posedge clk);
    end
    #9 
    almost_empty_tcarray_in_0 = 0;
    almost_empty_tcarray_in_1 = 0;

    for (rd_ptr = 0; rd_ptr < 27; rd_ptr++) begin
      @(posedge clk);
      #9
      almost_empty_tcarray_in_0 = 1;
      almost_empty_tcarray_in_1 = 1;
      data_tcarray_in_0 = input_lower[rd_ptr+rd_addr/32];
      data_tcarray_in_1 = input_upper[rd_ptr+rd_addr/32];
    end
    
    for (i = 0; i < 3; i++) begin
      @(posedge clk);
    end
    #9
    in_buffer_id = j+1;
    rd_addr = rd_addr + 864;
  end

  for (i = 0; i < 3; i++) begin
    @(posedge clk);
  end
  #9 start = 1;

  for (i = 0; i < 3; i++) begin
    @(posedge clk);
  end
  #9 start = 0;

end

initial begin
  almost_full_tcarray_out_0 = 0; almost_full_tcarray_out_1 = 0;


end


always #5 clk = ! clk ;


endmodule