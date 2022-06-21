.model small

.data

str1 db 'ToGgle$'

.stack 10h

.code 

mov ax, @data
mov ds, ax


lea bx, str1
l2:
mov dl, [bx]

cmp dl, '$'
je terminate

cmp dl, 97
jb l1

sub dl, 32
mov ah, 02h
int 21h
inc bx
jmp l2

l1:
add dl, 32
mov ah, 02h
int 21h
inc bx
jmp l2

terminate:
mov ah, 04ch
int 21h
end
