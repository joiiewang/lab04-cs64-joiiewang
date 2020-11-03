# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data
	input: .asciiz "Enter a number:\n"
	output1: .asciiz "Factorial of "
	output2: .asciiz " is:\n"
	newline: .asciiz "\n"
# TODO: Write your initializations here

#Text Area (i.e. instructions)
.text
main:
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	# TODO: Write your code here

	li $t1, 2
	li $t2, 1
loop: 
	blt $t0, $t1, exit
	mult $t2, $t1
	mflo $t2
	addi $t1, 1

	j loop
	

exit:
	li $v0, 4
	la $a0, output1
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, output2
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
