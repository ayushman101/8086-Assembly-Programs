.model small

.data

str1 db ' This is  a sentence $'

.stack 10h

.code
mov ax, @data
mov ds,ax

mov cx, 0

lea bx, str1 

l2:
mov dl, [bx]
inc bx

cmp dl, '$'
je print

cmp dl, ' '
je l2

inc cx

l3:
mov dl, [bx]

cmp dl, '$'
je print 

cmp dl, ' '
je l2
inc bx 
jmp l3


print:
mov dx,cx 
add dx, 48
mov ah, 02h
int 21h


mov ah,04ch 
int 21h
end