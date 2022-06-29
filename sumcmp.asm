.model small

.data

num dw 12,44, 41

numsize dw 3

num1 dw 97

str1 db "EQUAL$"

.stack 10h

.code

mov ax, @data
mov ds, ax

mov si, numsize
mov ax, 0
lea bx, num 

l2:
cmp si,0
je l1

mov dx, [bx]
add ax, dx

dec si
add bx, 2

jmp l2

l1:
cmp ax, num1 
je l3

jmp terminate

l3:
lea dx, str1 
mov ah, 09h
int 21h

terminate:
mov ah, 04ch
int 21h
end
