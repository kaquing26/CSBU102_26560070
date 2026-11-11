.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"

.text
.globl main
main:
    # --- Read reading0 into $s0 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # --- Read reading1 into $s1 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # --- Read reading2 into $s2 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    # --- Read reading3 into $s3 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # --- Compute usages ---
    sub  $t0, $s1, $s0      # Month 1 = reading1 - reading0
    sub  $t1, $s2, $s1      # Month 2 = reading2 - reading1
    sub  $t2, $s3, $s2      # Month 3 = reading3 - reading2
    sub  $t3, $s3, $s0      # Total = reading3 - reading0

    # --- Print Month 1 ---
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # --- Print Month 2 ---
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # --- Print Month 3 ---
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # --- Print Total ---
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # --- Exit ---
    li   $v0, 10
    syscall