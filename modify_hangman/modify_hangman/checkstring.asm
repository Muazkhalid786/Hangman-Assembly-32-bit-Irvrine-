INCLUDE P.inc
.code

checkEqual PROC,
ptrdash:PTR byte,
ptrword:PTR byte

   invoke Str_length ,
[ptrword]
mov ecx,eax
push eax
mov eax,0
mov ebx,0
 mov esi,      [ptrword] 
    mov edi, [ptrdash]  

         mov edx,0
checking:
    mov al,[esi]
    mov bl,[edi]

        .IF al==bl
       inc edx
        .ENDIF
        inc esi
        inc edi
         loop checking
         pop eax
         .IF edx==eax
         mov edx,0
         .ENDIF


   
    ret

checkEqual ENDP
END