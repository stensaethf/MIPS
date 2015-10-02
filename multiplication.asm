# Multiplication.asm
# Frederik Stensaeth and Sabastian Mugazambi.

.data

f1: .word -9#1073741824

f2: .word -9#-8

.text
# Main
main:
 	# Load factors.
	la $a3, f1
 	lw $a3, 0($a3)
 	la $a1, f2
 	lw $a1, 0($a1)
 
	# Check sign of factors.
	slt $s0, $a3, $zero
	slt $s1, $a1, $zero
 
 	abs $a3, $a3
 	abs $a1, $a1

 	jal mult

 	# Add proper sign to product.
 	beq $s0, $s1, jump
 	beqz $v0, negate
 	sub $v0, $zero, $v0
 
 check: beqz $v1, negate2
 	sub $v1, $zero, $v1
 	b jump
 
 negate: not $v0, $v0
 	 b check
 
 negate2: not $v1, $v1
 

 #Move the product to a0 and print.
jump:  	add $a0, $zero, $v0
 	li $v0, 34
 	syscall
 
 	add $a0, $zero, $v1
 	li $v0, 34
 	syscall

 	#Exit
 	li $v0, 10
 	syscall


# Multiplication subroutine
mult:  	li $t1, 0
       	li $t0, 0
# Loop that adds the multiplicand to the product w/ shifts.
loop:  	andi $t2, $a1, 1  
	# If bottom is zero go to <end>
 	beqz $a1, end
	# If LSB of a1 is zero go to <addZ>
	beqz $t2, shift
	
 	add $t1, $t1, $a3
 	add $t0, $t0, $a2

# Shift subroutine that shifts multiplicand to the left and multiplier to the right.
shift:  sll $a2, $a2, 1
	slt $t6, $a3, $zero

	sll $a3, $a3, 1
	add $a2, $a2, $t6
	
 	srl $a1, $a1, 1

 	b loop
# Return answer.
end: 	add $v0, $zero, $t0
     	add $v1, $zero, $t1

     	jr $ra

 

 

 

 

 

  

  
