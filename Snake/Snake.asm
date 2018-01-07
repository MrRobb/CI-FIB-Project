
_criar_comida:

;Snake.c,28 :: 		void criar_comida(){
;Snake.c,29 :: 		food[0] = rand()/264 + 1;
	CALL       _rand+0
	MOVLW      8
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	INCF       R0+0, 0
	MOVWF      _food+0
;Snake.c,30 :: 		food[1] = rand()/700 + 1;
	CALL       _rand+0
	MOVLW      188
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _food+1
;Snake.c,31 :: 		Glcd_Dot(food[0], food[1], 1);
	MOVF       _food+0, 0
	MOVWF      FARG_Glcd_Dot_x_pos+0
	MOVF       R0+0, 0
	MOVWF      FARG_Glcd_Dot_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Dot_color+0
	CALL       _Glcd_Dot+0
;Snake.c,32 :: 		}
L_end_criar_comida:
	RETURN
; end of _criar_comida

_gameover:

;Snake.c,34 :: 		void gameover(){
;Snake.c,35 :: 		LENGTH_SNAKE = 5;
	MOVLW      5
	MOVWF      _LENGTH_SNAKE+0
;Snake.c,36 :: 		PosX = 1;
	MOVLW      1
	MOVWF      _posX+0
;Snake.c,37 :: 		PosY = 1;
	MOVLW      1
	MOVWF      _posY+0
;Snake.c,38 :: 		score = 0;
	CLRF       _score+0
;Snake.c,39 :: 		score_txt[8] = '0';
	MOVLW      8
	ADDWF      _score_txt+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
;Snake.c,40 :: 		dir = 2;
	MOVLW      2
	MOVWF      _dir+0
;Snake.c,41 :: 		Glcd_Fill(0xFF);
	MOVLW      255
	MOVWF      FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;Snake.c,42 :: 		Glcd_Write_Text("GAME OVER !!!",25,3,0);
	MOVLW      ?lstr2_Snake+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      25
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      3
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	CLRF       FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;Snake.c,43 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_gameover0:
	DECFSZ     R13+0, 1
	GOTO       L_gameover0
	DECFSZ     R12+0, 1
	GOTO       L_gameover0
	DECFSZ     R11+0, 1
	GOTO       L_gameover0
	NOP
;Snake.c,44 :: 		}
L_end_gameover:
	RETURN
; end of _gameover

_main:

;Snake.c,46 :: 		void main() {
;Snake.c,47 :: 		TRISD = 255;
	MOVLW      255
	MOVWF      TRISD+0
;Snake.c,48 :: 		Glcd_Init();
	CALL       _Glcd_Init+0
;Snake.c,49 :: 		Glcd_Image(snake_img);
	MOVLW      _snake_img+0
	MOVWF      FARG_Glcd_Image_image+0
	MOVLW      hi_addr(_snake_img+0)
	MOVWF      FARG_Glcd_Image_image+1
	CALL       _Glcd_Image+0
;Snake.c,50 :: 		delay_ms(4000);
	MOVLW      82
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      0
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;Snake.c,51 :: 		Inicio:
___main_Inicio:
;Snake.c,52 :: 		Glcd_Fill(0x00);
	CLRF       FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;Snake.c,53 :: 		criar_comida();
	CALL       _criar_comida+0
;Snake.c,55 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
L_main2:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Snake.c,56 :: 		Glcd_Dot(i,0,1);
	MOVF       _i+0, 0
	MOVWF      FARG_Glcd_Dot_x_pos+0
	CLRF       FARG_Glcd_Dot_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Dot_color+0
	CALL       _Glcd_Dot+0
;Snake.c,55 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
;Snake.c,57 :: 		}
	GOTO       L_main2
