.model small

.data
x1 dw 2
x2 dw 5
x3 dw 8

str1 db 'x1$'
str2 db 'x2$'
str3 db 'x3$'

.stack 10h

.code
mov ax, @data
mov ds, ax

mov ax, x1
mov bx, x2

cmp ax, bx
jl l1


cmp ax, x3
jl l5

lea dx, str1
mov ah, 09h
int 21h
jmp terminate


l1:
cmp x3,bx
ja l5

lea dx, str2
mov ah, 09h
int 21h
jmp terminate

l5:
lea dx, str3
mov ah, 09h
int 21h


terminate:
mov ah, 04ch
int 21h
end
