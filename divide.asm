; divide.asm — División de dos dígitos (0–9) con manejo de divisor cero
.model small
.stack 100h

.data
    msg1    db "Ingrese el dividendo: $"
    msg2    db 13,10,"Ingrese el divisor: $"
    msgR    db 13,10,"Resultado: $"
    msgTrol db 13,10,"¡Con que quieres trollearme!$"
    n1      db ?
    n2      db ?
    res     db ?

.code
    main: 
    ; --- Inicializar DS ---
          mov ax, @data
          mov ds, ax

    ; --- Pedir dividendo ---
          mov ah, 09h
          lea dx, msg1
          int 21h

          mov ah, 01h        ; Leer carácter
          int 21h
          sub al, 30h        ; ASCII → número
          mov n1, al

    ; --- Pedir divisor ---
          mov ah, 09h
          lea dx, msg2
          int 21h

          mov ah, 01h
          int 21h
          sub al, 30h
          mov n2, al

    ; --- Si divisor = 0: trollear ---
          mov al, n2
          cmp al, 0
          je  troll

    ; --- División n1 / n2 ---
          mov al, n1
          xor ah, ah         ; AH=0 para DIV
          mov bl, n2
          div bl             ; AL=cociente, AH=residuo
          mov res, al

    ; --- Mostrar etiqueta de resultado ---
          mov ah, 09h
          lea dx, msgR
          int 21h

    ; --- Convertir y mostrar cociente ---
          mov al, res
          xor ah, ah
          mov bl, 10
          div bl             ; AL=decenas, AH=unidades

          cmp al, 0
          je  .print_unit    ; si decena=0, solo unidad

          add al, 30h        ; decena→ASCII
          mov dl, al
          mov ah, 02h
          int 21h

.print_unit:
          add ah, 30h        ; unidad→ASCII
          mov dl, ah
          mov ah, 02h
          int 21h

    ; --- Salir ---
          mov ah, 4Ch
          int 21h

    troll:
          mov ah, 09h
          lea dx, msgTrol
          int 21h

          mov ah, 4Ch
          int 21h
end main
