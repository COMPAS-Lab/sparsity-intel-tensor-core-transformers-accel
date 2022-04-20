 
//*********************************************************************
//*  module  tensor_core_array_wrapper                                *
//*  Created    :  Mon Mar 21 13:32:24 2022                           *
//*********************************************************************

module  tensor_core_array_wrapper
(
     input                          clrn,                                              // 0: global reset 
     input                          clk,                                               // Clock
     input          [7:0]           start,                                             
     input          [7:0]           iter,                                              
     input          [15:0]          in_buffer_id,                                      
     input          [31:0]          rd_addr,                                           
     input          [31:0]          wr_addr,                                           
     input          [31:0]          load_start,                                        
     input                          hbm_0_ready,                                       // 1: Memory controller is ready for use, 0: Initializing (due to reset)
     output                         start_tcarray_in_0,                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
     output                         select_tcarray_in_0,                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
     input          [255:0]         data_tcarray_in_0,                                 // Data from port tcarray_in_0 of MultiPort cross_bar_0
     output         [31:0]          addr_tcarray_in_0,                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
     input                          almost_empty_tcarray_in_0,                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
     input                          port_error_tcarray_in_0,                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
     output                         start_tcarray_out_0,                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
     output                         select_tcarray_out_0,                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
     output         [255:0]         data_tcarray_out_0,                                // Data to port tcarray_out_0 of MultiPort cross_bar_0
     output         [31:0]          addr_tcarray_out_0,                                // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
     input                          almost_full_tcarray_out_0,                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
     input                          port_error_tcarray_out_0,                          // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
     input                          hbm_1_ready,                                       // 1: Memory controller is ready for use, 0: Initializing (due to reset)
     output                         start_tcarray_in_1,                                // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
     output                         select_tcarray_in_1,                               // Port select (enable) signal. Should be high until ready comes to transfer current dataoutputs data on each port clock
     input          [255:0]         data_tcarray_in_1,                                 // Data from port tcarray_in_1 of MultiPort cross_bar_1
     output         [31:0]          addr_tcarray_in_1,                                 // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
     input                          almost_empty_tcarray_in_1,                         // Port almost_empty flag (goes low when the internal FIFO more than 1/8 full)
     input                          port_error_tcarray_in_1,                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
     output                         start_tcarray_out_1,                               // Port start signal. Assert high for 1 port clk + 1 mem clk to reset the port
     output                         select_tcarray_out_1,                              // Port select (enable) signal. Should be high until ready comes to transfer current dataexpects data on each port clock
     output         [255:0]         data_tcarray_out_1,                                // Data to port tcarray_out_1 of MultiPort cross_bar_1
     output         [31:0]          addr_tcarray_out_1,                                // Port starting address. Apply the new address to this bus when reseting the port (start=VCC)
     input                          almost_full_tcarray_out_1,                         // Port almost_full flag (goes high when the internal FIFO more than 7/8 full)
     input                          port_error_tcarray_out_1                           // Port port_error flag (goes high when an error occur to port (read from empty FIFO or write to full FIFO)
);


     logic start_d1t, start_rising, load_start_d1t, load_start_rising;
     logic [15:0] in_buffer_id_reg;

     logic [8:0] data_valid;
     logic [8:0][319:0] data_in;

     logic [431:0] data_out;
     logic out_valid, out_pop;

     logic select_tcarray_in, start_tcarray_in;
     logic select_tcarray_out, start_tcarray_out;

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               start_d1t <= 0;
               load_start_d1t <= 0;
          end else begin
               start_d1t <= start[0];
               load_start_d1t <= load_start[0];
          end
     end
     assign start_rising = !start_d1t && start[0];
     assign load_start_rising = !load_start_d1t && load_start[0];

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               in_buffer_id_reg <= 'd0;
          end else begin
               if (load_start_rising) 
                    in_buffer_id_reg <= in_buffer_id;
          end
     end

     logic [319:0] data_in_reg;
     logic data_valid_reg;
     
     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               data_in_reg <= 'd0;
               data_valid_reg <= 0;
          end else begin
               data_in_reg <= {data_tcarray_in_1[63:0], data_tcarray_in_0};
               data_valid_reg <= select_tcarray_in;
          end
     end

     always_comb begin
          data_in = 'd0;
          data_valid = 'd0;
          data_in[in_buffer_id] = data_in_reg;
          data_valid[in_buffer_id] = data_valid_reg;
     end

     TensorCoreChainArray tcore_u0 (
          .io_matALoad_0_valid(data_valid[0]),
          .io_matALoad_0_payload(data_in[0]),
          .io_matALoad_1_valid(data_valid[1]),
          .io_matALoad_1_payload(data_in[1]),
          .io_matALoad_2_valid(data_valid[2]),
          .io_matALoad_2_payload(data_in[2]),
          .io_matBLoad_0_0_valid(data_valid[3]),
          .io_matBLoad_0_0_payload(data_in[3]),
          .io_matBLoad_0_1_valid(data_valid[4]),
          .io_matBLoad_0_1_payload(data_in[4]),
          .io_matBLoad_0_2_valid(data_valid[5]),
          .io_matBLoad_0_2_payload(data_in[5]),
          .io_matBLoad_1_0_valid(data_valid[6]),
          .io_matBLoad_1_0_payload(data_in[6]),
          .io_matBLoad_1_1_valid(data_valid[7]),
          .io_matBLoad_1_1_payload(data_in[7]),
          .io_matBLoad_1_2_valid(data_valid[8]),
          .io_matBLoad_1_2_payload(data_in[8]),
          .io_calEn(start_rising),
          .io_computeIters(iter),
          .io_res_valid(out_valid),
          .io_res_ready(out_pop),
          .io_res_payload(data_out),
          .clk(clk),
          .resetn(clrn)
     );
  
     enum int unsigned {S_RD_IDLE, S_RD_WAIT, S_RD_SEND} rd_state, rd_state_next;
     logic [15:0] rd_word_counter;
     logic [15:0] target_rd_words;
     logic [1:0] start_assert_counter;

     always_comb begin
          case (rd_state)
               S_RD_IDLE: begin
                    if (load_start_rising && hbm_0_ready) 
                         rd_state_next = S_RD_WAIT;
               end 

               S_RD_WAIT: begin
                    if (port_error_tcarray_in_0 || port_error_tcarray_in_1)
                         rd_state_next = S_RD_IDLE;
                    else if (almost_empty_tcarray_in_0 == 0 && 
                              almost_empty_tcarray_in_1 == 0)
                         rd_state_next = S_RD_SEND;
                    else
                         rd_state_next = S_RD_WAIT;
               end

               S_RD_SEND: begin
                    if(rd_word_counter == target_rd_words-1)
                         rd_state_next = S_RD_IDLE;
                    else
                         rd_state_next = S_RD_SEND;
               end
               default: rd_state_next = S_RD_IDLE;
          endcase
     end
     
     //word count target lut
     assign target_rd_words = 16'd27;

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               rd_state <= S_RD_IDLE;
          end else begin
               rd_state <= rd_state_next;
          end
     end

     always_ff @( posedge clk or negedge clrn ) begin
          if(!clrn) begin
               rd_word_counter <= 16'd0;
               start_assert_counter <= 2'd0;
               start_tcarray_in <= 0;
               select_tcarray_in <= 0;
          end else begin
               case (rd_state)
                    S_RD_IDLE: begin
                         rd_word_counter <= 'd0;
                         start_assert_counter <= 'd0;
                         start_tcarray_in <= 0;
                         select_tcarray_in <= 0;
                         if (rd_state_next == S_RD_WAIT) begin
                              start_tcarray_in <= 1;
                              start_assert_counter <= start_assert_counter + 2'd1;
                         end
                    end 

                    S_RD_WAIT: begin
                         if(start_assert_counter < 2'd3) begin
                              start_assert_counter <= start_assert_counter + 2'd1;
                         end else begin
                              start_assert_counter <= 2'd0;
                              start_tcarray_in <= 0;
                         end

                         if(rd_state_next == S_RD_SEND)
                              select_tcarray_in <= 1;
                    end

                    S_RD_SEND: begin
                         rd_word_counter <= rd_word_counter + 16'd1;
                         if(rd_state_next == S_RD_IDLE)
                              select_tcarray_in <= 0;
                    end
                    default: begin
                         rd_word_counter <= 16'd0;
                         start_assert_counter <= 2'd0;
                         start_tcarray_in <= 0;
                         select_tcarray_in <= 0;
                    end
               endcase
          end
     end

     //output path
     logic [1:0] wr_init_counter;
     logic start_wr_tran, out_valid_d1t;

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               out_valid_d1t <= 0;
          end else begin
               out_valid_d1t <= out_valid;
          end
     end
     assign start_wr_tran = !out_valid_d1t & out_valid;

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               wr_init_counter <= 0;
          end else begin
               if (start_wr_tran == 1 ||
                    (wr_init_counter > 'd0 && wr_init_counter < 2'd3)) begin
                    wr_init_counter <= wr_init_counter + 2'd1;
               end else if (wr_init_counter == 2'd3 && out_valid == 0) begin
                    wr_init_counter <= 2'd0;
               end
          end  
     end

     always_ff @( posedge clk or negedge clrn ) begin
          if (!clrn) begin
               select_tcarray_out <= 0;
               start_tcarray_out <= 0;
               out_pop <= 0; 
          end else begin
               if (wr_init_counter == 2'd3 && !almost_full_tcarray_out_0 && !almost_full_tcarray_out_1) begin
                    out_pop <= 1;
               end else begin
                    out_pop <= 0;
               end

               start_tcarray_out <= 
                    (wr_init_counter > 1 && wr_init_counter < 3) ? 1 : 0;
               select_tcarray_out <= out_pop & out_valid;
          end
     end
     
     assign  start_tcarray_in_0  = start_tcarray_in;
     assign  select_tcarray_in_0  = select_tcarray_in;
     assign  addr_tcarray_in_0  = rd_addr;
     assign  start_tcarray_out_0  = start_tcarray_out;
     assign  select_tcarray_out_0  = select_tcarray_out;
     assign  addr_tcarray_out_0  = wr_addr;
     assign  start_tcarray_in_1  = start_tcarray_in;
     assign  select_tcarray_in_1  = select_tcarray_in;
     assign  addr_tcarray_in_1  = rd_addr;
     assign  start_tcarray_out_1  = start_tcarray_out;
     assign  select_tcarray_out_1  = select_tcarray_out;
     assign  {data_tcarray_out_1, data_tcarray_out_0} = {80'd0, data_out};
     assign  addr_tcarray_out_1 = wr_addr;  
  
endmodule
