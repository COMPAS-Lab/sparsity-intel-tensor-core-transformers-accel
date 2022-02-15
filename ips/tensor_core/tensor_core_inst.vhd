	component tensor_core is
		port (
			clk                    : in  std_logic                     := 'X';             -- clk
			acc_en                 : in  std_logic                     := 'X';             -- acc_en
			zero_en                : in  std_logic                     := 'X';             -- zero_en
			feed_sel               : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- feed_sel
			load_bb_one            : in  std_logic                     := 'X';             -- load_bb_one
			load_bb_two            : in  std_logic                     := 'X';             -- load_bb_two
			load_buf_sel           : in  std_logic                     := 'X';             -- load_buf_sel
			data_in_1              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_2              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_3              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_4              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_5              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_6              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_7              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_8              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_9              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			data_in_10             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			side_in_1              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			side_in_2              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_in
			shared_exponent_data   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- shared_exponent
			cascade_weight_in      : in  std_logic_vector(87 downto 0) := (others => 'X'); -- cascade_weight_in
			cascade_weight_out     : out std_logic_vector(87 downto 0);                    -- cascade_weight_out
			cascade_data_in_col_1  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			cascade_data_out_col_1 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			cascade_data_in_col_2  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			cascade_data_out_col_2 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			cascade_data_in_col_3  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			cascade_data_out_col_3 : out std_logic_vector(31 downto 0);                    -- cascade_data_out
			bf24_col_1             : out std_logic_vector(23 downto 0);                    -- result_l
			bf24_col_2             : out std_logic_vector(23 downto 0);                    -- result_l,result_h
			bf24_col_3             : out std_logic_vector(23 downto 0)                     -- result_h
		);
	end component tensor_core;

	u0 : component tensor_core
		port map (
			clk                    => CONNECTED_TO_clk,                    --                    clk.clk
			acc_en                 => CONNECTED_TO_acc_en,                 --                 acc_en.acc_en
			zero_en                => CONNECTED_TO_zero_en,                --                zero_en.zero_en
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
			side_in_1              => CONNECTED_TO_side_in_1,              --              side_in_1.data_in
			side_in_2              => CONNECTED_TO_side_in_2,              --              side_in_2.data_in
			shared_exponent_data   => CONNECTED_TO_shared_exponent_data,   --   shared_exponent_data.shared_exponent
			cascade_weight_in      => CONNECTED_TO_cascade_weight_in,      --      cascade_weight_in.cascade_weight_in
			cascade_weight_out     => CONNECTED_TO_cascade_weight_out,     --     cascade_weight_out.cascade_weight_out
			cascade_data_in_col_1  => CONNECTED_TO_cascade_data_in_col_1,  --  cascade_data_in_col_1.cascade_data_in
			cascade_data_out_col_1 => CONNECTED_TO_cascade_data_out_col_1, -- cascade_data_out_col_1.cascade_data_out
			cascade_data_in_col_2  => CONNECTED_TO_cascade_data_in_col_2,  --  cascade_data_in_col_2.cascade_data_in
			cascade_data_out_col_2 => CONNECTED_TO_cascade_data_out_col_2, -- cascade_data_out_col_2.cascade_data_out
			cascade_data_in_col_3  => CONNECTED_TO_cascade_data_in_col_3,  --  cascade_data_in_col_3.cascade_data_in
			cascade_data_out_col_3 => CONNECTED_TO_cascade_data_out_col_3, -- cascade_data_out_col_3.cascade_data_out
			bf24_col_1             => CONNECTED_TO_bf24_col_1,             --             bf24_col_1.result_l
			bf24_col_2             => CONNECTED_TO_bf24_col_2,             --             bf24_col_2.result_l,result_h
			bf24_col_3             => CONNECTED_TO_bf24_col_3              --             bf24_col_3.result_h
		);

