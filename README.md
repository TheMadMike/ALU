# Simple 2-operand ALU

This project documents the beginning of my journey with FPGAs and digital hardware design. I'm aiming to create a fully functional 2-operand ALU with bitwise (XOR, OR, AND) and arithmetic (+, -, *, /) operations on integer values coded in natural binary code and 2's complement.

## Input signals encoding

* clk - clock input

* operation\[3:0\] - type of operation to be performed

| operation\[3:0\] | description |
|:----------------:|-------------|
| 0000 | xor |
| 0001 | or |
| 0010 | and |
| 0011 | add |
| 0100 | subtract |
| 0101 | multiply (natural binary) |
| 0110 | multiply (2's complement) |
| 0111 | divide (natural binary) |
| 1000 | divide (2's complement) |
| 1xxx | reserved for future use |

* op_a\[N:0\] - the first operand

* op_b\[N:0\] - the second operand

* cin - carry/borrow input

## Output signals encoding

* result\[N:0\] - result of the selected operation

* cout - carry/borrow output


## ⚙️ Behavioral simulation

### Dependencies

- GNU Make

- GHDL

- Preferably a Linux machine :)

### Running the simulation

1. Clone this repository

2. Open terminal inside the cloned repo's directory

3. Run one of the following:

* To analyze and simulate every unit of the ALU:

```
make
```

* To analyze and simulate a specific unit:

```
make <name of the unit>
```


example:


```
make full_adder
```

## 🚀 Synthesis and fitting

Synthesis and fitting onto actual hardware is not yet available for this project.
