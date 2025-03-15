data segment
n db 00h
ar db 00h
data ends
code ends
assume cs:code;ds:data
start: mov ax,data
       mov ds,ax
       lea si,ar
       lea di,ar
       mov bh,n
       dec bh
       mov bl,0
       mov dh,n
       inc dh
       ag: cmp bh,00h
	   jz out
	   mov ah,[si]
	   inc bl
	   mov di,si
	   mov dl,bl
	   mov CX,si
           ig1: cmp dl,dh
		jz sk
		cmp [di],ah
		jnc sk1
		mov CX,di
		mov ah,[di]
		sk1: inc dl
		     inc di
		     jmp ig1
	   sk: cmp si,CX
	       jz fin
	       mov di,CX
	       mov al,[di]
	       mov ah,[si]
	       mov [di],ah
	       mov [si],al
	       fin: inc si
		    dec bh
		    jmp ag
	out: int 3
	code ends
	end start
