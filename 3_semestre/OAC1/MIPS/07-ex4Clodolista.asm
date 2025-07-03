.data
	VET: .word 23 43 55 9 7 21 76 12 45 10
	TAM: .word 10
	PAR: .word
	IMPAR: .word
.text
	# contar quantos elementos pares e impares contem o vetor
	#sp: pilha de $ra s
	
	li $s3, 0	# indice VET
	li $s1, 0	# indice IMPAR
	li $s2, 0 	# indice PAR
	
	
	LOOP:
		# Checar se é impar
		la $a1, VET($s3)	# argumento de Paridade
		jal Paridade
		addi $s3, $s3, 1	# indice VET / LOOP
		j LOOP
		
		# condição do loop
		blt $s3, 10, Continuar
		# se é igual a 10, encerrar programa
		li $v0, 10
		syscall
		
			Continuar:
				# se indice é menor q 10 (1), continuar
				j LOOP
	
	
	Paridade:
		li $t1, 1	# t1 = 1
		and $t3, $a1, $t1	  # se é impar, t3 é 1, se nao, é 0
		# se é impar
		beq $t3, $t1, EhImpar
		
		# EhPar:
		sw $a1, PAR($s2)
		addi $s2, $s2, 1	# indice PAR
		jr $ra	# volta ao jal
		 
			EhImpar:
				sw $a1, IMPAR($s1)
				addi $s1, $s1, 1	# indice IMPAR
				jr $ra	# volta ao jal
				 
		
		
		