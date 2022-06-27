;Insertion Sort Program 

.model small

.data

num1 dw 39,2,3,18,5,6,56   ;Array to be sorted 
numsize dw 7                ; Array size 
str1 db ' $'                ;To be used for printing sorted array 

.stack 10h

.code
mov ax, @data
mov ds, ax

lea bx, num1
mov si, 1


;Sorting Section of code
l11:

add bx, 2
inc si

cmp si, numsize 
ja print

mov ax, [bx]

mov cx, si
dec cx

mov di, bx 
sub di, 2 

l22:
cmp cx, 0
je exchange

mov dx,[di]


cmp dx, ax 
jb exchange

xchg dx,[di+2]
dec cx
sub di,2 

jmp l22

exchange:
xchg ax, [di+2]
jmp l11

;Sorting Code section over



;Printing sorted array 
print : 
mov si,1 
mov cx, 10

lea bx,num1

l1:

cmp si,numsize 
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

lea dx, str1 
mov ah, 09h
int 21h

add bx, 2
pop si
inc si

jmp l1


terminate:
mov ah, 04ch
int 21h
end