DATA segment
	WL DB 'WELCOME TO QUIZ GAME'
	MES DB 'Press any key to Start...'
	MES1 DB 'Press any key to EXIT....'

		;INITIALIZE REQUIRED STRINGS IN GAME
	                                                       
	QUE1	   DB  'QUESTION 1: WHO IS THE CEO OF APPLE?'
    OP1A       DB  '(A) STEVE JOBS'
	OP1B       DB  '(B) BILL GAETS'
	OP1C       DB  '(C) TIM COOK'
	OP1D       DB  '(D) SATYA NADELLA'
	QUE2	   DB  'QUESTION 2: WHO HIT SIX SIXES IN ONE OVER IN T-20?'
    OP2A       DB  '(A) M.S.DHONI'
	OP2B       DB  '(B) YUVRAJ SINH'
	OP2C       DB  '(C) VIRAT KOHLI'
	OP2D       DB  '(D) MARK BOUCHER'
	QUE3	   DB  'QUESTION 3: WHO IS THE CEO OF RELIENCE JIO?'
    OP3A       DB  '(A) ANIL AMBANI'
	OP3B       DB  '(B) MUKESH AMBANI'
	OP3C       DB  '(C) DHIRUBHAI AMBANI'
	OP3D       DB  '(D) NONE OF ABOVE'
	QUE4	   DB  'QUESTION 4:WHO IS PM OF INDIA?'
    OP4A       DB  '(A) NARENDRA MODI'
	OP4B       DB  '(B) RAHUL GANDHI'
	OP4C       DB  '(C) MANMOHAN SINH'
	OP4D       DB  '(D) SONIA GANDHI'
	QUE5	   DB  'QUESTION 5:8086 PROGRAM CSN ALSO RUN IN ....?'
    OP5A       DB  '(A) 8085'
	OP5B       DB  '(B) 8087'
	OP5C       DB  '(C) 8088'
	OP5D       DB  '(D) 80386'
	SCRMSG     DB  'TOTAL NUMBER OF CORRECT ANSWRS:'
	;NEXTMSG    DB  'NEXT'
	EXITMSG    DB  'EXIT' 
	STARTB     DB  'START GAME'
	ANS		   DB  ?
	SC		   DB  ?
	EC 		   DB  ?
	SCORE      DB  00h

DATA ENDS

CODE SEGMENT
        
FIRST:
				ASSUME CS:CODE,DS:DATA,ES:DATA
				MOV AX,DATA
				MOV DS,AX
				MOV ES,AX
					
				MOV AL,12H ;switch to graphics mode(vga-640 x 480 16 colors)
				MOV AH,00H
				INT 10H
	
				;;;;BACKGROUND WHITE
				mov cx,01h  ;cx = column(first column index)
				mov dx,01h	;dx = row(first row index)
				mov al,0fh	;al = pixel color
				mov ah,0ch	
				sta99:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,27fh	;compare column number with last column number of background
				jne sta99			
				inc dx		;increment row index
				mov cx,01h	;set first column index for new row
				cmp dx,1dfh	;compare column number with last row number of background
				jne sta99
				
				;WELCOME  BLOCK
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,46H;
				MOV DX,46H;
				STA115:INT 10H;
				INC CX;
				CMP CX,23AH; horizontal pixels:640D
				JNE STA115;
				STA116:INT 10H;
				INC DX;
				CMP DX,0AAH; Vertical pixels:480D
				JNE STA116;
				STA117:INT 10H;
				DEC CX;
				CMP CX,46H;
				JNE STA117;
				STA118:INT 10H;
				DEC DX;
				CMP DX,46H;
				JNE STA118;
				
				mov cx,47h  ;cx = column(first column index)
				mov dx,47h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta119:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,23Ah	;compare column number with last column number of background
				jne sta119			
				inc dx		;increment row index
				mov cx,47h	;set first column index for new row
				cmp dx,0AAh	;compare column number with last row number of background
				jne sta119
				
				mov cx,64h  ;cx = column(first column index)
				mov dx,64h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta120:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,21Ch	;compare column number with last column number of background
				jne sta120			
				inc dx		;increment row index
				mov cx,64h	;set first column index for new row
				cmp dx,8Ch	;compare column number with last row number of background
				jne sta120
	
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,14H ;number of characters in string
				MOV DL,1CH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,WL ;give effective address of string
				MOV AH,13H
				INT 10H
				
				;;;START BUTTON
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,0C3H;
				MOV DX,122H;
				STA100:INT 10H;
				INC CX;
				CMP CX,1AAH; horizontal pixels:640D
				JNE STA100;
				STA101:INT 10H;
				INC DX;
				CMP DX,14AH; Vertical pixels:480D
				JNE STA101;
				STA102:INT 10H;
				DEC CX;
				CMP CX,0C3H;
				JNE STA102;
				STA103:INT 10H;
				DEC DX;
				CMP DX,122H;
				JNE STA103;
				
				mov cx,0C4h  ;cx = column(first column index)
				mov dx,123h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta104:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,1AAh	;compare column number with last column number of background
				jne sta104			
				inc dx		;increment row index
				mov cx,0C4h	;set first column index for new row
				cmp dx,14Ah	;compare column number with last row number of background
				jne sta104
				
				mov cx,0C7h  ;cx = column(first column index)
				mov dx,128h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta105:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,1A7h	;compare column number with last column number of background
				jne sta105			
				inc dx		;increment row index
				mov cx,0C7h	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta105
				
				;;;PRINTING START
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0AH ;number of characters in string
				MOV DL,20H ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,STARTB;give effective address of string
				MOV AH,13H
				INT 10H
				
		SCH:	CALL INIT
				CALL SHOWMOUSE
				CALL STARTC
				MOV AL,04H;
				CMP SC,01H;
				JNE STA128;
				JMP START;
				CALL REDRAW
				STA128:jmp SCH
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


