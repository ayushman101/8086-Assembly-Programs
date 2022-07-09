.model small

.data
x1 dw -2
x2 dw 5

str1 db 'x1$'
str2 db 'x2$'
str3 db 'equal$'

.stack 10h

.code
mov ax, @data
mov ds, ax

mov ax, x1
cmp ax, x2

je l3
jl l2

lea dx, str1
mov ah, 09h
int 21h
jmp terminate

l2:
lea dx, str2
mov ah, 09h
int 21h
jmp terminate

l3:
lea dx, str3
mov ah, 09h
int 21h


terminate:
mov ah, 04ch
int 21h
end
