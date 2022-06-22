.model small 

.data

num dw 10,40,23
num1 dw 3

.stack 10h

.code

mov ax, @data
mov ds, ax

mov si,1 
mov cx, 10

lea bx,num

l1:

cmp si,num1
ja terminate

mov ax,[bx]
push si

mov si, 0

l2:

cmp ax,0
je l3

xor dx,dx
div cx


add dx, 48
push dx
inc si
jmp l2

l3:
cmp si,0
je l4 

pop dx
mov ah, 02h
int 21h
dec si
jmp l3


l4:

add bx, 2
pop si
inc si

jmp l1

terminate:
mov ah, 04ch
int 21h
end
