# Listing 4 - translating statements
.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    # >>> instructions for x1, x2, x3 and x4
    
    # x1 = y + z + w  -> vao $t0
    add $t5, $s0, $s1
    add $t0, $t5, $s2

    # x2 = (y + z) - (w + 5) -> vao $t1
    add $t5, $s0, $s1
    addi $t1, $s2, 5
    sub $t1, $t5, $t1

    # x3 = y  (copy) -> vao $t2
    add $t2, $s0, $zero

    # x4 = z - y -> vao $t3
    sub $t3, $s1, $s0

    li   $v0, 10
    syscall