; multiplica.asm — Multiplicación de dos dígitos (0–9), resultado 0–81 mostrado en decimal
.model small
.stack 100h

.data
     msg1 db "Ingrese el primer digito: $"
     msg2 db 13,10,"Ingrese el segundo digito: $"
     msgR db 13,10,"Resultado: $"
     n1   db ?                                        ; primer dígito
     n2   db ?                                        ; segundo dígito
     res  db ?                                        ; resultado de n1 * n2

.code
     main:
     ; — Inicializar segmento de datos —
          mov ax, @data
          mov ds, ax

     ; — Mostrar mensaje 1 —
          mov ah, 09h
          lea dx, msg1
          int 21h

     ; — Leer primer dígito —
          mov ah, 01h
          int 21h
          sub al, 30h        ; ASCII → número (0–9)
          mov n1, al

     ; — Mostrar mensaje 2 —
          mov ah, 09h
          lea dx, msg2
          int 21h

     ; — Leer segundo dígito —
          mov ah, 01h
          int 21h
          sub al, 30h        ; ASCII → número
          mov n2, al

     ; — Multiplicar n1 * n2 —
          mov al, n1
          mul n2             ; AX = AL * n2  (máx 9*9 = 81 cabe en AX)
          mov res, al        ; tomar resultado (bajo byte)

     ; — Mostrar texto "Resultado:" —
          mov ah, 09h
          lea dx, msgR
          int 21h

     ; — Convertir res a decena y unidad —
          mov al, res
          xor ah, ah         ; AH = 0 para dividir
          mov bl, 10
          div bl             ; AL = decenas, AH = unidades

          mov bh, al         ; BH ← decena
          mov bl, ah         ; BL ← unidad

     ; — Imprimir decena si > 0 —
          cmp bh, 0
          je  @@Unidades
          add bh, 30h        ; número → ASCII
          mov dl, bh
          mov ah, 02h
          int 21h

@@Unidades:
          add bl, 30h        ; unidad → ASCII
          mov dl, bl
          mov ah, 02h
          int 21h

     ; — Terminar programa —
          mov ah, 4Ch
          int 21h

end main
