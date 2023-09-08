#Jesus Manuel Reyes Reyes
.data
cuanto_quieres: .asciiz "Pon cuantos valores quieres en la serie fibonacci: "
titulo: .asciiz "Serie fibonacci: "
n: .asciiz " . "

.text
main:
    #Pedir cuantos numeros
    li $v0, 4
    la $a0, cuanto_quieres
    syscall

    #Carga cuantas veces se repite y lo guarda en $t1
    li $v0, 5
    syscall
    move $s1, $v0

    #Carga el termino 1 y 2
    li $s2, 0
    li $s3, 1

    #Presentacion
    li $v0, 4
    la $a0, titulo
    syscall

    #Bucle
    loop:
        #Imprimir el valor antes de ser remplazado
        li $v0, 4
        la $a0, n
        syscall
        
        li $v0, 1
        move $a0, $s2
        syscall

        #Suma los dos valores y lo guarda en el siguiente
        add $s4, $s2, $s3

        #Remplaza los terminos para ciclar
        move $s2, $s3
        move $s3, $s4

        #Resta 1 a el contador
        subi $s1, $s1, 1

        #Comprobar si se genero correctamente, cuando llege a 0 acabara el bucle
        bnez $s1, loop