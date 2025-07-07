.model small
.stack 100h
.data
      msg1 db "Ingrese el primer digito: $"
      msg2 db 13,10,"Ingrese el segundo digito: $"
      msgR db 13,10,"Resultado: $"

      n1   db ?
      n2   db ?
.code
      main:             
                        mov ax, @data
                        mov ds, ax

      ; Mostrar mensaje 1
                        mov ah, 09h
                        lea dx, msg1
                        int 21h

      ; Leer primer dígito
                        mov ah, 01h
                        int 21h
                        sub al, 30h
                        mov n1, al

      ; Mostrar mensaje 2
                        mov ah, 09h
                        lea dx, msg2
                        int 21h

      ; Leer segundo dígito
                        mov ah, 01h
                        int 21h
                        sub al, 30h
                        mov n2, al

      ; Sumar los dígitos
                        mov al, n1
                        add al, n2                 ; AL = suma
                        xor ah, ah                 ; Preparar para división
                        mov bl, 10
                        div bl                     ; AL = decenas, AH = unidades

                        mov bh, al                 ; Guardar decenas en BH
                        mov bl, ah                 ; Guardar unidades en BL

      ; Mostrar mensaje de resultado
                        mov ah, 09h
                        lea dx, msgR
                        int 21h

      ; Imprimir decenas si no es cero
                        cmp bh, 0
                        je  imprimir_unidades
                        add bh, 30h
                        mov dl, bh
                        mov ah, 02h
                        int 21h

      imprimir_unidades:
                        add bl, 30h
                        mov dl, bl
                        mov ah, 02h
                        int 21h

      ; Salir
                        mov ah, 4Ch
                        int 21h
end main