START:			MOV AX,DATA
				MOV DS,AX
				MOV ES,AX
	

				MOV AL,12H ;switch to graphics mode(vga-640 x 480 16 colors)
				MOV AH,00H
				INT 10H
				;;;;BACKGROUND WHITE
				mov cx,01h  ;cx = column(first column index)
				mov dx,01h	;dx = row(first row index)
				mov al,0fh	;al = pixel color
				mov ah,0ch	
				sta:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,27fh	;compare column number with last column number of background
				jne sta			
				inc dx		;increment row index
				mov cx,01h	;set first column index for new row
				cmp dx,1dfh	;compare column number with last row number of background
				jne sta

				MOV AH,0CH;
				MOV AL,0FH;
				MOV BX,64H;
				MOV CX,01H;
				MOV DX,01H;
				STA1:INT 10H;
				INC CX;
				CMP CX,27FH; horizontal pixels:640D
				JNE STA1;
				STA2:INT 10H;
				INC DX;
				CMP DX,1DFH; Vertical pixels:480D
				JNE STA2;
				STA3:INT 10H;
				DEC CX;
				CMP CX,01H;
				JNE STA3;
				STA4:INT 10H;
				DEC DX;
				CMP DX,01H;
				JNE STA4;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
				
							
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						
								

				;QUESTION BLOCK
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,46H;
				MOV DX,46H;
				STA5:INT 10H;
				INC CX;
				CMP CX,23AH; horizontal pixels:640D
				JNE STA5;
				STA6:INT 10H;
				INC DX;
				CMP DX,0AAH; Vertical pixels:480D
				JNE STA6;
				STA7:INT 10H;
				DEC CX;
				CMP CX,46H;
				JNE STA7;
				STA8:INT 10H;
				DEC DX;
				CMP DX,46H;
				JNE STA8;
				
				mov cx,47h  ;cx = column(first column index)
				mov dx,47h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta38:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,23Ah	;compare column number with last column number of background
				jne sta38			
				inc dx		;increment row index
				mov cx,47h	;set first column index for new row
				cmp dx,0AAh	;compare column number with last row number of background
				jne sta38
				
				mov cx,64h  ;cx = column(first column index)
				mov dx,64h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta37:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,21Ch	;compare column number with last column number of background
				jne sta37			
				inc dx		;increment row index
				mov cx,64h	;set first column index for new row
				cmp dx,8Ch	;compare column number with last row number of background
				jne sta37

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						
				;OPTION 1
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,46H;
				MOV DX,0D2H;
				STA13:INT 10H;
				INC CX;
				CMP CX,12CH; horizontal pixels:640D
				JNE STA13;
				STA14:INT 10H;
				INC DX;
				CMP DX,0FAH; Vertical pixels:480D
				JNE STA14;
				STA15:INT 10H;
				DEC CX;
				CMP CX,46H;
				JNE STA15;
				STA16:INT 10H;
				DEC DX;
				CMP DX,0D2H;
				JNE STA16;
				
				mov cx,47h  ;cx = column(first column index)
				mov dx,0D3h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta55:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,12Ch	;compare column number with last column number of background
				jne sta55			
				inc dx		;increment row index
				mov cx,47h	;set first column index for new row
				cmp dx,0FAh	;compare column number with last row number of background
				jne sta55
				
				mov cx,50h  ;cx = column(first column index)
				mov dx,0D9h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta56:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,123h	;compare column number with last column number of background
				jne sta56			
				inc dx		;increment row index
				mov cx,50h	;set first column index for new row
				cmp dx,0F4h	;compare column number with last row number of background
				jne sta56
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;OPTION 2
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,154H;
				MOV DX,0D2H;
				STA17:INT 10H;
				INC CX;
				CMP CX,23AH; horizontal pixels:640D
				JNE STA17;
				STA18:INT 10H;
				INC DX;
				CMP DX,0FAH; Vertical pixels:480D
				JNE STA18;
				STA19:INT 10H;
				DEC CX;
				CMP CX,154H;
				JNE STA19;
				STA20:INT 10H;
				DEC DX;
				CMP DX,0D2H;
				JNE STA20;
				
				mov cx,155h  ;cx = column(first column index)
				mov dx,0D3h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta41:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,23Ah	;compare column number with last column number of background
				jne sta41			
				inc dx		;increment row index
				mov cx,155h	;set first column index for new row
				cmp dx,0FAh	;compare column number with last row number of background
				jne sta41
				
				mov cx,15Fh  ;cx = column(first column index)
				mov dx,0D9h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta42:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,230h	;compare column number with last column number of background
				jne sta42			
				inc dx		;increment row index
				mov cx,15Fh	;set first column index for new row
				cmp dx,0F4h	;compare column number with last row number of background
				jne sta42
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
				;OPTION 3
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,46H;
				MOV DX,122H;
				STA21:INT 10H;
				INC CX;
				CMP CX,12CH; horizontal pixels:640D
				JNE STA21;
				STA22:INT 10H;
				INC DX;
				CMP DX,14AH; Vertical pixels:480D
				JNE STA22;
				STA23:INT 10H;
				DEC CX;
				CMP CX,46H;
				JNE STA23;
				STA24:INT 10H;
				DEC DX;
				CMP DX,122H;
				JNE STA24;
				
				mov cx,47h  ;cx = column(first column index)
				mov dx,123h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta43:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,12Ch	;compare column number with last column number of background
				jne sta43			
				inc dx		;increment row index
				mov cx,47h	;set first column index for new row
				cmp dx,14Ah	;compare column number with last row number of background
				jne sta43
				
				mov cx,50h  ;cx = column(first column index)
				mov dx,129h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta44:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,123h	;compare column number with last column number of background
				jne sta44			
				inc dx		;increment row index
				mov cx,50h	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta44
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
				;OPTION 4
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,154H;
				MOV DX,122H;
				STA25:INT 10H;
				INC CX;
				CMP CX,23AH; horizontal pixels:640D
				JNE STA25;
				STA26:INT 10H;
				INC DX;
				CMP DX,14AH; Vertical pixels:480D
				JNE STA26;
				STA27:INT 10H;
				DEC CX;
				CMP CX,154H;
				JNE STA27;
				STA28:INT 10H;
				DEC DX;
				CMP DX,122H;
				JNE STA28;
				
				mov cx,155h  ;cx = column(first column index)
				mov dx,123h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta45:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,23Ah	;compare column number with last column number of background
				jne sta45			
				inc dx		;increment row index
				mov cx,155h	;set first column index for new row
				cmp dx,14Ah	;compare column number with last row number of background
				jne sta45
				
				mov cx,15Fh  ;cx = column(first column index)
				mov dx,129h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta46:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,230h	;compare column number with last column number of background
				jne sta46			
				inc dx		;increment row index
				mov cx,15Fh	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta46
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
				JMP QUESTION1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTING QUESTION
				
