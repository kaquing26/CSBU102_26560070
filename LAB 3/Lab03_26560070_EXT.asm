# Name:Phùng Gia Vinh 
# Student ID:26560070
# Purpose: Leaf procedure min_max returning both minimum ($v0) and maximum ($v1) of an array.

.data
classA:    .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB:    .word 45, 81, 66, 50, 92, 38, 70, 59
msgMinA:   .asciiz "Class A min: "
msgMaxA:   .asciiz "Class A max: "
msgMinB:   .asciiz "Class B min: "
msgMaxB:   .asciiz "Class B max: "
nl:        .asciiz "\n"

.text
.globl main
main:
    # Class A min & max
    la   $a0, classA
    addi $a1, $zero, 10
    jal  min_max
    add  $s0, $v0, $zero        # save min in $s0
    add  $s1, $v1, $zero        # save max in $s1

    la   $a0, msgMinA
    add  $a1, $s0, $zero
    jal  show

    la   $a0, msgMaxA
    add  $a1, $s1, $zero
    jal  show

    # Class B min & max
    la   $a0, classB
    addi $a1, $zero, 8
    jal  min_max
    add  $s0, $v0, $zero        # save min in $s0
    add  $s1, $v1, $zero        # save max in $s1

    la   $a0, msgMinB
    add  $a1, $s0, $zero
    jal  show

    la   $a0, msgMaxB
    add  $a1, $s1, $zero
    jal  show

    li   $v0, 10
    syscall

# min_max(addr = $a0, n = $a1): returns min in $v0 and max in $v1
min_max:
    lw   $v0, 0($a0)            # min = array[0]
    lw   $v1, 0($a0)            # max = array[0]
    addi $t0, $zero, 1          # i = 1
mm_loop:
    slt  $t1, $t0, $a1          # $t1 = 1 if i < n
    beq  $t1, $zero, mm_end
    sll  $t2, $t0, 2            # $t2 = 4 * i
    add  $t2, $t2, $a0          # $t2 = address of array[i]
    lw   $t3, 0($t2)            # $t3 = array[i]

    slt  $t4, $t3, $v0          # $t4 = 1 if array[i] < min
    beq  $t4, $zero, check_max
    add  $v0, $t3, $zero        # min = array[i]

check_max:
    slt  $t4, $v1, $t3          # $t4 = 1 if max < array[i]
    beq  $t4, $zero, mm_next
    add  $v1, $t3, $zero        # max = array[i]

mm_next:
    addi $t0, $t0, 1            # i = i + 1
    j    mm_loop
mm_end:
    jr   $ra

# show(msg = $a0, value = $a1): prints msg, value and a new line
show:
    li   $v0, 4
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra