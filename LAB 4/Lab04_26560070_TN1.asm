# Name: Phùng Gia Vinh
# Student ID:26560070
# Purpose: Multiply a quiz score by 4 using nested calls while saving $ra on the stack.

.data
msg:    .asciiz "Score out of 100: "

.text
.globl main
main:
    addi $a0, $zero, 18     # quiz score out of 25
    jal  times4             # $v0 = times4(18)
    add  $s0, $v0, $zero    # keep the result
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $s0, $zero
    syscall
    li   $v0, 10
    syscall
times4:
    addi $sp, $sp, -4       
    sw   $ra, 0($sp)        
    jal  twice              
    add  $a0, $v0, $zero
    jal  twice             
    lw   $ra, 0($sp)        
    addi $sp, $sp, 4        
    jr   $ra

twice:
    add  $v0, $a0, $a0
    jr   $ra