QUESTION1:		MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,24H ;number of characters in string
				MOV DL,0DH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,QUE1 ;give effective address of string
				MOV AH,13H
				INT 10H


				;PRINTING OPTION1
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0EH ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP1A ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION2
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0EH ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP1B ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION3
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0CH ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP1C;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION4
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,11H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP1D ;give effective address of string
				MOV AH,13H
				INT 10H
				
				CALL INIT
				CALL SHOWMOUSE
				CALL OPR
				MOV AL,04H;
				CMP ANS,03H;
				JNE STA85;
				inc score;
				CALL REDRAW
				STA85:JMP QUESTION2
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				
				;PRINTING QUESTION
QUESTION2:		CALL REDRAW
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,32H ;number of characters in string
				MOV DL,0DH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,QUE2 ;give effective address of string
				MOV AH,13H
				INT 10H


				;PRINTING OPTION1
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0DH ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP2A ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION2
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0FH ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP2B ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION3
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0EH ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP2C;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION4
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,10H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP2D ;give effective address of string
				MOV AH,13H
				INT 10H
				
				CALL INIT
				CALL SHOWMOUSE
				CALL OPR
				MOV AL,04H;
				CMP ANS,02H;
				JNE STA79;
				inc score;
				CALL REDRAW
				STA79:JMP QUESTION3
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
				;PRINTING QUESTION
