;Selection Sort Program 

.model small

.data

num1 dw 39,2,3,18,5,6,56       ;Array of intergers 
numsize dw 7                ;array size
numsize2 dw 7               ; also array size

str1 db ' $'                ;string to put space in sorted array 

.stack 10h

.code
mov ax, @data
mov ds, ax



;Sorting using selection sort 
start:
mov si, numsize    
cmp si, 0
je print

mov si,1 

lea bx,num1
mov dx,[bx]
mov ax, bx 
add bx,2


l1:

cmp si,numsize 
je l2

mov cx,[bx]
add bx, 2
inc si
cmp cx, dx
jb l1

sub bx, 2
mov ax, bx 
add bx, 2 

mov dx, cx
jmp l1

l2:
xchg dx, [bx-2]
mov bx, ax
xchg dx, [bx]

dec numsize
jmp start

;Sorting Complete





;Printing the sorted array 
print:

mov si,1 
mov cx, 10

lea bx,num1

l5:

cmp si,numsize2 
ja terminate

mov ax,[bx]
push si

mov si, 0

l6:

cmp ax,0
je l7

xor dx,dx
div cx


add dx, 48
push dx
inc si
jmp l6

l7:
cmp si,0
je l4 



pop dx
mov ah, 02h
int 21h
dec si
jmp l7


l4:

lea dx, str1 
mov ah, 09h
int 21h

add bx, 2
pop si
inc si

jmp l5



;End of program 
terminate:
mov ah, 04ch
int 21h
end
