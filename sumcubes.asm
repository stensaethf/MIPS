# sumcubes.asm
# Frederik Roenn Stensaeth
# A program for computing the sum of the cubes from 0 to n. 
# Example: if n = 2, then 1^3 + 2^3 = 9

.data

n: .word 4

.text

main:
	# Load n into $a0
	la $a0, n
	lw $a0, 0($a0)
	
	jal sumcubes
	
	# Print the result
	add $a0, $zero, $v0
 	li $v0, 1
 	syscall

        # Exit
 	li $v0, 10
 	syscall
 
 # Sumcubes subroutine. Computes the sum of the cubes up to and including n.
 sumcubes:
 loop:	
 	# Compute $a0 * $a0 * $a0.
 	mult $a0, $a0
 	mflo $t0
 	mult $a0, $t0
 	mflo $t0
 	
 	# Add product to result and subtract one from n.
 	add $v0, $v0, $t0
 	subi $a0, $a0, 1
 	# Loop if $a0 is greater than 0.
 	bgtz $a0, loop
 	
 	jr $ra
 	
 	
 	
 	
