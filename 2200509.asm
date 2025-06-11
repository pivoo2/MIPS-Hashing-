.data


.text 


main:            lw $t1,0($a1)
                 lb $t2,0($t1)
                 addi $a0,$t2,-48
                 jal hash_fn
                 add $s0,$v0,$0
                 lui $t0, 0x1001
                 sw $v0,0($t0)  
                 addi $v0,$0,10
                 syscall	  
hash_fn:         addi $sp,$sp,-8
                 sw $a0,4($sp)
                 sw $ra,0($sp)
                 srl $t0,$a0,24
                 xori $t0,$t0,0x09
                 add $a0,$t0,$0
                 jal calculate
                 lw $a0,4($sp)
                 sll $t0,$a0,8
                 srl $t0,$t0,24
                 xor $a0,$t0,$v0
                 jal calculate
                 lw $a0,4($sp)
                 sll $t0,$a0,16
                 srl $t0,$t0,24
                 xor $a0,$t0,$v0
                 jal calculate
                 lw $a0,4($sp)
                 sll $t0,$a0,24
                 srl $t0,$t0,24
                 xor $a0,$t0,$v0
                 jal calculate
                 lw $ra,0($sp)
                 addi $sp,$sp,8
                 jr $ra         
 calculate:      addi $sp,$sp,-12
                 sw $a0,0($sp)
                 sw $ra,4($sp)
                 sw $s1,8($sp)
                 jal square
                 add $a0,$v0,$0
                 jal multiply
                 add $s1,$v0,$0
                 lw $a0,0($sp)
                 add $s1,$s1,$a0
                 addi $v0,$s1,-217
                 andi $v0,$v0,0xFF
                 lw $ra,4($sp)
                 lw $s1,8($sp)
                 addi $sp,$sp,12
                 jr $ra
square:          add $t0,$a0,$0
                 add $t1,$0,$0
while:           beq $t0,$0,EXIT
                 add $t1,$a0,$t1
                 addi $t0,$t0,-1
                 j while
EXIT:            add $v0,$t1,$0
                 jr $ra              
multiply:        addi $t0,$0,99
                 add $t1,$0,$0
whilee:          beq $t0,$0,EXITE
                 add $t1,$a0,$t1
                 addi $t0,$t0,-1
                 j whilee
EXITE:           add $v0,$t1,$0
                 jr $ra
                 
                 
                 
         
        

