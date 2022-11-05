all: alu

alu: full_adder full_subtractor adder rbs
	ghdl -a ./rtl/alu.vhdl
	ghdl -a ./rtl/alu_tb.vhdl
	ghdl -e alu_tb
	./alu_tb --vcd=alu.vcd --stop-time=600ns

full_adder:
	ghdl -a ./rtl/adder/full_adder.vhdl
	ghdl -a ./rtl/adder/full_adder_tb.vhdl
	ghdl -e full_adder_tb
	./full_adder_tb --vcd=full_adder.vcd

adder: full_adder
	ghdl -a ./rtl/adder/adder.vhdl
	ghdl -a ./rtl/adder/adder_tb.vhdl
	ghdl -e adder_tb
	./adder_tb --vcd=adder_tb.vcd

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