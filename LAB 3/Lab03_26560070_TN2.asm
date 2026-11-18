# Name:Phùng Gia Vinh
# Student ID:26560070
# Purpose: Clamp an input integer x into the range [lo, hi] using a leaf procedure.

.text
.globl main
main:
    li   $v0, 5                 # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero        # argument 1: x
    addi $a1, $zero, 0          # argument 2: lo = 0
    addi $a2, $zero, 100        # argument 3: hi = 100
    jal  clamp
    add  $a0, $v0, $zero        # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

# clamp(x = $a0, lo = $a1, hi = $a2): returns x limited to [lo, hi] in $v0
clamp:
    slt  $t0, $a0, $a1          # $t0 = 1 if x < lo
    bne  $t0, $zero, ret_lo     # if x < lo, return lo
    slt  $t0, $a2, $a0          # $t0 = 1 if hi < x (i.e., x > hi)
    bne  $t0, $zero, ret_hi     # if x > hi, return hi
    add  $v0, $a0, $zero        # otherwise, return x
    jr   $ra
ret_lo:
    add  $v0, $a1, $zero
    jr   $ra
ret_hi:
    add  $v0, $a2, $zero
    jr   $ra