INCLUDE P.inc

mopen_store_close MACRO file, buffer, handle
    mov edx, offset file
    call openinputfile
    mov handle, eax
    mov edx, offset buffer
    mov ecx, lengthof buffer
    call readfromfile
    mov eax, handle
    call closefile
ENDM

mcolor MACRO c
    push eax
    mov eax, c
    call settextcolor
    pop eax
ENDM

scout MACRO stringarr
    mgoto 0, 52
endm

.data
    h_file BYTE "hangman_logo.txt", 0
    g_file BYTE "gameover.txt", 0
    logo_buff BYTE 600 DUP(?)
    g_buff BYTE 600 DUP(?)
    handle_h DWORD ?
    handle_g DWORD ?
    GuessWords BYTE "chair", 0
                BYTE "school", 0
                BYTE "pencil", 0
                BYTE "watermelon", 0
                BYTE 0

    promtmsg BYTE "Guess Word: ", 0
    score BYTE "Score: ", 0
    wordtoguess byte 12 DUP(?)
    dashh byte 12 DUP('_')
    userch byte ?
    mistake byte 0
    xcord byte 13
    userscore byte 0

   
           

    winmsg byte "_____.___.               __      __              ",13,10,
           "\__  |   | ____  __ __  /  \    /  \____   ____  ",13,10,
           " /   |   |/  _ \|  |  \ \   \/\/   /  _ \ /    \ ",13,10,
           " \____   (  <_> )  |  /  \        (  <_> )   |  \",13,10,
           " / ______|\____/|____/    \__/\  / \____/|___|  /",13,10,
           " \/                            \/             \/ ",13,10,
            "Your score: ", 0

    gameover byte "  ________               ",13,10,
                  " /  _____/_____    _____   ____  _______  __ ___________ ",13,10,
                  "/   \  ___\__  \  /     \_/ __ \/  _ \  \/ // __ \_  __ \",13,10,
                  "\    \_\  \/ __ \|  Y Y  \  ___(  <_> )   /\  ___/|  | \/",13,10,
                  " \______  (____  /__|_|  /\___  >____/ \_/  \___  >__|   ",13,10,
                  "        \/     \/      \/     \/                \/       ",13,10,0
    



    

                                                 
                                                 
                                                 
                                                 
                                                 
                                                 




.code

main PROC
    mopen_store_close h_file, logo_buff, handle_h

    mov eax, 3
    call randomize
    call randomrange

    mcolor 12
    mov edx, offset logo_buff
    call writestring
    mcolor 14

    INVOKE PrintWord, ADDR wordtoguess, ADDR GuessWords, al, ADDR dashh
    call crlf

    mov dh, 3
    mov dl, 0

    mov dh, 20
    mov dl, 0
    call gotoxy
    mov edx, offset score
    call writestring
    movzx eax, userscore
    call writedec
    call crlf
    mov edx, offset promtmsg
    call writestring

    mov esi, 0
    mov ecx, 7
    call crlf

    ; DASH CONVERT
    invoke Str_length, ADDR wordtoguess
    mov ecx, eax
    mov esi, 0
    convert:
        .IF wordtoguess[esi] == 'a'
            mov dashh[esi], 'a'
        .ELSEIF wordtoguess[esi] == 'e'
            mov dashh[esi], 'e'
        .ENDIF
        inc esi
        loop convert

    mov dh, 8
    mov dl, 0
    call gotoxy

    invoke Str_length, ADDR wordtoguess
    mov ecx, eax
    mov esi, 0
    loop1:
        movzx eax, dashh[esi]
        inc esi
        call writechar
        loop loop1

    in1:
    INVOKE PrintHangman, mistake
    mov dh, 21
    mov dl, xcord
    call gotoxy
    call readchar
    mov userch, al
    call writechar

    INVOKE checkp, userch, ADDR wordtoguess, ADDR dashh, mistake
    .IF esi != 2
        inc mistake
        .IF userscore != 0
            dec userscore
        .ENDIF
    .ENDIF

    .IF esi == 2
        inc userscore
    .ENDIF

    mov dh, 20
    mov dl, 0
    call gotoxy
    mov edx, offset score
    call writestring
    movzx eax, userscore
    call writedec

    mov dh, 8
    mov dl, 0
    call gotoxy

    invoke Str_length, ADDR wordtoguess
    mov esi, 0
    mov ecx, eax
    sd:
        movzx eax, dashh[esi]
        inc esi
        call writechar
        loop sd

    INVOKE checkEqual, ADDR dashh, ADDR wordtoguess
    .IF edx == 0
        mov dh, 22
        mov dl, 0
        call gotoxy
        mov edx, offset winmsg
        call writestring
        movzx eax, userscore
        call writedec
        INVOKE ExitProcess,0
    .ENDIF

    mov dh, 20
    inc xcord
    mov dl, xcord
    call gotoxy

    .IF mistake != 6
        jmp in1
    .ENDIF

    INVOKE PrintHangman, mistake
    mov dh, 22
    inc xcord
    mov dl, 0
   mov edx,offset gameover
   call writestring
    call crlf

main ENDP
END main
