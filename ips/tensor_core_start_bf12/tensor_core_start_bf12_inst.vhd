	component tensor_core_start_bf12 is
		port (
			clk                    : in  std_logic                     := 'X';             -- clk
			clr0                   : in  std_logic                     := 'X';             -- clr
			clr1                   : in  std_logic                     := 'X';             -- clr
			feed_sel               : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- feed_sel
			load_bb_one            : in  std_logic                     := 'X';             -- load_bb_one
			load_bb_two            : in  std_logic                     := 'X';             -- load_bb_two
			load_buf_sel           : in  std_logic                     := 'X';             -- load_buf_sel
			data_in_1              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_2              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_3              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_4              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_5              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_6              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_7              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_8              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_9              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_10             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_11             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_12             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_13             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_14             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_15             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_16             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_17             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_18             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_19             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			data_in_20             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			side_in_1              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			side_in_2              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			side_in_3              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			side_in_4              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_in
			shared_exponent_data   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- shared_exponent
			cascade_weight_in      : in  std_logic_vector(87 downto 0) := (others => 'X'); -- cascade_weight_in
			cascade_weight_out     : out std_logic_vector(87 downto 0);                    -- cascade_weight_out
			cascade_data_out_col_1 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			cascade_data_out_col_2 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			cascade_data_out_col_3 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			bf24_col_1             : out std_logic_vector(23 downto 0);                    -- result_l
			bf24_col_2             : out std_logic_vector(23 downto 0);                    -- result_l,result_h
			bf24_col_3             : out std_logic_vector(23 downto 0)                     -- result_h
		);
	end component tensor_core_start_bf12;

	u0 : component tensor_core_start_bf12
		port map (
			clk                    => CONNECTED_TO_clk,                    --                    clk.clk
			clr0                   => CONNECTED_TO_clr0,                   --                   clr0.clr
			clr1                   => CONNECTED_TO_clr1,                   --                   clr1.clr
			feed_sel               => CONNECTED_TO_feed_sel,               --               feed_sel.feed_sel
			load_bb_one            => CONNECTED_TO_load_bb_one,            --            load_bb_one.load_bb_one
			load_bb_two            => CONNECTED_TO_load_bb_two,            --            load_bb_two.load_bb_two
			load_buf_sel           => CONNECTED_TO_load_buf_sel,           --           load_buf_sel.load_buf_sel
			data_in_1              => CONNECTED_TO_data_in_1,              --              data_in_1.data_in
			data_in_2              => CONNECTED_TO_data_in_2,              --              data_in_2.data_in
			data_in_3              => CONNECTED_TO_data_in_3,              --              data_in_3.data_in
			data_in_4              => CONNECTED_TO_data_in_4,              --              data_in_4.data_in
			data_in_5              => CONNECTED_TO_data_in_5,              --              data_in_5.data_in
			data_in_6              => CONNECTED_TO_data_in_6,              --              data_in_6.data_in
			data_in_7              => CONNECTED_TO_data_in_7,              --              data_in_7.data_in
			data_in_8              => CONNECTED_TO_data_in_8,              --              data_in_8.data_in
			data_in_9              => CONNECTED_TO_data_in_9,              --              data_in_9.data_in
			data_in_10             => CONNECTED_TO_data_in_10,             --             data_in_10.data_in
			data_in_11             => CONNECTED_TO_data_in_11,             --             data_in_11.data_in
			data_in_12             => CONNECTED_TO_data_in_12,             --             data_in_12.data_in
			data_in_13             => CONNECTED_TO_data_in_13,             --             data_in_13.data_in
			data_in_14             => CONNECTED_TO_data_in_14,             --             data_in_14.data_in
			data_in_15             => CONNECTED_TO_data_in_15,             --             data_in_15.data_in
			data_in_16             => CONNECTED_TO_data_in_16,             --             data_in_16.data_in
			data_in_17             => CONNECTED_TO_data_in_17,             --             data_in_17.data_in
			data_in_18             => CONNECTED_TO_data_in_18,             --             data_in_18.data_in
			data_in_19             => CONNECTED_TO_data_in_19,             --             data_in_19.data_in
			data_in_20             => CONNECTED_TO_data_in_20,             --             data_in_20.data_in
			side_in_1              => CONNECTED_TO_side_in_1,              --              side_in_1.data_in
			side_in_2              => CONNECTED_TO_side_in_2,              --              side_in_2.data_in
			side_in_3              => CONNECTED_TO_side_in_3,              --              side_in_3.data_in
			side_in_4              => CONNECTED_TO_side_in_4,              --              side_in_4.data_in
			shared_exponent_data   => CONNECTED_TO_shared_exponent_data,   --   shared_exponent_data.shared_exponent
			cascade_weight_in      => CONNECTED_TO_cascade_weight_in,      --      cascade_weight_in.cascade_weight_in
			cascade_weight_out     => CONNECTED_TO_cascade_weight_out,     --     cascade_weight_out.cascade_weight_out
			cascade_data_out_col_1 => CONNECTED_TO_cascade_data_out_col_1, -- cascade_data_out_col_1.cascade_data_out
			cascade_data_out_col_2 => CONNECTED_TO_cascade_data_out_col_2, -- cascade_data_out_col_2.cascade_data_out
			cascade_data_out_col_3 => CONNECTED_TO_cascade_data_out_col_3, -- cascade_data_out_col_3.cascade_data_out
			bf24_col_1             => CONNECTED_TO_bf24_col_1,             --             bf24_col_1.result_l
			bf24_col_2             => CONNECTED_TO_bf24_col_2,             --             bf24_col_2.result_l,result_h
			bf24_col_3             => CONNECTED_TO_bf24_col_3              --             bf24_col_3.result_h
		);

