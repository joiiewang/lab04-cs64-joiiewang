# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	input: .asciiz "Enter the next number:\n"

	output: .asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la$a0, input
	syscall

	li $v0, 5
	syscall
	move $t2, $v0
	
	#if t0 <t1, returns one, if not, zero
	slt $t3, $t0, $t1
	beq $t3, $zero, check_two

	#if t0<t2, returns one, if t0>t2, returns zero
	slt $t6, $t0, $t2
	beq $t6, $zero, answer_is_t0

	# t1<t2, 1 // t1>t2, 0
	slt $t7, $t1, $t2
	beq $t7,$zero, answer_is_t2

	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	j exit
	# TODO: Write your code here
check_two:
	#if t2<t0, returns one
	slt $t4, $t2, $t0
	beq $t4, $zero, answer_is_t0
	
	#if t2<t1, returns one, if returns zero, t1<t2	
	slt $t5, $t2, $t1
	beq $t5, $zero, answer_is_t2

	#otherwise, t1 is the answer
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	j exit
answer_is_t2:
	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	j exit
answer_is_t0:
	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	j exit
exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
