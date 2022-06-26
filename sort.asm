.model small

.stack 10H

.data
num dw 18,2,3,9,5,6
num1 dw 6

.code
mov ax,@data
mov ds,ax

mov cx, 0

loop1:

cmp cx, 5
je print

lea bx, num

mov si, 0
mov ax, 5
sub ax,cx

loop2:
cmp ax, 0
je loopout

mov dx, [bx+si]

add si, 2

cmp dx, [bx+si]
jge exchange

cont:
dec ax
jmp loop2

loopout:
inc cx
jmp loop1 

exchange:
xchg dx, [bx+si]
xchg dx,[bx+si-2]
jmp cont



print:
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
mov ah,04ch
int 21h
end