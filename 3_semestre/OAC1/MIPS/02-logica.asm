# Escreva um programa em Assembly MIPS que le um numero inteiro e imprime se é par ou ímpar
.data
	ordem: .asciiz "Numero inteiro: "
	par: .asciiz "Par."
	impar: .asciiz "Impar."
	
.text
	# imprimir para usuario
	li $v0, 4
	la $a0, ordem
	syscall

	li $v0, 5	# leitura de inteiro
	syscall
	move $t0, $v0
	
	# JEITO 1
	# operando AND compara os bits um a um. É uma "soma" dos bits.
	# Se compararmos t0 com o numero 00000001, ele apenas voltara este mesmo se o numero for
	# impar (termina com 1).
	#li $t1, 1
	#and $s0, $t0, $t1
	# t2 tera nossa resposta
	
	# JEITO 2	
	# OUUU podemos pegar pelo resto da divisao por 2
	li $t1, 2
	div $t0, $t1
	
	mfhi $t3	# registrador hi tera parte inteira.
	
	beq $t3, $zero, imprimePar	# if valor for 0, é par, pule para rotulo imprimePar
	
	# ELSE: se for par, aqui não roda.
	li $v0, 4	# setar syscall para impressao de string
	la $a0, impar
	syscall
	# imprimePar vai ser executado mesmo assim. Precisamos encerrar o programa
	li $v0, 10	# encerra forçadamente
	syscall
	
	# rótulo, "função" para caso for par
	imprimePar:
		# imprimir para usuario
		li $v0, 4	# setar syscall para impressao de string
		la $a0, par
		syscall