QUESTION3:		
				CALL REDRAW
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,2BH ;number of characters in string
				MOV DL,0DH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,QUE3 ;give effective address of string
				MOV AH,13H
				INT 10H


				;PRINTING OPTION1
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,0FH ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP3A ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION2
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,11H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP3B ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION3
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,14H ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP3C;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION4
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,11H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP3D ;give effective address of string
				MOV AH,13H
				INT 10H
				
				CALL INIT
				CALL SHOWMOUSE
				CALL OPR
				MOV AL,04H;
				CMP ANS,02H;
				JNE STA80;
				inc score
				CALL REDRAW
				STA80:JMP QUESTION4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTING QUESTION
QUESTION4:		
				CALL REDRAW
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,1EH ;number of characters in string
				MOV DL,0DH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,QUE4 ;give effective address of string
				MOV AH,13H
				INT 10H


				;PRINTING OPTION1
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,11H ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP4A ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION2
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,10H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP4B ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION3
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,11H ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP4C;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION4
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,10H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP4D ;give effective address of string
				MOV AH,13H
				INT 10H
				
				CALL INIT
				CALL SHOWMOUSE
				CALL OPR
				MOV AL,04H;
				CMP ANS,01H;
				JNE STA81;
				inc score;
				CALL REDRAW
				STA81:JMP QUESTION5
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTING QUESTION
QUESTION5:		
				CALL REDRAW
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,2DH ;number of characters in string
				MOV DL,0DH ;column index of starting
				MOV DH,07H ;row index of strting
				LEA BP,QUE5 ;give effective address of string
				MOV AH,13H
				INT 10H


				;PRINTING OPTION1
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,08H ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP5A ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION2
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,08H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,0EH ;row index of strting
				LEA BP,OP5B ;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION3
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,08H ;number of characters in string
				MOV DL,0CH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP5C;give effective address of string
				MOV AH,13H
				INT 10H

				;PRINTING OPTION4
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,09H ;number of characters in string
				MOV DL,2FH ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,OP5D ;give effective address of string
				MOV AH,13H
				INT 10H
				
				CALL INIT
				CALL SHOWMOUSE
				CALL OPR
				MOV AL,04H;
				CMP ANS,03H;
				JNE STA78;
				inc score
				CALL REDRAW
				STA78:jmp exit
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		 exit:	MOV AL,12H ;switch to graphics mode(vga-640 x 480 16 colors)
				MOV AH,00H
				INT 10H
				
				;;;;BACKGROUND WHITE
				mov cx,01h  ;cx = column(first column index)
				mov dx,01h	;dx = row(first row index)
				mov al,0fh	;al = pixel color
				mov ah,0ch	
				sta250:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,27fh	;compare column number with last column number of background
				jne sta250			
				inc dx		;increment row index
				mov cx,01h	;set first column index for new row
				cmp dx,1dfh	;compare column number with last row number of background
				jne sta250
				
				;WELCOME  BLOCK
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,46H;
				MOV DX,46H;
				STA151:INT 10H;
				INC CX;
				CMP CX,23AH; horizontal pixels:640D
				JNE STA151;
				STA152:INT 10H;
				INC DX;
				CMP DX,0AAH; Vertical pixels:480D
				JNE STA152;
				STA153:INT 10H;
				DEC CX;
				CMP CX,46H;
				JNE STA153;
				STA154:INT 10H;
				DEC DX;
				CMP DX,46H;
				JNE STA154;
				
				mov cx,47h  ;cx = column(first column index)
				mov dx,47h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta155:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,23Ah	;compare column number with last column number of background
				jne sta155		
				inc dx		;increment row index
				mov cx,47h	;set first column index for new row
				cmp dx,0AAh	;compare column number with last row number of background
				jne sta155
				
				mov cx,64h  ;cx = column(first column index)
				mov dx,64h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta156:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,21Ch	;compare column number with last column number of background
				jne sta156			
				inc dx		;increment row index
				mov cx,64h	;set first column index for new row
				cmp dx,8Ch	;compare column number with last row number of background
				jne sta156
			
				
			;write SCORE MESSAGE string on screen.......................
				MOV AL,01H ;AL = write mode(bit 1: string contains attributes)
				MOV BH,00H ;BH = page number
				MOV BL,05H ;BL = string color(atribute)Z
				MOV CX,1FH ;CX = number of characters in string
				MOV DL,1AH ;DL = column index of starting
				MOV DH,07H ;DH = row index of strting
				LEA BP,SCRMSG ;BP = give effective address of string
				MOV AH,13H
				INT 10H
				;end..................................................
					
				
				;write SCORE on screen.......................
				
				LEA SI,SCORE ;
				MOV BX,[SI];
				ADD BX,30H
				LEA DI,SCORE
				MOV [DI],BX
				MOV AL,01H ;AL = write mode(bit 1: string contains attributes)
				MOV BH,00H ;BH = page number
				MOV BL,05H ;BL = string color(atribute)
				MOV CX,01H ;CX = number of characters in string
				MOV DL,3AH ;DL = column index of starting
				MOV DH,07H ;DH = row index of strting
				LEA BP,SCORE ;BP = give effective address of string
				MOV AH,13H
				INT 10H
				;end..................................................
				
				;;;START BUTTON
				MOV AH,0CH;
				MOV AL,00H;
				MOV BX,64H;
				MOV CX,0C3H;
				MOV DX,122H;
				STA157:INT 10H;
				INC CX;
				CMP CX,1AAH; horizontal pixels:640D
				JNE STA157;
				STA158:INT 10H;
				INC DX;
				CMP DX,14AH; Vertical pixels:480D
				JNE STA158;
				STA159:INT 10H;
				DEC CX;
				CMP CX,0C3H;
				JNE STA159;
				STA160:INT 10H;
				DEC DX;
				CMP DX,122H;
				JNE STA160;
				
				mov cx,0C4h  ;cx = column(first column index)
				mov dx,123h	;dx = row(first row index)
				mov al,04h	;al = pixel color RED
				mov ah,0ch	
				sta161:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,1AAh	;compare column number with last column number of background
				jne sta161			
				inc dx		;increment row index
				mov cx,0C4h	;set first column index for new row
				cmp dx,14Ah	;compare column number with last row number of background
				jne sta161
				
				mov cx,0C7h  ;cx = column(first column index)
				mov dx,128h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta162:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,1A7h	;compare column number with last column number of background
				jne sta162			
				inc dx		;increment row index
				mov cx,0C7h	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta162
				
				;;;PRINTING START
				MOV AL,01H ;write mode(bit 1: string contains attributes)
				MOV BH,00H ;page number
				MOV BL,0FH ;string color(atribute)
				MOV CX,04H ;number of characters in string
				MOV DL,25H ;column index of starting
				MOV DH,13H ;row index of strting
				LEA BP,EXITMSG;give effective address of string
				MOV AH,13H
				INT 10H
				
		ECH:	CALL INIT
				CALL SHOWMOUSE
				CALL EXITC
				MOV AL,04H;
				CMP EC,01H;
				JNE STA198;
				JMP EXIT1;
		STA198:jmp ECH
		
		EXIT1:	mov al,03h
				mov ah,00h
				int 10h
				
				MOV AH,4CH
				INT 21H				
						
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
				REDRAW PROC FAR		
				mov cx,64h  ;cx = column(first column index)
				mov dx,64h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta61:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,21Ch	;compare column number with last column number of background
				jne sta61			
				inc dx		;increment row index
				mov cx,64h	;set first column index for new row
				cmp dx,8Ch	;compare column number with last row number of background
				jne sta61
				
				mov cx,50h  ;cx = column(first column index)
				mov dx,0D9h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta62:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,123h	;compare column number with last column number of background
				jne sta62			
				inc dx		;increment row index
				mov cx,50h	;set first column index for new row
				cmp dx,0F4h	;compare column number with last row number of background
				jne sta62
				
				mov cx,15Fh  ;cx = column(first column index)
				mov dx,0D9h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta63:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,230h	;compare column number with last column number of background
				jne sta63			
				inc dx		;increment row index
				mov cx,15Fh	;set first column index for new row
				cmp dx,0F4h	;compare column number with last row number of background
				jne sta63
				
				mov cx,50h  ;cx = column(first column index)
				mov dx,129h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta64:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,123h	;compare column number with last column number of background
				jne sta64			
				inc dx		;increment row index
				mov cx,50h	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta64
				
				mov cx,15Fh  ;cx = column(first column index)
				mov dx,129h	;dx = row(first row index)
				mov al,00h	;al = pixel color BLACK
				mov ah,0ch	
				sta65:int 10h	;set pixel color
				inc cx		;incriment column number
				cmp cx,230h	;compare column number with last column number of background
				jne sta65			
				inc dx		;increment row index
				mov cx,15Fh	;set first column index for new row
				cmp dx,145h	;compare column number with last row number of background
				jne sta65
				ret
			REDRAW ENDP
						
			INIT PROC FAR
				STA70:  MOV AX,0000H;
						INT 33H
						CMP AX,0000H;
						JE STA70
			RET
			ENDP	
						
			SHOWMOUSE PROC FAR
						MOV AX,0001H;
						INT 33H;
						RET
			ENDP
			
			CLICK PROC FAR
				STA71:	MOV AX,0003H;
						INT 33H;
						CMP BX,0001H;
						JNE STA71;
						RET
			ENDP
			
			OPR PROC FAR
			STA72:	CALL CLICK;
					CMP DX,0D2H;
					JC STA72;
					CMP DX,0FAH
					JNC STA73;
					CMP CX,46H;
					JC STA72;
					CMP CX,12CH;
					JNC STA75;
					MOV ANS,01H;
					JMP RE;
				STA75:CMP CX,154H;
					JC STA72;
					CMP CX,23AH;
					JNC STA72;
					MOV ANS,02H;
					JMP RE;
			STA73:	CMP DX,122H;
					JC STA72;
					CMP DX,14AH;
					JNC STA72;
					CMP CX,46H;
					JC STA72;
					CMP CX,12CH;
					JNC STA76;
					MOV ANS,03H;
					JMP RE;
				STA76:CMP CX,154H;
					JC STA72;
					CMP CX,23AH;
					JNC STA72;
					MOV ANS,04H;
					JMP RE;
					RE:RET;					
					ENDP
					
				STARTC PROC FAR
				STA122:	CALL CLICK;
					CMP DX,122H;
					JC STA122;
					CMP DX,14AH
					JNC STA122;
					CMP CX,0C3H;
					JC STA122;
					CMP CX,1AAH;
					JNC STA122;
					MOV SC,01H;
					JMP RE1;					
					RE1:RET
					ENDP
					
				EXITC PROC FAR
				STA262:	CALL CLICK;
					CMP DX,122H;
					JC STA262;
					CMP DX,14AH
					JNC STA262;
					CMP CX,0C3H;
					JC STA262;
					CMP CX,1AAH;
					JNC STA262;
					MOV EC,01H;
					JMP RE2;					
					RE2:RET
					ENDP	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
										
CODE ENDS
END FIRST
END START
