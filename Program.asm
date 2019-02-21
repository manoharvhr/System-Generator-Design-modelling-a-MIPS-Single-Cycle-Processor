## Program for ECTE432 Laboratory Project
.text
.globl main
main:
addi $t0, $zero, 5 # store 5 as our first number
addi $t1, $zero, 7 # store 7 as our second number
add $t2, $zero, $zero # the answer spot is cleared
lui $t3, 0x1000 # memory data top two bytes
addi $t4, $zero, 1 # save temp value 1
add $t5, $zero, $zero # loop flag
sw $t2, 0 ($t3) # store answer to memory
loop:
lw $t2, 0 ($t3) # load the current answer
and $t5, $t2, $t3 # no purpose - just a pipeline hazard
or $t5, $t2, $t3 # no purpose - just a pipeline hazard
add $t2, $t2, $t0 # add first number to it
sub $t1, $t1, $t4 # decrement second number
addi $t3, $t3, 4 # next memory data location
sw $t2, 0 ($t3) # store answer to memory
slt $t5, $t1, $t4 # set the loop flag if second number < 1
beq $t5, $zero, loop # branch back to loop while flag == 0
## End of program