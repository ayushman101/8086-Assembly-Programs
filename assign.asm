.model small

.code

mov dl, 1
mov cl, 0
compare:

cmp dl, 21
je gotoend

add cl,dl
inc dl

jmp compare

gotoend:

mov ah, 04ch
int 21h

end
