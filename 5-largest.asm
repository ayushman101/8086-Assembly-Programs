//Author : Ayushman Singh   Tezpur University, Assam
.model small 

.data

num dw 10,40,23,45
num1 dw 4

.stack 10h

.code

mov ax, @data
mov ds, ax

mov si,1 

lea bx,num
mov ax,[bx]
add bx,2


l1:

cmp si,num1
je l2

mov cx,[bx]
add bx, 2
inc si
cmp cx, ax
jb l1

mov ax, cx
jmp l1


l2:
mov si,0
mov cx, 10

l3:
cmp ax,0
je l4

xor dx,dx
div cx


add dx, 48
push dx
inc si
jmp l3

l4:
cmp si,0
je terminate 

pop dx
mov ah, 02h
int 21h
dec si
jmp l4


terminate:
mov ah, 04ch
int 21h
end
