all: full_adder

full_adder:
	ghdl -a ./rtl/adder/full_adder.vhdl
	ghdl -a ./rtl/adder/full_adder_tb.vhdl
	ghdl -e full_adder_tb
	./full_adder_tb --vcd=full_adder.vcd