.data
	meuArray:
		.align 2	# inteiros
		.space 16	# para 4 palavras de 4 bits
.text
	move $t0, $zero		# indice do array
	move $t1, $zero		# valor
	li $t2, 16	# tamanho n do array
	la $t4, meuArray
	
	loop:
		beq $t0, $t2, saidoLoop	# condição de saida
		sw $t1, meuArray($t0)
		addi $t0, $t0, 4	# incrementa 1 palavra no indice
		addi $t1, $t1, 1	# incrementa valor por 1
		j loop
	
	saidoLoop:
		move $t0, $zero	# indice
		li $t2, 4	# TAMANHO EM PALABRAS
		imprimeArray:
			beq $t0, $t2, saiDaImpressao	# condição de saida
			# imprimir inteiro
			lw $a0, 0($t4)
			li $v0, 1
			syscall
			
			addi $t0, $t0, 1 
			addi $t4, $t4, 4
			j imprimeArray
		
		saiDaImpressao:
			li $v0 10
			syscall
