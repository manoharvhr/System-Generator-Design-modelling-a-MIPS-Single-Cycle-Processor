# ECTE432 - Project 1

This repository consists of a System Generator Design modelling a MIPS Single-Cycle Processor. Testing of this processor is done using an Assembly program (Program.asm). The program calculates the multiplication of registers R8 and R9, through accumulation. At every stage the value of the loop is stored into a new memory location and then brought back into R10. The final answer is in both R10 and M[0x1000001C].

# Design Files

#### Instruction Memory: 
1) InstructionMemory.vhd: Consists of the VHDL program modelling the Instruction Memory.
2) InstructionMemory_config.m: Configuration file to use as a BlackBox.
3) MyInstructionMemory.slx: System Generator Model which tests the implementation.
#### ALU:
1) MyALU.slx: Consists of the System Generator model used as the ALU in this project. Within this file, testing has also been included here.
#### Register File:
1) regfile.vhd: VHDL program provided by the Lab Notes. Used as it is.
2) regfile_config.m: Configuration file to use as a BlackBox.
3) MyRegFile.slx: System Generator Model which tests the implementation.
#### Data Memory:
1) DataMemory.vhd: VHDL program mimicking Data Memory. Addressable space is aligned with the simulation of the program. Space is addressable at byte-level
2) DataMemory_config.m: Configuration file to use as a BlackBox.
3) MyDataMemory.slx: Testing model which writes and reads values to all memory spaces to ensure functionality.
#### Control Unit + ALU Control:
1) ControlUnit.vhd: VHDL program which sends out the control signals based on the OPCODE. Note that whenever the OPCODE changes, new set of control signals are generated.
2) ALUControl.vhd: VHDL program which, based from the signals provided by the Control Unit, selects the correct mathematical operation that must be performed.
3) ControlUnit_config.m: Configuration file to use as a BlackBox.
4) ALUControl_config.m: Configuration file to use as a BlackBox.
5) MyControl.slx: For dummy values of the Program Counter (PC), actual Instruction Memory is used to test both, the Control Unit and the ALU Control. Includes a tested mechanism for bit-slicing of the 32-bit instruction.
## MIPS:
1) The MIPS.slx file will contain the final design which is not yet complete.