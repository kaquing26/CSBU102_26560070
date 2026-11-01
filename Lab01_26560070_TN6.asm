

.data
prompt1: .asciiz "Enter previous reading (kWh): "
prompt2: .asciiz "Enter current reading (kWh): "
label:   .asciiz "Usage (kWh): "
newline: .asciiz "\n"

.text
.globl main
main:
    # --- read previous reading into $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5              # service 5: read integer
    syscall
    add  $s0, $v0, $zero

    # >>> read current reading into $s1
    li   $v0, 4
    la   $a0, prompt2
    syscall
    li   $v0, 5              # service 5: read integer
    syscall
    add  $s1, $v0, $zero

    # >>> usage = current - previous, into $t0
    sub  $t0, $s1, $s0

    # >>> print label, usage, and newline
    li   $v0, 4
    la   $a0, label
    syscall

    li   $v0, 1
    add  $a0, $t0, $zero
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall