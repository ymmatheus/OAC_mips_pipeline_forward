.data
a: .word 10
b: .word 20
c: .word 0
.text

la $t0, a
la $t1, b
lw $t0, 0($t0)
lw $t1, 0($t1)

add $t2, $t0, $t1

bnez $t2, somamaiscinco
j fim

somamaiscinco:
addi $t2, $t2, 5

fim:
la $t1, c
sw $t2, 0($t1)