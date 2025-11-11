🧠 JK Flip-Flop Design and Verification (SystemVerilog / Verilog)
📘 Overview

This project demonstrates the design and verification of a JK Flip-Flop using Verilog HDL. The JK Flip-Flop is a fundamental sequential logic element used in digital systems for state storage and timing-based control. The project includes both the Design Under Test (DUT) and a self-contained testbench, with complete simulation and waveform analysis.

⚙️ Functional Description

The JK Flip-Flop operates based on clock edges and an asynchronous reset signal. Its behavior is summarized below:

J	K	Next Q (on clk edge)	Description
0	0	No change	Hold current state
0	1	0	Reset
1	0	1	Set
1	1	Toggle	Inverts current state

Asynchronous Reset:
When the reset signal is high, the output Q immediately resets to 0, regardless of the clock.

🧩 Design Details

Inputs: J, K, clk, reset

Output: Q

Sensitivity List: always @(posedge clk or posedge reset)

Implements asynchronous reset and standard JK logic behavior.

🧪 Testbench Features

Self-contained (no input/output ports)

Declares reg signals for inputs and wire for the output

Instantiates the DUT

Includes clock generation block

Applies multiple test scenarios to verify all JK input combinations

Uses $monitor / $display for real-time signal observation

🧭 Simulation Workflow

Compile both DUT and testbench in an HDL simulator (e.g., ModelSim, Vivado, or Xilinx ISE)

Run simulation to observe flip-flop behavior

View waveform using the simulation viewer

Verify behavior for all input combinations:

J=0, K=0 → Hold

J=0, K=1 → Reset

J=1, K=0 → Set

J=1, K=1 → Toggle

Verify asynchronous reset

🛠️ Debugging and Analysis

Checked timing of state transitions

Validated correct toggling and reset responses

Fixed any race or sensitivity issues

Confirmed waveform matches expected logical behavior

📊 Results and Documentation

Simulation results and waveform screenshots included

Documented all test scenarios, expected outputs, and observed results

Notes on issues resolved and timing corrections
