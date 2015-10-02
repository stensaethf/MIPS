#
# addition0.asm
# Jeff Ondich, 4 January 2015
#
# Add two numbers. Wheeee!
#

.text
    # Load the numbers to be summed into registers 9 and 10 (also
    # known as registers t1 and t2).
    li   $t1, 5
    li   $t2, 19

    # Add them, leaving the sum in register 8 (a.k.a. register t0).
    add  $t0, $t1, $t2

    # Print the sum.
    move $a0, $t0
    li   $v0, 1
    syscall

    # Exit
    li   $v0, 10
    syscall

