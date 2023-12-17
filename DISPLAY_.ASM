data segment
        num db 42h ; Number to be displayed
data ends

code segment
        assume cs:code, ds:data
                start:
                        mov AX, data ; Load value of data segment
                        mov DS, AX ; Update the value in the data segment

                        mov AL, num ; Loading the two digit number
                        xor AH, AH ; Clearing AH
                        mov BL, 10 ;
                        div BL

                        ;Displaying the tens digit

                        add AL, '0' ; Adding the ASCII value of 0
                        mov DL , AL ;
                        mov AH , 2h ; Dos function to display character
                        int 21h ; interrupt

                        ; Displaying the units digit
                        xor AH, AH ; Clear AH
                        mov AH, AL
                        add AL, '0'
                        mov DL, AL
                        mov AH, 2h ; DOS function to display number
                        int 21h ; interrupt

                        ; Terminate the program
                        mov AH, 4Ch ; Function to terminate the program
                        int 21h ; Call DOS to exit

code ends
end start
