.data
array: .word 63, 9, 85, 66, 71, 8, 38, 42, 35, 89, 13, 20, 100, 75, 35, 68, 16, 91, 76, 56
.text
la $a0, array
addi $a1, $zero, 20
Jal QUICKSORT

li $v0, 10 #syscall 10 (terminate)
syscall

.globl QUICKSORT
QUICKSORT:
  add $t0, $zero, $zero
  subi $t1, $a1, 1
  add $a1, $zero, $t0
  add $a2, $zero, $t1

  subi $sp, $sp, 4
  sw $ra, 0($sp)
  Jal ORDENA
  lw $ra, 0($sp)
  addi $sp, $sp, 4

  add $v0, $zero, $a0
  jr $ra

.globl ORDENA
ORDENA:
  add $t0, $a1, $a2
  sra $t0, $t0, 1 #desloca um para a direita == div 2
  sll $t0, $t0, 2
  add $t0, $t0, $a0
  lw $s0, 0($t0)
  add $s1, $zero, $a1 #i
  add $s2, $zero, $a2 #j

  WHILE_1:
    slt $t0, $s2, $s1
    bne $t0, $zero, EXIT_WHILE_1
    WHILE_2:
      sll $t0, $s1, 2 #desloca dois para a esquerda == mult 4
      add $t0, $t0, $a0
      lw $t0, 0($t0)
      slt $t0, $t0, $s0
      beq $t0, $zero, EXIT_WHILE_2
        slt $t0, $s1, $a2
        beq $t0, $zero, EXIT_WHILE_2
          addi $s1, $s1, 1
    j WHILE_2
    EXIT_WHILE_2:
    WHILE_3:
      sll $t0, $s2, 2
      add $t0, $t0, $a0
      lw $t0, 0($t0)
      slt $t0, $s0, $t0
      beq $t0, $zero, EXIT_WHILE_3
        slt $t0, $a1, $s2
        beq $t0, $zero, EXIT_WHILE_3
          subi $s2, $s2, 1
    j WHILE_3
    EXIT_WHILE_3:
    #IF_1:
    slt $t0, $s2, $s1
    bne $t0, $zero, EXIT_IF_1
      sll $t0, $s1, 2
      add $t0, $t0, $a0
      lw $t1, 0($t0)
      sll $t2, $s2, 2
      add $t2, $t2, $a0
      lw $t3, 0($t2)
      sw $t1, 0($t2)
      sw $t3, 0($t0)
      addi $s1, $s1, 1
      subi $s2, $s2, 1
    EXIT_IF_1:
  j WHILE_1
  EXIT_WHILE_1:
  slt $t0, $a1, $s2
  beq $t0, $zero, EXIT_IF_2
    subi $sp, $sp, 12
    sw $a2, 0($sp)
    sw $s1, 4($sp)
    sw $ra, 8($sp)
    add $a2, $s2, $zero
    Jal ORDENA
    lw $a2, 0($sp)
    lw $s1, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
  EXIT_IF_2:  
  slt $t0, $s1, $a2
  beq $t0, $zero, EXIT_IF_3
    subi $sp, $sp, 4
    sw $ra, 0($sp)
    add $a1, $s1, $zero
    Jal ORDENA
    lw $ra, 0($sp)
    addi $sp, $sp, 4
  EXIT_IF_3:
  add $v0, $zero, $a0
  Jr $ra
