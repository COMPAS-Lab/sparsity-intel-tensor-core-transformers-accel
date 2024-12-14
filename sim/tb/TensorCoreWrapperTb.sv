`timescale 1ns/100ps

module TensorCoreWrapperTb;

localparam NUM_COL_HBMS = 5;
localparam NUM_ROW_HBMS = 6;

localparam MAT_A_RD_BOUND = 10200;
localparam IDX_RD_BOUND = 2391;

logic         clrn=0;                                            // 0: global reset 
logic         clk=0;                                             // Clock
logic [7:0]   start;                                             
logic [7:0]   iter;                                              
logic [31:0]  rd_addr;                                           
logic [31:0]  wr_addr;                                           
logic [31:0]  load_start;                                        
logic [15:0]  lat_counter;                                       
logic         hbm_0_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_0;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_0;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_0;                                 // Data from port tcarray_in_0 of MultiPort cross_bar_00
logic [31:0]  addr_tcarray_in_0;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_empty_tcarray_in_0;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_0;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_1_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_1;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_1;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_1;                                 // Data from port tcarray_in_1 of MultiPort cross_bar_01
logic [31:0]  addr_tcarray_in_1;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_empty_tcarray_in_1;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_1;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_2_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_2;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_2;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_2;                                 // Data from port tcarray_in_2 of MultiPort cross_bar_02
logic [31:0]  addr_tcarray_in_2;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_empty_tcarray_in_2;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_2;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_3_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_3;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_3;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_3;                                 // Data from port tcarray_in_3 of MultiPort cross_bar_03
logic [31:0]  addr_tcarray_in_3;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_empty_tcarray_in_3;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_3;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_4_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_4;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_4;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_4;                                 // Data from port tcarray_in_4 of MultiPort cross_bar_04
logic [31:0]  addr_tcarray_in_4;                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_empty_tcarray_in_4;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_4;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_5_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_in_5;                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_in_5;                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
logic [255:0] data_tcarray_in_5;                                 // Data from port tcarray_in_5 of MultiPort cross_bar_05
logic [31:0]  addr_tcarray_in_5; 
logic         almost_empty_tcarray_in_5;                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
logic         port_error_tcarray_in_5;                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_6_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_out_0;                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_out_0;                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
logic [255:0] data_tcarray_out_0;                                // Data to port tcarray_out_0 of MultiPort cross_bar_20
logic [31:0]  addr_tcarray_out_0;                                // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_full_tcarray_out_0;                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
logic         port_error_tcarray_out_0;                          // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
logic         hbm_7_ready;                                       // 1: Memory controller is ready for use; 0: Initializing (due to reset)
logic         start_tcarray_out_1;                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
logic         select_tcarray_out_1;                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
logic [255:0] data_tcarray_out_1;                                // Data to port tcarray_out_1 of MultiPort cross_bar_21
logic [31:0]  addr_tcarray_out_1;                                // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
logic         almost_full_tcarray_out_1;                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
logic         port_error_tcarray_out_1;                          // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)

tensor_core_array_wrapper dut (.*);

assign hbm_0_ready = 1;
assign hbm_1_ready = 1;
assign hbm_2_ready = 1;
assign hbm_3_ready = 1;
assign hbm_4_ready = 1;
assign hbm_5_ready = 1;
assign hbm_6_ready = 1;
assign hbm_7_ready = 1;
assign port_error_tcarray_in_0 = 0;
assign port_error_tcarray_in_1 = 0;
assign port_error_tcarray_in_2 = 0;
assign port_error_tcarray_in_3 = 0;
assign port_error_tcarray_in_4 = 0;
assign port_error_tcarray_in_5 = 0;
assign port_error_tcarray_out_0 = 0;
assign port_error_tcarray_out_1 = 0;

logic [511:0] col_hbm_ins [$];
logic [255:0] idx_hbm_ins [$];
logic [255:0] row_hbm_ins [NUM_ROW_HBMS-1:0][$];

integer hbm_col_idx, hbm_row_idx;
string stimu_path_a, stimu_path_b, out_path;

//matrix a and b buffer load
initial begin
  // for (hbm_col_idx = 0; hbm_col_idx < NUM_COL_HBMS; hbm_col_idx++) begin
  //   stimu_path_a = $sformatf("./tb/sparse_matmul_data/onchip/onchip_mat_a_hbm%0d.mem", hbm_col_idx);
  //   $readmemh(stimu_path_a, col_hbm_ins[hbm_col_idx]);
  // end

  stimu_path_a = "./tb/sparse_matmul_data/onchip/onchip_mat_a_hbm.mem";
  $readmemh(stimu_path_a, col_hbm_ins);

  for (hbm_row_idx = 0; hbm_row_idx < NUM_ROW_HBMS; hbm_row_idx++) begin
    stimu_path_b = $sformatf("./tb/sparse_matmul_data/onchip/onchip_mat_b_hbm%0d.mem", hbm_row_idx);
    $readmemh(stimu_path_b, row_hbm_ins[hbm_row_idx]);
  end 

  $readmemh("./tb/sparse_matmul_data/onchip/onchip_idx_hbm.mem", idx_hbm_ins);

  #61 clrn = 1'b1;

end

integer i, j, rd_ptr;
initial begin
  start = '0;
  // rowBuffWrBound is the length of each mat b vector
  // e.g., seq len = 4355, rowBuffWrBound = 4480/20 = 224
  iter = 8'd224;

  rd_addr = 'd0; wr_addr = 'd0;
  load_start = 'd0;
  
  repeat (10) begin @(posedge clk); end
  #1 clrn = 1;
  repeat (10) begin @(posedge clk); end
  start[1] = 1;
  repeat (10) begin @(posedge clk); end
  start[1] = 0;

  repeat (10) begin @(posedge clk); end

  // load mat b
  /*
  for (j=0; j<NUM_ROW_HBMS; j++) begin
    if (j == 5) begin
      rd_addr = 'd4032;
    end else begin
      rd_addr = 'd4928;
    end
    load_start = j;

    repeat (10) begin @(posedge clk); end
    
    @(posedge clk);
    #1 start[0] = 1;
    @(posedge clk);
    #1 start[0] = 0;

    wait(start_tcarray_in_0);
    repeat (20) begin @(posedge clk); end
    #1
    almost_empty_tcarray_in_0 = 0;
    @(posedge clk);

    for (rd_ptr=0; rd_ptr < rd_addr; rd_ptr++) begin
      #1
      data_tcarray_in_0 = {'0, row_hbm_ins[j][rd_ptr]};
      wait(select_tcarray_in_0);
      @(posedge clk);
    end 

    repeat (20) begin @(posedge clk); end
    #1
    almost_empty_tcarray_in_0 = 1;

  end
  */

  // start idx removal
  load_start = 'd6;
  rd_addr = IDX_RD_BOUND;

  repeat (10) begin @(posedge clk); end
  
  @(posedge clk);
  #1 start[0] = 1;
  @(posedge clk);
  #1 start[0] = 0;
  
  wait(start_tcarray_in_0);
  repeat (20) begin @(posedge clk); end
  #1
  almost_empty_tcarray_in_0 = 0;
  @(posedge clk);

  for (rd_ptr=0; rd_ptr < rd_addr; rd_ptr++) begin
    #1
    data_tcarray_in_0 = {'0, idx_hbm_ins[rd_ptr]};
    wait(select_tcarray_in_0);
    @(posedge clk);
  end 

  repeat (20) begin @(posedge clk); end
  #1
  almost_empty_tcarray_in_0 = 1;
end

integer k, col_rd_ptr_0, col_rd_ptr_1, col_rd_ptr_2;

initial begin
  wr_addr = MAT_A_RD_BOUND;
  start[2] = 0;
  almost_empty_tcarray_in_1 = 0;
  almost_empty_tcarray_in_2 = 0;
  almost_empty_tcarray_in_3 = 0;
  almost_empty_tcarray_in_4 = 0;
  almost_empty_tcarray_in_5 = 0;

  wait(load_start == 6 && start[0]);
  @(posedge clk);
  wait(select_tcarray_in_0);

  repeat (20) begin @(posedge clk); end
  #1 start[2] = 1;
  @(posedge clk);
  #1 start[2] = 0;
  @(posedge clk);
end

// load mat A
initial begin
  wait(start_tcarray_in_1 && start_tcarray_in_2);
  @(posedge clk);

  for(col_rd_ptr_0=0; col_rd_ptr_0<wr_addr; col_rd_ptr_0++) begin
    #1
    {data_tcarray_in_2, data_tcarray_in_1} = col_hbm_ins[col_rd_ptr_0];
    wait(select_tcarray_in_1 && select_tcarray_in_2);
    @(posedge clk);
  end
end

// initial begin
//   wait(start_tcarray_in_1);
//   @(posedge clk);

//   for(col_rd_ptr_1=0; col_rd_ptr_1<wr_addr; col_rd_ptr_1++) begin
//     #1
//     data_tcarray_in_3 = col_hbm_ins[2][col_rd_ptr_1];
//     data_tcarray_in_4 = col_hbm_ins[3][col_rd_ptr_1];
//     wait(select_tcarray_in_3 & select_tcarray_in_4);
//     @(posedge clk);
//   end
// end

// initial begin
//   wait(start_tcarray_in_1);
//   @(posedge clk);

//   for(col_rd_ptr_2=0; col_rd_ptr_2<wr_addr; col_rd_ptr_2++) begin
//     #1
//     data_tcarray_in_5 = col_hbm_ins[4][col_rd_ptr_2];
//     wait(select_tcarray_in_5);
//     @(posedge clk);
//   end
// end

assign almost_full_tcarray_out_0 = 0;
assign almost_full_tcarray_out_1 = 0;

always #5 clk = ! clk ;

// performance count
function automatic real calculate_bandwidth(
    input int num_cycles,       // Number of clock cycles
    input real freq,            // Clock frequency in MHz
    input real data_transfer    // Data transferred in bytes
);
    real time_period;           // Time for one clock cycle in seconds
    real total_time;            // Total time for the transfer in seconds
    real bandwidth;             // Calculated bandwidth in bytes per second

    // Calculate the time for one clock cycle (1 / frequency in Hz)
    time_period = 1.0 / (freq * 1e6); // freq * 1e6 converts MHz to Hz

    // Calculate the total time for the given cycles
    total_time = num_cycles * time_period;

    // Calculate the bandwidth
    bandwidth = (data_transfer / total_time) / 1e9;

    return bandwidth;
endfunction

real mata_in_sum;
int running_lat;
real mata_in_req_bd;
real matb_out_sum;
real matb_out_req_bd;
initial begin
  wait(dut.softClrnArea_tcArray.io_calEn);

  @(posedge clk);
  wait(dut.softClrnArea_tcArray.colCtrlFsm_stateReg == 'd2);

  
  @(posedge clk);
  wait(dut.softClrnArea_tcArray.colCtrlFsm_stateReg == 'd1 && 
        dut.softClrnArea_tcArray.rowCtrlFsm_stateReg == 'd1);

  repeat (100) begin @(posedge clk); end

  running_lat = int'(lat_counter);
  mata_in_sum = real'(dut.softClrnArea_tcArray.debug_sp_incounter_c0_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c1_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c2_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c3_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c4_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c5_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c6_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c7_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c8_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c9_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c10_value + 
                      dut.softClrnArea_tcArray.debug_sp_incounter_c11_value) * (88 + 12) / 8;

  mata_in_req_bd = calculate_bandwidth(running_lat, 300.0, mata_in_sum);
  $display("Mat A input bandwidth: %0.2f GB/s", mata_in_req_bd);

  matb_out_sum = real'(dut.softClrnArea_tcArray.debug_out_counter_value) * 6 * 12 * (3 * 24 + 12) / 8;
  matb_out_req_bd = calculate_bandwidth(running_lat, 300.0, matb_out_sum);
  $display("Output bandwidth: %0.2f GB/s", matb_out_req_bd);

  $finish();
end

endmodule