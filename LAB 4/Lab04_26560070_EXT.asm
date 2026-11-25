# Full name:Phùng Gia Vinh
# Student ID: 26560070
# Purpose: Compute the sum 1 + 2 + ... + n recursively using separate stack frames per activation.

.text
.globl main
main:
    li   $v0, 5             # read n (n >= 0)
    syscall
    add  $a0, $v0, $zero
    jal  sum_to             # $v0 = sum_to(n)
    add  $a0, $v0, $zero    # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

# sum_to(n = $a0): returns 1 + 2 + ... + n in $v0
sum_to:
    bne  $a0, $zero, st_rec # n != 0: go to the recursive case
    addi $v0, $zero, 0      # base case: sum_to(0) = 0
    jr   $ra
st_rec:
    addi $sp, $sp, -8       # frame: $ra and n
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)
    addi $a0, $a0, -1
    jal  sum_to             # $v0 = sum_to(n - 1)
    lw   $a0, 0($sp)        # n again
    add  $v0, $v0, $a0      # n + sum_to(n - 1)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra