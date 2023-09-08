#Jesus Manuel Reyes Reyes
.data
msg1: .asciiz "Primero: "
msg2: .asciiz "Segundo: "
msg3: .asciiz "Tercero: "
msgf: .asciiz "El numero mayor: "
num_maximo: .word 0

.text
main:
    #Guarda el primer numero
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    #Guarda el segundo numero
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    #Guarda el tercer numero
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $s2, $v0
    
    #Comparar el primero con segundo
    bgt $s0, $s1, comparacion_1
    move $s3, $s1

    #Comparar el minimo actual con tercero
    j comparacion_2
        
    comparacion_1:
    #Guardar el valor maximo en $s3
    move $s3, $s0

    comparacion_2:
    bgt $s3, $s2, resultado
    #Guardar el valor maximo en $s3
    move $s3, $s2

    resultado:
    #Guarda numero maximo
    sw  $s3, num_maximo
        
    #Imprime numero maximo
    li $v0, 4
    la $a0, msgf
    syscall
        
    lw $a0, num_maximo
    li $v0, 1
    syscall
