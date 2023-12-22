INCLUDE P.inc

char_print MACRO char
mov bl, char
.if bl == '0'
mov eax, 12*16+12
.elseif bl == '!'
mov eax,0
.elseif bl == ' '
mov eax, 14*16 + 14
.else
mov eax,14*16+ 4
.endif

call settextcolor
mov al, bl
call writechar
ENDM

.data


hangman0 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0
        
  
hangman1 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0
        

hangman2 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0 /    | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0 


hangman3 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0 /|   | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0

hangman4 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0 /|\  | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0

hangman5 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0 /|\  | 0", 0dh ,0ah,
         "!!0 /    | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0

hangman6 byte "!!0000000000",0dh,0ah, 
         "!!0  +---+ 0",0dh,0ah,
         "!!0  |   | 0",0dh,0ah,
         "!!0  O   | 0", 0dh ,0ah,
         "!!0 /|\  | 0", 0dh ,0ah,
         "!!0 / \  | 0", 0dh ,0ah,
         "!!0      | 0", 0dh ,0ah,
         "!!0000000000", 0dh ,0ah,0






.code

PrintHangman PROC,
        hangmanindex:byte 


mov dh,10
mov dl,0
call gotoxy

cmp hangmanindex,0
je l0

cmp hangmanindex,1
je l1

cmp hangmanindex,2
je l2
cmp hangmanindex,3
je l3
cmp hangmanindex,4
je l4
cmp hangmanindex,5
je l5

cmp hangmanindex,6
je l6




l0:
    mov ecx, lengthof hangman0
    mov edx, offset hangman0
    myprint0:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint0
    call crlf
    call crlf
    jmp end1
l1:
    
     mov ecx, lengthof hangman1
    mov edx, offset hangman1
    myprint1:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint1
    call crlf
    call crlf
    jmp end1

l2:
        mov ecx, lengthof hangman2
    mov edx, offset hangman2
    myprint2:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint2
    call crlf
    call crlf
    jmp end1
l3:
        mov ecx, lengthof hangman3
    mov edx, offset hangman3
    myprint3:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint3
    call crlf
    call crlf
    jmp end1
l4:
        mov ecx, lengthof hangman4
    mov edx, offset hangman4
    myprint4:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint4
    call crlf
    call crlf
    jmp end1
l5:
       mov ecx, lengthof hangman5
    mov edx, offset hangman5
    myprint5:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint5
    call crlf
    call crlf
    jmp end1
    l6:
        mov ecx, lengthof hangman6
    mov edx, offset hangman6
    myprint6:
    char_print BYTE PTR [edx]
    inc edx
    loop myprint6
    call crlf
    call crlf

    end1:
    mov eax , 15
    call settextcolor
    
    ret


PRintHangman ENDP

END