# Name: Phùng Gia Vinh       Student ID: 26560070
# Purpose: LAB 02, Experiment 2 - swap two elements, index in a register, own data + total
#
# Register plan: $s0 = address of the array (element 0)
#                $s1 = index (i or k)
#                $s3 = total of the five scores
#                $t0..$t2 = temporaries

.data
scores: .word 40, 55, 70, 85, 100     # used by Step 2.1 and Step 2.2
mine:   .word 40, 55, 70, 85, 100     # used by Step 2.3 (own data)
msg:    .asciiz "scores[i] = "
tot:    .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main
main:
    # ---- Step 2.1: swap scores[0] and scores[4] (result 100,55,70,85,40) ----
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # $t0 = scores[0]
    lw   $t1, 16($s0)     # $t1 = scores[4]
    sw   $t1, 0($s0)      # scores[0] = old scores[4]
    sw   $t0, 16($s0)     # scores[4] = old scores[0]

    # ---- Step 2.2: print scores[i], with i in a register ----
    addi $s1, $zero, 3    # i = 3
    sll  $t1, $s1, 2      # $t1 = 4 * i
    add  $t1, $t1, $s0    # $t1 = address of scores[i]
    lw   $t2, 0($t1)      # $t2 = scores[i]
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # ---- Step 2.3: own data. k AND V below are for D = 8 (ID ends in 8) ----

    la   $s0, mine        # $s0 = address of mine[0]
    addi $s1, $zero, 3    # k = 3 (D = 8)
    addi $t0, $zero, 91   # V = 91 (D = 8)
    # (to see the original total 350, put a '#' in front of the next 3 lines)
    sll  $t1, $s1, 2      # $t1 = 4 * k
    add  $t1, $t1, $s0    # $t1 = address of mine[k]
    sw   $t0, 0($t1)      # mine[k] = V

    lw   $t0, 0($s0)      # add the five scores, constant offsets
    add  $s3, $zero, $t0
    lw   $t0, 4($s0)
    add  $s3, $s3, $t0
    lw   $t0, 8($s0)
    add  $s3, $s3, $t0
    lw   $t0, 12($s0)
    add  $s3, $s3, $t0
    lw   $t0, 16($s0)
    add  $s3, $s3, $t0

    li   $v0, 4           # print "Total: "
    la   $a0, tot
    syscall
    li   $v0, 1           # print the total
    add  $a0, $s3, $zero
    syscall
    li   $v0, 4           # new line
    la   $a0, nl
    syscall

    li   $v0, 10          # exit
    syscall