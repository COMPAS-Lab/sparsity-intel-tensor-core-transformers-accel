	component tensor_core_accu is
		port (
			clk                   : in  std_logic                     := 'X';             -- clk
			clr0                  : in  std_logic                     := 'X';             -- clr
			acc_en                : in  std_logic                     := 'X';             -- acc_en
			zero_en               : in  std_logic                     := 'X';             -- zero_en
			bf24_a1               : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data_in
			cascade_data_in_col_1 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			bf24_a2               : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data_in
			cascade_data_in_col_2 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			bf24_a3               : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data_in
			cascade_data_in_col_3 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- cascade_data_in
			bf24_col_1            : out std_logic_vector(23 downto 0);                    -- result_l
			bf24_col_2            : out std_logic_vector(23 downto 0);                    -- result_l,result_h
			bf24_col_3            : out std_logic_vector(23 downto 0)                     -- result_h
		);
	end component tensor_core_accu;

	u0 : component tensor_core_accu
		port map (
			clk                   => CONNECTED_TO_clk,                   --                   clk.clk
			clr0                  => CONNECTED_TO_clr0,                  --                  clr0.clr
			acc_en                => CONNECTED_TO_acc_en,                --                acc_en.acc_en
			zero_en               => CONNECTED_TO_zero_en,               --               zero_en.zero_en
			bf24_a1               => CONNECTED_TO_bf24_a1,               --               bf24_a1.data_in
			cascade_data_in_col_1 => CONNECTED_TO_cascade_data_in_col_1, -- cascade_data_in_col_1.cascade_data_in
			bf24_a2               => CONNECTED_TO_bf24_a2,               --               bf24_a2.data_in
			cascade_data_in_col_2 => CONNECTED_TO_cascade_data_in_col_2, -- cascade_data_in_col_2.cascade_data_in
			bf24_a3               => CONNECTED_TO_bf24_a3,               --               bf24_a3.data_in
			cascade_data_in_col_3 => CONNECTED_TO_cascade_data_in_col_3, -- cascade_data_in_col_3.cascade_data_in
			bf24_col_1            => CONNECTED_TO_bf24_col_1,            --            bf24_col_1.result_l
			bf24_col_2            => CONNECTED_TO_bf24_col_2,            --            bf24_col_2.result_l,result_h
			bf24_col_3            => CONNECTED_TO_bf24_col_3             --            bf24_col_3.result_h
		);

