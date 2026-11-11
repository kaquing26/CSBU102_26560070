# Listing 3 - swap two scores in memory
.data
scores: .word 40, 55, 70, 85, 100
 
.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # load scores[0] into $t0 (value: 40)
    lw   $t1, 16($s0)     # load scores[4] into $t1 (value: 100)
    sw   $t1, 0($s0)      # store $t1 into scores[0]
    sw   $t0, 16($s0)     # store $t0 into scores[4]
    
    li   $v0, 10
    syscall