; resta_correcta.asm — Resta de dos dígitos (0–9), resultado 0–18, mostrado en decimal
.model small
.stack 100h

.data
    msg1 db "Ingrese el primer digito: $"
    msg2 db 13,10,"Ingrese el segundo digito: $"
    msgR db 13,10,"Resultado: $"
    n1   db ?
    n2   db ?
    res  db ?

.code
    main:
         mov ax, @data
         mov ds, ax

    ;--- Mensaje 1 ---
         mov ah, 09h
         lea dx, msg1
         int 21h

    ;--- Leer n1 ---
         mov ah, 01h
         int 21h
         sub al, 30h       ; ASCII → número
         mov n1, al

    ;--- Mensaje 2 ---
         mov ah, 09h
         lea dx, msg2
         int 21h

    ;--- Leer n2 ---
         mov ah, 01h
         int 21h
         sub al, 30h
         mov n2, al

    ;--- Calcular res = n1 – n2 ---
         mov al, n1
         sub al, n2
         mov res, al       ; puede ser negativo en AL (pero asumimos n1>=n2)

    ;--- Mostrar “Resultado:” ---
         mov ah, 09h
         lea dx, msgR
         int 21h

    ;--- Convertir res (AL) a decena/unidad ---
         mov al, res
         xor ah, ah        ; AH = 0 antes de div
         mov bl, 10
         div bl            ; AL = decenas, AH = unidades

         mov bh, al        ; salvamos decena
         mov bl, ah        ; salvamos unidad

    ;--- Imprimir decena si >0 ---
         cmp bh, 0
         je  @@ImprUnid
         add bh, 30h       ; número→ASCII
         mov dl, bh
         mov ah, 02h
         int 21h

@@ImprUnid:
         add bl, 30h       ; unidad→ASCII
         mov dl, bl
         mov ah, 02h
         int 21h

    ;--- Fin ---
         mov ah, 4Ch
         int 21h
end main
