.data
float_var: .float 0.0
arrayA: .space 60
arrayB: .space 60
msg1: .asciiz "Input array size: "
msgA: .asciiz "Input elements of array A:\n"
msgB: .asciiz "Input elements of array B:\n"

msg: .asciiz "Dot-Product: "
endmsg: .asciiz "\n"
    
    .text
    .globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    or $v1, $v0, $0
    or $t0, $0, $v1
    li $v0, 4
    la $a0, msgA
    syscall
    la $t1, arrayA
    la $t2, arrayB
loopA: li $v0, 6
      syscall
      swc1 $f0, 0($t1)
      addi $t1, $t1, 4
      addi $t0, $t0, -1
      bne $t0, $0, loopA

      add $t0, $0, $v1
      la $t1, arrayA

      li $v0, 4
      la $a0, msgB
      syscall

loopB: 
      
      li $v0, 6
      syscall
      swc1 $f0, 0($t2)
      addi $t2, $t2, 4
      addi $t0, $t0, -1
      bne $t0, $0, loopB

      add $t0, $0, $v1
      la $t2, arrayB
      mtc1 $0, $f3
      
loop1: 
      lwc1 $f1, 0($t1)
      lwc1 $f2, 0($t2)

      mul.s $f4, $f1, $f2
      add.s $f3, $f3, $f4
      
      addi $t1, $t1, 4
      addi $t2, $t2, 4

      addi $t0, $t0, -1
      bne $t0, $0, loop1

      li $v0, 4
      la $a0, msg
      syscall
      li $v0, 2
      mov.s $f12, $f3
      syscall
      li $v0, 4
      la $a0, endmsg
      syscall

      jr $ra