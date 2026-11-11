 Name: Phùng Gia Vinh       Student ID: 26560070
# Purpose: LAB 02, Experiment 1 - read and write words in memory (Listing 1 + Listing 2)
#
# Register plan: $t0 = base address / loaded values, $t1,$t2,$t3 = temporaries,
#                $s0 = address of scores[0], $s1 = address of scores[2]

.data
varB:   .word 25
varC:   .word 17
varA:   .word 0
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    # ---- Part 1: varA = varB + varC (all three variables are in memory) ----
    la   $t0, varB        # $t0 = address of varB
    lw   $t1, 0($t0)      # $t1 = varB
    lw   $t2, 4($t0)      # $t2 = varC
    add  $t3, $t1, $t2    # $t3 = varB + varC
    sw   $t3, 8($t0)      # varA = $t3

    # ---- Part 2: addresses and offsets ----
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # (1) scores[0]
    lw   $t1, 4($s0)      # (2) scores[1]
    lw   $t2, 16($s0)     # (3) scores[4]
    addi $s1, $s0, 8      # (4) $s1 = address of scores[2]
    lw   $t3, 0($s1)      # (5) scores[2]
    lw   $t4, -4($s1)     # (6) scores[1]

    li   $v0, 10          # exit
    syscall