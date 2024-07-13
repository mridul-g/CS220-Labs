.data
prompt: .asciiz "Enter the number of terms: "
result: .asciiz "\nThe Fibonacci sequence is: "
comma:  .asciiz ", "

.text
.globl main

# Function to calculate Fibonacci sequence
fibonacci:
    # Function prologue
    slti $t4, $a0, 3
    beq $t4, $0, Label
    addi $v0, $0, 1
    jr $ra

Label:
    add $sp, $sp, -12
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    addi $a0, $a0, -1
    jal fibonacci
    add $t0, $v0, $0
    sw $t0, 8($sp)
    addi $a0, $a0, -1
    jal fibonacci
    lw $t0, 8($sp)
    add $v0, $t0, $v0
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 12
    jr $ra


main:
    # Prompt user to enter the number of terms
    ori $v0, $0, 4
    la $a0, prompt
    syscall

    # Read the number of terms from user
    ori $v0, $0,5
    syscall
    or $t3, $0, $v0    # Save the input in $t0

    # Print the result message
    li $v0, 4
    la $a0, result
    syscall

    # Print Fibonacci sequence up to the nth term
    li $t1, 1          # Counter for loop
    li $t2, 1          # Fibonacci term index
loop:
    beq $t1, $t3, end  # Exit loop when counter reaches input value

    # Print Fibonacci term
    move $a0, $t2
    jal fibonacci
    or $a0, $0, $v0
    li $v0, 1
    syscall

    # Print comma
    li $v0, 4
    la $a0, comma
    syscall

    # Update Fibonacci term index
    addi $t2, $t2, 1

    # Update loop counter
    addi $t1, $t1, 1
    j loop

end:
    # Print newline and exit
    move $a0, $t3
    jal fibonacci
    or $a0, $0, $v0
    li $v0, 1
    syscall
    li $v0, 10
    syscall
