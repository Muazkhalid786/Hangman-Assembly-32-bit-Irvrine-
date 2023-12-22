INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

PrintWord PROTO,
ptrstring:PTR byte,
ptrArray:PTR byte,
wordindex:byte,
dashh:PTR byte

string_at_required_position PROTO,
sptr:PTR BYTE,
y_coordinate: BYTE,
x_coordinate: BYTE


checkPROC PROTO,
char:byte,
ptrString:PTR byte

PrintHangman PROTO,
indexNUm:byte




checkp PROTO,
userch:byte,
ptrarray:PTR byte,
ptrdashh:PTR byte,
counter:byte

checkEqual PROTO,
ptrdash:PTR byte,
ptrword:PTR byte






