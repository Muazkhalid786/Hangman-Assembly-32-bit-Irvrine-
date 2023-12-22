INCLUDE P.inc
.code



checkp PROC,
userch:byte,
ptrarray:PTR byte,
ptrdashh:PTR byte,
mistake:byte

LOCAL counter:byte,xcord:byte  
mov xcord,13


 inc xcord
  mov dh,11
    mov dl,xcord
    call gotoxy


invoke Str_length ,
[ptrarray]
mov ecx,eax
mov esi,0
mov eax,[ptrarray]
mov ebx,[ptrdashh]

mov esi,0
h2:
mov edx,[eax]
.IF dl==userch
mov [ebx],dl
mov esi,2
.ENDIF

inc eax
inc ebx
loop h2




ret 

checkp ENDP

END