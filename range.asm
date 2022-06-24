.model small

.data

str1 db 13, 10, "PRIME$"

str2 db 13, 10, "NOT PRIME$"
num1 dw 9
num2 dw 12
.stack 10h

.code
mov ax, @data
mov ds, ax
 

start:
mov dx, num1 
cmp dx, num2 
ja terminate

mov ax, num1 

cmp ax,2
jb l2

cmp ax,4
jb l1

mov dx, ax
shr dx, 1
jnc l2

mov cx, 2
xor dx,dx
div cx

mov bx, ax
mov ax, num1  
mov cx, 3

l3:
cmp cx, bx
ja l1
mov ax, num1 

xor dx,dx
div cx
cmp dx, 0
je l2

add cx, 2
jmp l3 



l1:
lea dx, str1 
mov ah, 09h
int 21h
inc num1
jmp start

l2:
lea dx, str2 
mov ah, 09h
int 21h 
inc num1 
jmp start


terminate:
mov ah, 04ch
int 21h
end