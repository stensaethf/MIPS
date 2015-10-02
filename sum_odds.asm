# sum_odds.asm
# Jeff Ondich, 31 March 2014
#
# Compute the sum of all the odd integers between
# 1 and the value stored at "top"

      .data
top:  .word  10

      .text
      # Initialize the sum (register t0) to 0
      li   $t0, 0

      # Load top's value into register t1
      la   $t1, top
      lw   $t1, 0($t1)

      # Initialize the counter (t2) to 1
      li   $t2, 1

      # Loop up to top's value, adding odd integers as you go
loop: add  $t0, $t0, $t2
      addi $t2, $t2, 2
      sub  $t3, $t2, $t1
      blez $t3, loop

      # Print the sum.
      add  $a0, $zero, $t0
      li   $v0, 1
      syscall

      # Exit
      li   $v0, 10
      syscall

