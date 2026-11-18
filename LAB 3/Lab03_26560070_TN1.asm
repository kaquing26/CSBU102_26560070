# Name:Phùng Gia Vinh 
# Student ID:26560070
# Purpose: Demonstrate calling two leaf procedures (stars and sep) using jal and jr $ra.

.data
title:    .asciiz "SCORE REPORT\n"
endMsg:   .asciiz "END\n"
line:     .asciiz "----------\n"
starLine: .asciiz "**********\n"

.text
.globl main
main:
    jal  stars              # print **********
    li   $v0, 4
    la   $a0, title         # print SCORE REPORT
    syscall
    jal  sep                # print ----------
    li   $v0, 4
    la   $a0, endMsg        # print END
    syscall   
    jal  stars              # print **********
    li   $v0, 10            # exit
    syscall
# sep(): prints a dashed separator line
sep:
    li   $v0, 4
    la   $a0, line
    syscall
    jr   $ra                # return to caller
# stars(): prints a star separator line
stars:
    li   $v0, 4
    la   $a0, starLine
    syscall
    jr   $ra                # return to caller