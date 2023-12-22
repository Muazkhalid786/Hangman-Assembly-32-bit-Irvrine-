INCLUDE P.inc
.code

PrintWord PROC ,
ptrstring:PTR byte,
ptrArray:PTR byte,
wordindex:byte,
dashh:ptr byte


movzx esi,wordindex
cmp esi,0
je label1
movzx ecx,wordindex
l2:
add ptrArray,1
mov eax,[[ptrArray]]
mov eax,[eax]
cmp al,0
jne l2
loop l2

add ptrArray,1
label1:
invoke Str_length ,
ptrArray
mov esi, ptrArray
mov edi, ptrstring
mov ecx,eax
rep movsb




ret
PrintWord ENDP
END