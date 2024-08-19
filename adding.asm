
org 100h     

num1 db 24h
num2 db 29h
start: 
mov al,num1   ;load num1 into rigester al
add al,num2    ;add num2 to al
;result is now in al
;convert result into asci value to display 
mov bl,al      ; save the result for display
mov ah,al      ;convert upper nibble of al to a charecter
and ah,0F0h    ;mask the lower nibble
shr ah,4        ;shift right by 4 to get upper nibble
add ah, 30h     ;convert to ascii(0-9)
cmp ah, 39h
jle print_first_digit
add ah, 7       ;conver to ascii(A-F)
print_first_digit:
mov dl, ah    
mov ah, 02h  ;BIOS interupt to display charecter
int 21h
mov ah, bl
and ah, 0Fh   ;mask the upper nibble
add ah,30h     ;convert to ascii digit
cmp ah, 39h
jle print_second_digit
add ah, 7          ;convert to ascii leter
print_second_digit:
mov dl, ah      ;move the second digit todl for printing
mov ah, 02h     ;BIOS  interupt to display charecter
int 21h 
;end the program
mov ah, 4Ch   ;terminate the program
int 21h
ret




