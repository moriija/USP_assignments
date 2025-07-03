.data # area para dados na memoria principal (RAM)
	# variavel, tipo, valor
	msg: .asciiz "Hello World\n"
	# palavra de dados => tamanho do tipo INT
	idade: .word 56
	
.text
# area para instruçoes
	
	li $v0, 4	#imprimir uma string
	la $a0, msg	# indicar o endereço em que está a mensagem
	syscall		# syscall é um comando de FAÇA, especificado no $v0. Nesse caso, imprimira em $a0
	
	li $v0, 1	#imprimir inteiro
	lw $a0, idade	# load word em vez de "adress"
	syscall
	
	# add -> somar dois registradores
	# addi -> somar um registrador com um inteiro, imediatamente
	
	li $t0, 75	# load inteiro 75 para o registrador t0
	li $t1, 25
	add $s0, $t0, $t1	# s0 = 75 + 25 = 100
	addi $s1, $s0, 36	# podemos somar com s0
	
	# multiplicação
	li $t2, 12
	addi $t3, $zero, 10	# mesma coisa que li
	mul $s0, $t2, $t3
	
	# multiplicação em potência de 2
	# mover binario 1 casa para esquerda (shift left) = multiplicar por 2
	# mover n casas para esquerda = multiplicar por 2^n
	li $t4, 5
	sll $s3, $t4, 3		# t4 tera o valor de t5 vezes 2^3
	
	# divisão de inteiros
	div $t0, $t1	# divide t0 por t1
			# a parte inteira vai para lo o resto vai para hi

	mflo $s0	# move o conteudo de lo para s0 (move from lo)
	mfhi $s1	# move o conteudo de hi para s1	 (move from hi)
	
	# divisão em potencia de 2: shift right = dividir por 2
	# o problema é que ele só pega a parte inteira
	srl $s2, $t0, 2	# divide t0 por 2^2 e bota em s2
	
	
	# leitura de inteiros 
	li $v0, 5	# ao dar syscall, podera ter um input do usuario, que é armazenado em v0
	syscall