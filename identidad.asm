.model small
.stack 100h
.data
    nombre db 10,13, "Nombre: Albert Jimenez", 10,13, "$"
    id     db "CC: 123456789", 10,13, "$"
.code
    main:
         mov ax, @data
         mov ds, ax

    ; Mostrar nombre
         mov ah, 09h
         lea dx, nombre
         int 21h

    ; Mostrar ID
         lea dx, id
         int 21h

    ; Salir
         mov ah, 4Ch
         int 21h
end main
