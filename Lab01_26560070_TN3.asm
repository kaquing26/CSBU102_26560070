# Listing 3 - energy used by a household (fictitious readings, kWh)
.text
.globl main
main:
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640

    # >>> usage1 = reading1 - reading0
    sub  $t0, $s1, $s0       # 1350 - 1200 = 150

    # >>> usage2 = reading2 - reading1
    sub  $t1, $s2, $s1       # 1475 - 1350 = 125

    # >>> usage3 = reading3 - reading2
    sub  $t2, $s3, $s2       # 1640 - 1475 = 165

    # >>> total = usage1 + usage2 + usage3
    add  $t3, $t0, $t1       # 150 + 125 = 275
    add  $t3, $t3, $t2       # 275 + 165 = 440

    li   $v0, 10
    syscall