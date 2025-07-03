# Escreva um programa em Assembly MIPS que le um numero inteiro e imprime se é par ou ímpar
.data
	ordem: .asciiz "Numero inteiro: "
	par: .asciiz "Par."
	impar: .asciiz "Impar."
	
.text
	# imprimir para usuario
	la $a0, ordem
	jal printString
	
	# leitura de inteiro
	li $v0, 5	
	syscall
	move $t0, $v0
	
	# JEITO 1
	# operando AND compara os bits um a um. É uma "soma" dos bits.
	# Se compararmos t0 com o numero 00000001, ele apenas voltara este mesmo se o numero for
	# impar (termina com 1).
	li $t1, 1
	and $t3, $t0, $t1
	# t3 tera nossa resposta
	
	# if valor for 0, é par, pule para rotulo imprimePar
	beq $t3, $zero, imprimePar
	
	# ELSE: se for par, aqui não roda.
	imprimeImpar:
		la $a0, impar
		jal printString
		j encerrar
		
	imprimePar:
		la $a0, par
		jal printString
		j encerrar
	
	# funçao para imprimir com argumento $a0
	printString:
		li $v0, 4	# setar syscall para impressao de string
		syscall
		jr $ra	# VOLTA PARA JAL
	
	encerrar:
		li $v0 10
		syscall
		
