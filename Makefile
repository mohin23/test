# Define variables
VERILOG_SOURCES = xor_test.v
YOSYS_SCRIPT = script.ys
SYNTH_OUTPUT = xor_test_synth.v
JSON_OUTPUT = xor_test.json
VVP_OUTPUT = xor_test.vvp
VCD_OUTPUT = xor_test.vcd

# Default target
all: sim view yosys

# Simulation target
sim: $(VERILOG_SOURCES)
	@echo "Compiling for simulation using Icarus Verilog..."
	iverilog -o $(VVP_OUTPUT) $(VERILOG_SOURCES)
	@echo "Running simulation..."
	vvp $(VVP_OUTPUT)

# View waveform target
view: $(VCD_OUTPUT)
	@echo "Opening waveform in GTKWave..."
	gtkwave $(VCD_OUTPUT)

# Synthesis target (Yosys will be the last)
yosys: $(VERILOG_SOURCES)
	@echo "Running synthesis using Yosys..."
	yosys -p "read_verilog $(VERILOG_SOURCES); synth -top testbench; write_verilog $(SYNTH_OUTPUT); write_json $(JSON_OUTPUT)"

# Clean up generated files
clean:
	rm -f $(SYNTH_OUTPUT) $(JSON_OUTPUT) $(VVP_OUTPUT) $(VCD_OUTPUT)

.PHONY: all sim view yosys clean


