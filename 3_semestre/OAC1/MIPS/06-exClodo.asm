.text
main:  
li $a0, 5  
jal Funcao  
move $s0, $v0  
li $v0, 10  
syscall  
Funcao:  
sub $sp,$sp,4  
sw $ra, 0($sp)  
li $t1, 1  
slti $t0, $a0, 2  
beq $t0, $zero, Calcula  
add $v0, $zero, $zero  
beq $a0, $zero, Sai  
add $v0, $t1, $zero  
Sai:  
lw $ra, 0($sp)  
add $sp, $sp, 4  
jr $ra  
Calcula:  
add $a1, $a0, $zero  
Loop:  
sub $a1, $a1, $t1  
jal Multiplica  
add $a0, $v0, $zero  
bne $a1, $t1, Loop  
j Sai  
Multiplica:  
mult $a0, $a1  
mflo $v0  
jr $ra  
