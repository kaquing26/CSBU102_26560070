# Name: Phùng Gia Vinh       Student ID: 26560070
# Purpose: LAB 02, Extension - 3x3 board in memory: X (1) at cell (1,2), O (2) at cell (2,0)
#
# Register plan: $s0 = address of board[0]
#                $s1 = r (row), $s2 = c (column)
#                $t0 = address of the cell, $t1 = the mark to store

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board

    # ---- cell (1,2) = 1 (mark X) ----
    addi $s1, $zero, 1    # r = 1
    addi $s2, $zero, 2    # c = 2
    sll  $t0, $s1, 1      # $t0 = 2r
    add  $t0, $t0, $s1    # $t0 = 3r
    add  $t0, $t0, $s2    # $t0 = 3r + c  (word number)
    sll  $t0, $t0, 2      # $t0 = 4 * (3r + c)  (byte offset)
    add  $t0, $t0, $s0    # $t0 = board + 4 * (3r + c)
    addi $t1, $zero, 1
    sw   $t1, 0($t0)

    # ---- cell (2,0) = 2 (mark O) ----
    addi $s1, $zero, 2    # r = 2
    addi $s2, $zero, 0    # c = 0
    sll  $t0, $s1, 1
    add  $t0, $t0, $s1
    add  $t0, $t0, $s2
    sll  $t0, $t0, 2
    add  $t0, $t0, $s0
    addi $t1, $zero, 2
    sw   $t1, 0($t0)

    li   $v0, 10          # exit
    syscall