import argparse
import os
import json


def simulate_single_test(data_dir: str, head_idx: int, lb_idx: int, with_gui: bool = False):
    # check if the data_dir contains "/" in the end, if not, add it
    if data_dir[-1] != "/":
        data_dir += "/"

    # get the hw_config
    hw_config_path = data_dir + f"hwconfig_h{head_idx}.json"
    hw_config = json.load(open(hw_config_path, "r"))

    
    # setting os env variable to simulate
    os.environ["MAT_A_SIZE"] = str(hw_config["mat a size"][lb_idx])
    os.environ["MAT_B_SIZE"] = str(hw_config["mat b size"])
    os.environ["MAT_B_VEC_SIZE"] = str(hw_config["mat b vec size"])
    os.environ["IDX_LEN"] = str(hw_config["idx_len"][lb_idx])
    os.environ["IHEAD"] = str(head_idx)
    os.environ["ILBLK"] = str(lb_idx)
    os.environ["TC_DATA_DIR"] = data_dir

    if with_gui:
        os.system("vsim -do tensor_core_wrapper_tb_start.do")
    else:
        os.system("vsim -c -do tensor_core_wrapper_tb_start.do")
    

# create a main function
def main():
    # accept arguments from command line, the args include "head_idx", "data_dir"
    # and make all arguments required
    parser = argparse.ArgumentParser()
    parser.add_argument("--head_idx", type=int, required=True, default=-1, dest="head_idx")
    parser.add_argument("--lb_idx", type=int, required=True, default=-1, dest="lb_idx")
    parser.add_argument("--data_dir", type=str, required=True, dest="data_dir")
    parser.add_argument("--with_gui", required=False, default=False, action="store_true", dest="with_gui")
    args = parser.parse_args()

    simulate_single_test(args.data_dir, args.head_idx, args.lb_idx, args.with_gui)


# call the main function
if __name__ == "__main__":
    main()
