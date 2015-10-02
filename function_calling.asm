# function_calling.asm
# A simple script for calling functions in mips.
# Frederik Roenn Stensaeth
# 01.18.2015

# Stack frame layout:
# 0($sp) -- parameter
# 4($sp) -- return address
# 8($sp) -- local variable
# 12($sp) -- return values

.data

n: .word 16

.text

# A simple main program to call fib(n) for an n stored in the .data section.
main:
	# Load n into $a0 and address of fib into $a1
	la $a0, n
	lw $a0, 0($a0)
	la $a1, fib # 0x0040002c
	jal call

	# Print fib(n)
	add $a0, $zero, $v0
 	li $v0, 1
 	syscall

        #Exit
 	li $v0, 10
 	syscall

fib:	bge $a0, 2, fib_else # if less than 2, then return
       	addi $v0, $v0, 1 # add return value to total
       	sw $v0, 12($sp)
	jal return # tear down stak frame
fib_else:
	lw $a0, 0($sp) # load n from stack frame and subtract 1
	subi $a0, $a0, 1
	jal call # fib(n - 1)
	
	# $v0 now contains the return value
	
	lw $a0, 0($sp) # load n from stack frame and subtract 2
	subi $a0, $a0, 2
	jal call # fib(n - 2)
	
	lw $t0, 12($sp)
       	add $v0, $v0, $t0 # add return value to total
       	sw $v0, 12($sp)
	jal return # tear down stack frame

# Sets up the stack frame of a function and then pass control to the function. 
call:
      	subu $sp, $sp, 16 # add new a new frame to the stack
      	sw $ra, 4($sp) # store return address in the stack frame
      	sw $a0, 0($sp) # store parameter in the stack frame
      	sw $zero, 12($sp) # make sure the return value is zero
      	sw $zero, 8($sp) # make sure local variable is zero
      	jr $a1 # jump to fib

# Tears down the function's stack frame.
return:
       	lw $ra, 4($sp) # load stored return address
       	lw $v0, 12($sp)
       	addu $sp, $sp, 16
	jr $ra # jump to return address stored







