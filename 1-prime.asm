;Author : Ayushman Singh  Tezpur University,Assam 

.model small

.data

str1 db "PRIME$"

str2 db "NOT PRIME$"
num dw 9

.stack 10h

.code
mov ax, @data
mov ds, ax

mov ax, num 

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

mov ax, num 

mov cx, 3

l3:
cmp cx, bx
ja l1
mov ax, num

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
jmp terminate

l2:
lea dx, str2 
mov ah, 09h
int 21h 


terminate:
mov ah, 04ch
int 21h
end
