;Author : Ayushman Singh TEZPUR UNIVERSITY , ASSAM 
.model small 

.data

num1 dw 1,2,4,12,6,8
numsize dw 6
str1 db "SORTED$"
str2 db "UNSORTED$"

.stack 10h


.code
mov ax, @data
mov ds, ax

lea bx, num1 
mov dx,[bx]

mov si,2
add bx,2

l1:
cmp si,numsize 
ja l2

mov ax,dx
mov dx,[bx]

cmp ax, dx 
ja l3 

inc si 
add bx, 2
jmp l1 

l2:
lea dx,str1 
mov ah, 09h
int 21h
jmp terminate

l3:
lea dx,str2 
mov ah, 09h
int 21h

terminate:
mov ax, 04ch
int 21h
end
