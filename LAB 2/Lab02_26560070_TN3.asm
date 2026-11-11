# Name: Phùng Gia Vinh       Student ID: 26560070 
# Purpose: LAB 02, Experiment 3 - bytes, byte order, lb/lbu, capital letters in a string
#
# Register plan: $s0 = address of the data being read
#                $t0..$t4 = loaded bytes / words / temporaries

.data
word1: .asciiz "Hi!"
w:     .word 0x41424344
b1:    .byte 0xF0
str1:  .asciiz "nguyen van an"       # change .asciiz to .ascii for Table 15, then change back
tag:   .asciiz " [end]"
nl:    .asciiz "\n"

.text
.globl main
main:
    # ---- Step 3.1: the bytes of "Hi!" ----
    la   $s0, word1
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    li   $v0, 11          # print one character (the byte in $t1)
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # ---- Step 3.2: one word, four bytes ----
    la   $s0, w
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    lw   $t4, 0($s0)

    # ---- Step 3.3: lb and lbu ----
    la   $s0, b1
    lb   $t0, 0($s0)      # sign-extended
    lbu  $t1, 0($s0)      # zero-extended

    # ---- Step 3.4: capital letters at offsets 0, 7 and 11 ----
    la   $s0, str1
    lb   $t0, 0($s0)      # offset 0: 'n'
    addi $t0, $t0, -32    # minus 32 -> 'N'
    sb   $t0, 0($s0)
    lb   $t0, 7($s0)      # offset 7: 'v'
    addi $t0, $t0, -32    # -> 'V'
    sb   $t0, 7($s0)
    lb   $t0, 11($s0)     # offset 11: 'a'
    addi $t0, $t0, -32    # -> 'A'
    sb   $t0, 11($s0)

    li   $v0, 4           # print the string that starts at $a0
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10          # exit
    syscall