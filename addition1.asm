# addition1.asm
# Jeff Ondich, 4 January 2015
#
# Same as addition0.asm, but load the integers to be added from
# memory in the .data section of the program.

      .data
a:    .word  6
b:    .word  17

      .text
      # Load a's value into register t1
      la   $t3, a
      lw   $t1, 0($t3)

      # Load b's value into register t2
      la   $t3, b
      lw   $t2, 0($t3)

      # Compute the sum and store it in register t0
      add  $t0, $t1, $t2

      # Print the sum.
      move $a0, $t0
      li   $v0, 1
      syscall

      # Exit
      li   $v0, 10
      syscall

