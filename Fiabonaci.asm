data segment
n db 00h
ar db 00h
data ends
code segment
assume cs:code;ds:data
start:	mov ax,data
	mov ds,ax
	mov cl,n
	lea si,ar
	lea di,ar
	mov [si],0h
	inc si
	mov [si],01h
	inc si
	mov [si],01h
	add di,1
	sub cl,3
	ag: mov ah,[di]
	    add ah,[si]
	    inc si
	    mov [si],ah
	    inc di
	    loop ag
	int 3
	code ends
	end start
