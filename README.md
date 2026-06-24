# BFP-DPU Python vs HDL Verification

This script compares the output of the HDL simulation against the Python BFP-DPU model to verify functional correctness.

## File Location

The verification script is located at:

```text
<base_repo_directory>/sim/tb/bfp_mat_gen.py
```

The HDL simulation input and output files should be generated from the BFP-DPU simulation

## Running the Verification

From the `sim/tb` directory, run:

```bash
python3 bfp_mat_gen.py -method unsignedMult
```

This executes a comparison between:

- HDL simulation output (`outFP.txt`)
- Python BFP-DPU model output

and reports any mismatches between the two implementations.

---

## Required Modifications

Before running the verification, open:

```text
<base_repo_directory>/sim/tb/bfp_mat_gen.py
```

### Update Input and Output File Paths

Locate the following file path definitions in `main()`:

```python
file1 = "/var/services/homes/mbove/bfp/bfp.sim/sim_1/behav/xsim/vector1.txt"
file2 = "/var/services/homes/mbove/bfp/bfp.sim/sim_1/behav/xsim/vector2.txt"
outFP_file = "/var/services/homes/mbove/bfp/bfp.sim/sim_1/behav/xsim/outFP.txt"
```

Modify these paths to point to your HDL simulation files.

For example:

```python
file1 = ".../bfp.sim/sim_1/behav/xsim/vector1.txt"
file2 = "<.../bfp.sim/sim_1/behav/xsim/vector2.txt"
outFP_file = "<.../bfp.sim/sim_1/behav/xsim/outFP.txt"
```

### Select the Target BFP Format

In `bfp_mat_gen.py`, locate:

```python
bfp_list = [BFP(BfpType.BFP_32)]
```

This configuration targets **BFP32**.

To verify a different BFP format, modify this line accordingly. For example:

```python
bfp_list = [BFP(BfpType.BFP_16)]
```

would target **BFP16**.

---

## Verification Flow

1. Read the HDL input vectors (`vector1.txt` and `vector2.txt`).
2. Execute the Python BFP-DPU model.
3. Read the HDL-generated output (`outFP.txt`).
4. Compare the HDL results against the Python model results.
5. Report any mismatches and verification statistics.

---

## Notes

- Ensure the HDL simulation has completed before running the comparison.
- Verify that the selected BFP format in `bfp_mat_gen.py` matches the format used by the HDL simulation.
- Input vector dimensions and formatting must match the expectations of both the HDL testbench and Python model.
