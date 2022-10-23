all: alu

alu: full_adder full_subtractor rca rbs
	ghdl -a ./rtl/alu.vhdl
	ghdl -a ./rtl/alu_tb.vhdl
	ghdl -e alu_tb
	./alu_tb --vcd=alu.vcd

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

full_subtractor:
	ghdl -a ./rtl/subtractor/full_subtractor.vhdl
	ghdl -a ./rtl/subtractor/full_subtractor_tb.vhdl
	ghdl -e full_subtractor_tb
	./full_subtractor_tb --vcd=full_subtractor.vcd

rbs: full_subtractor
	ghdl -a ./rtl/subtractor/rbs.vhdl
	ghdl -a ./rtl/subtractor/rbs_tb.vhdl
	ghdl -e rbs_tb
	./rbs_tb --vcd=rbs.vcd

clean:
	rm *.o *_tb *.vcd *.cf