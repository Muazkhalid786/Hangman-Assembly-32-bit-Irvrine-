INCLUDE P.inc

normal_ccout  MACRO char 
push eax
mov al, char
call writechar
pop eax
ENDM


mgoto MACRO y,x
push edx
mov dh,y
mov dl,x
call gotoxy
pop edx
endm

.code

string_at_required_position PROC,
                    sptr:PTR BYTE,
                    y_coordinate: BYTE,
                    x_coordinate: BYTE

mgoto y_coordinate, x_coordinate
mov esi,sptr
mov ecx, 0 
print_char_by_char:
.IF BYTE PTR[esi + ecx] == 0
jmp stopped
.ELSEIF BYTE PTR[esi + ecx] == 0dh   ; check for next line
inc y_coordinate
mgoto y_coordinate,x_coordinate
add ecx,2           
.ELSE
normal_ccout BYTE PTR [esi + ecx]
inc ecx 
.ENDIF

jmp print_char_by_char
stopped:

ret
string_at_required_position ENDP

END