L_main3:
;Snake.c,59 :: 		Glcd_Rectangle(0,0,127,50, 1);
	CLRF       FARG_Glcd_Rectangle_x_upper_left+0
	CLRF       FARG_Glcd_Rectangle_y_upper_left+0
	MOVLW      127
	MOVWF      FARG_Glcd_Rectangle_x_bottom_right+0
	MOVLW      50
	MOVWF      FARG_Glcd_Rectangle_y_bottom_right+0
	MOVLW      1
	MOVWF      FARG_Glcd_Rectangle_color+0
	CALL       _Glcd_Rectangle+0
;Snake.c,60 :: 		Glcd_Write_Text(score_txt,0,7,1);
	MOVF       _score_txt+0, 0
	MOVWF      FARG_Glcd_Write_Text_text+0
	CLRF       FARG_Glcd_Write_Text_x_pos+0
	MOVLW      7
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;Snake.c,62 :: 		while(1){
L_main5:
;Snake.c,63 :: 		if(PORTD.F0==1)  dir = 3;
	BTFSS      PORTD+0, 0
	GOTO       L_main7
	MOVLW      3
	MOVWF      _dir+0
L_main7:
;Snake.c,64 :: 		if(PORTD.F1==1)  dir = 2;
	BTFSS      PORTD+0, 1
	GOTO       L_main8
	MOVLW      2
	MOVWF      _dir+0
L_main8:
;Snake.c,65 :: 		if(PORTD.F2==1)  dir = 1;
	BTFSS      PORTD+0, 2
	GOTO       L_main9
	MOVLW      1
	MOVWF      _dir+0
L_main9:
;Snake.c,66 :: 		if(PORTD.F3==1)  dir = 0;
	BTFSS      PORTD+0, 3
	GOTO       L_main10
	CLRF       _dir+0
L_main10:
;Snake.c,68 :: 		if(PORTD.F4==1){
	BTFSS      PORTD+0, 4
	GOTO       L_main11
;Snake.c,69 :: 		gameover();
	CALL       _gameover+0
;Snake.c,70 :: 		goto Inicio;
	GOTO       ___main_Inicio
;Snake.c,71 :: 		}
L_main11:
;Snake.c,74 :: 		if(dir==2){
	MOVF       _dir+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Snake.c,75 :: 		PosX++;
	INCF       _posX+0, 1
;Snake.c,76 :: 		if(PosX>126){ gameOver(); goto Inicio; }
	MOVF       _posX+0, 0
	SUBLW      126
	BTFSC      STATUS+0, 0
	GOTO       L_main13
	CALL       _gameover+0
	GOTO       ___main_Inicio
L_main13:
;Snake.c,77 :: 		SNAKE[LENGTH_SNAKE - 1][0] = PosX;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       _posX+0, 0
	MOVWF      INDF+0
;Snake.c,78 :: 		SNAKE[LENGTH_SNAKE - 1][1] = PosY;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       _posY+0, 0
	MOVWF      INDF+0
;Snake.c,79 :: 		for(i=0; i<length_snake - 1; i++){
	CLRF       _i+0
L_main14:
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       R1+0, 0
	SUBWF      _i+0, 0
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;Snake.c,80 :: 		SNAKE[i][0] = SNAKE[i+1][0];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,81 :: 		SNAKE[i][1] = SNAKE[i+1][1];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,79 :: 		for(i=0; i<length_snake - 1; i++){
	INCF       _i+0, 1
;Snake.c,82 :: 		}
	GOTO       L_main14
L_main15:
;Snake.c,83 :: 		}
L_main12:
;Snake.c,86 :: 		if(dir==3){
	MOVF       _dir+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Snake.c,87 :: 		PosY++;
	INCF       _posY+0, 1
;Snake.c,88 :: 		if(PosY>49){ gameOver(); goto Inicio; }
	MOVF       _posY+0, 0
	SUBLW      49
	BTFSC      STATUS+0, 0
	GOTO       L_main18
	CALL       _gameover+0
	GOTO       ___main_Inicio
L_main18:
;Snake.c,89 :: 		SNAKE[LENGTH_SNAKE - 1][1] = PosY;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       _posY+0, 0
	MOVWF      INDF+0
;Snake.c,90 :: 		SNAKE[LENGTH_SNAKE - 1][0] = PosX;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       _posX+0, 0
	MOVWF      INDF+0
;Snake.c,91 :: 		for(i=0; i<length_snake - 1; i++){
	CLRF       _i+0
L_main19:
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       R1+0, 0
	SUBWF      _i+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;Snake.c,92 :: 		SNAKE[i][1] = SNAKE[i+1][1];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,93 :: 		SNAKE[i][0] = SNAKE[i+1][0];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,91 :: 		for(i=0; i<length_snake - 1; i++){
	INCF       _i+0, 1
;Snake.c,94 :: 		}
	GOTO       L_main19
L_main20:
;Snake.c,95 :: 		}
L_main17:
;Snake.c,98 :: 		if(dir==1){
	MOVF       _dir+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;Snake.c,99 :: 		PosY--;
	DECF       _posY+0, 1
;Snake.c,100 :: 		if(PosY<1){ gameOver(); goto Inicio; }
	MOVLW      1
	SUBWF      _posY+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
	CALL       _gameover+0
	GOTO       ___main_Inicio
L_main23:
;Snake.c,101 :: 		SNAKE[LENGTH_SNAKE - 1][1] = PosY;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       _posY+0, 0
	MOVWF      INDF+0
;Snake.c,102 :: 		SNAKE[LENGTH_SNAKE - 1][0] = PosX;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       _posX+0, 0
	MOVWF      INDF+0
;Snake.c,103 :: 		for(i=0; i<LENGTH_SNAKE - 1; i++){
	CLRF       _i+0
L_main24:
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       R1+0, 0
	SUBWF      _i+0, 0
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;Snake.c,104 :: 		SNAKE[i][1] = SNAKE[i+1][1];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,105 :: 		SNAKE[i][0] = SNAKE[i+1][0];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,103 :: 		for(i=0; i<LENGTH_SNAKE - 1; i++){
	INCF       _i+0, 1
;Snake.c,107 :: 		}
	GOTO       L_main24
L_main25:
;Snake.c,108 :: 		}
L_main22:
;Snake.c,111 :: 		if(dir==0){
	MOVF       _dir+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;Snake.c,112 :: 		PosX--;
	DECF       _posX+0, 1
;Snake.c,113 :: 		if(PosX<1){ gameOver(); goto Inicio; }
	MOVLW      1
	SUBWF      _posX+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main28
	CALL       _gameover+0
	GOTO       ___main_Inicio
L_main28:
;Snake.c,114 :: 		SNAKE[LENGTH_SNAKE - 1][1] = PosY;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       _posY+0, 0
	MOVWF      INDF+0
;Snake.c,115 :: 		SNAKE[LENGTH_SNAKE - 1][0] = PosX;
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       _posX+0, 0
	MOVWF      INDF+0
;Snake.c,116 :: 		for(i=0; i<LENGTH_SNAKE - 1; i++){
	CLRF       _i+0
L_main29:
	MOVLW      1
	SUBWF      _LENGTH_SNAKE+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       R1+0, 0
	SUBWF      _i+0, 0
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;Snake.c,117 :: 		SNAKE[i][1] = SNAKE[i+1][1];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,118 :: 		SNAKE[i][0] = SNAKE[i+1][0];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      R5+0
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R3+0
	CLRF       R3+1
	BTFSC      STATUS+0, 0
	INCF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _SNAKE+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,116 :: 		for(i=0; i<LENGTH_SNAKE - 1; i++){
	INCF       _i+0, 1
;Snake.c,120 :: 		}
	GOTO       L_main29
L_main30:
;Snake.c,121 :: 		}
L_main27:
;Snake.c,124 :: 		for(i=0;i<LENGTH_SNAKE;i++){
	CLRF       _i+0
L_main32:
	MOVF       _LENGTH_SNAKE+0, 0
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;Snake.c,125 :: 		Glcd_Dot(SNAKE[i][0], SNAKE[i][1], 1);
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SNAKE+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Glcd_Dot_x_pos+0
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Glcd_Dot_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Dot_color+0
	CALL       _Glcd_Dot+0
;Snake.c,124 :: 		for(i=0;i<LENGTH_SNAKE;i++){
	INCF       _i+0, 1
;Snake.c,126 :: 		}
	GOTO       L_main32
L_main33:
;Snake.c,128 :: 		Glcd_Dot(SNAKE[0][0], SNAKE[0][1], 0);//limpa o rastro deixado pela cobra
	MOVF       _SNAKE+0, 0
	MOVWF      FARG_Glcd_Dot_x_pos+0
	MOVF       _SNAKE+1, 0
	MOVWF      FARG_Glcd_Dot_y_pos+0
	CLRF       FARG_Glcd_Dot_color+0
	CALL       _Glcd_Dot+0
;Snake.c,131 :: 		if(PosX==food[0] && PosY==food[1]){
	MOVF       _posX+0, 0
	XORWF      _food+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _posY+0, 0
	XORWF      _food+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main37
L__main44:
;Snake.c,132 :: 		LENGTH_SNAKE++;
	INCF       _LENGTH_SNAKE+0, 1
;Snake.c,133 :: 		if(LENGTH_SNAKE>=38){//caso voce chegue ao nivel maximo
	MOVLW      38
	SUBWF      _LENGTH_SNAKE+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main38
;Snake.c,134 :: 		LENGTH_SNAKE=5;
	MOVLW      5
	MOVWF      _LENGTH_SNAKE+0
;Snake.c,135 :: 		PosX = 1;
	MOVLW      1
	MOVWF      _posX+0
;Snake.c,136 :: 		PosY = 1;
	MOVLW      1
	MOVWF      _posY+0
;Snake.c,137 :: 		score = 0;
	CLRF       _score+0
;Snake.c,138 :: 		dir = 2;
	MOVLW      2
	MOVWF      _dir+0
;Snake.c,139 :: 		Glcd_Fill(0xFF);
	MOVLW      255
	MOVWF      FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;Snake.c,140 :: 		Glcd_Write_Text("VOCE GANHOU !!!",25,3,0);
	MOVLW      ?lstr3_Snake+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      25
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      3
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	CLRF       FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;Snake.c,141 :: 		delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
;Snake.c,142 :: 		goto Inicio;
	GOTO       ___main_Inicio
;Snake.c,143 :: 		}
L_main38:
;Snake.c,144 :: 		criar_comida();
	CALL       _criar_comida+0
;Snake.c,145 :: 		score++;
	INCF       _score+0, 1
;Snake.c,146 :: 		score_txt[7] = score/10 + 48;
	MOVLW      7
	ADDWF      _score_txt+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _score+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,147 :: 		score_txt[8] = score%10 + 48;
	MOVLW      8
	ADDWF      _score_txt+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _score+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Snake.c,148 :: 		Glcd_Write_Text(score_txt, 0,7,1);
	MOVF       _score_txt+0, 0
	MOVWF      FARG_Glcd_Write_Text_text+0
	CLRF       FARG_Glcd_Write_Text_x_pos+0
	MOVLW      7
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;Snake.c,149 :: 		}
L_main37:
;Snake.c,151 :: 		for(i = 0; i<450/LENGTH_SNAKE; i++){
	CLRF       _i+0
L_main40:
	MOVF       _LENGTH_SNAKE+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	MOVLW      194
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       R0+0, 0
	SUBWF      _i+0, 0
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L_main41
;Snake.c,152 :: 		delay_ms(1);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	NOP
;Snake.c,151 :: 		for(i = 0; i<450/LENGTH_SNAKE; i++){
	INCF       _i+0, 1
;Snake.c,153 :: 		}
	GOTO       L_main40
L_main41:
;Snake.c,154 :: 		}
	GOTO       L_main5
;Snake.c,155 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
