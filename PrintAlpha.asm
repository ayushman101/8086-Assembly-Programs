.model small

.code

mov dl, 61h

compare:

cmp dl, 66h
je gotoend

mov ah, 02h
int 21h

inc dl

jmp compare

gotoend: mov ah, 04ch
int 21h

end
