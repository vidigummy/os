    .data

    .text
main:
    //찾아보니 $a0~ 가 인자다 .
    li $v0, 5
    syscall
    move $a0, $v0
    addi $a1, $s2, 1
    jal factorial

factorial:
    bgt $a0, 0, recur
    jr $ra

recur:
    addi $sp, $sp, -8

    sw $a0, 4($sp)
    //밑바닥에 a0가져온 거 집어넣기
    sw $ra, 0($sp)