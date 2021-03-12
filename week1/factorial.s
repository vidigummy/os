    .data

    .text
main:
    //찾아보니 $a0~ 가 인자다 .
    li $v0, 5
    syscall
    move $a0, $v0
    addi $v0, $zero, 1
    addi $a1, $s2, 1
    jal factorial

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

factorial:
    bgt $a0, 0, recur
    jr $ra

recur:
    addi $sp, $sp, -8

    sw $a0, 4($sp)
    sw $ra, 0($sp)

    addi $a0, $a0, -1

    jal factorial

    lw $t0, 4($sp)

    mul $v0, $v0, $t0

    lw $ra, 0($sp)

    addi $sp,$sp,8

    jr $ra