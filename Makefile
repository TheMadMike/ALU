all: full_adder rca

full_adder:
	ghdl -a ./rtl/adder/full_adder.vhdl
	ghdl -a ./rtl/adder/full_adder_tb.vhdl
	ghdl -e full_adder_tb
	./full_adder_tb --vcd=full_adder.vcd

rca: full_adder
	ghdl -a ./rtl/adder/rca.vhdl
	ghdl -a ./rtl/adder/rca_tb.vhdl
	ghdl -e rca_tb
	./rca_tb --vcd=rca.vcd

clean:
	rm *.o *_tb *.vcd *.cf