# Mult






.data
f1: .word -10
f2: .word -10

.text

main:
	la $a0, f1
	lw $a0, 0($a0)
	la $a1, f2
	lw $a1, 0($a1)
	
	andi $s0, $a0, 31
	andi $s1, $a1, 31
	
	abs $a0, $a0
	abs $a1, $a1
	
	jal mult 
	
	# check signs
	beq $s0, $s1, jump
	sub $v0, $v0, $zero
	
	
	#movin the product to a0 and printing 
jump:	add $a0, $zero, $v0
	li $v0, 1
	syscall
	
	#exit
	li $v0, 10
	syscall
	
	#mult 
mult: 	li $t0, 0
loop:	andi $t1, $a1, 1	
	beqz $a1, end
	beqz $t1, shift
	add $t0, $t0, $a0
shift:	sll $a0, $a0, 1
	srl $a1, $a1, 1
	b loop
end:    add $v0, $zero, $t0
	jr $ra



	

 
