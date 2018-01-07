#line 1 "C:/Users/Tiago/Documents/MikroC PRO/GLCD/Snake.c"
#line 1 "c:/users/tiago/documents/mikroc pro/glcd/snake_bmp.c"
const code char snake_img[1024] = {
0, 0, 248, 56, 224, 0, 224, 56, 248, 232, 0, 192, 32, 32, 32, 64, 0, 224, 32, 192, 32, 32, 32, 192, 192, 32, 32, 32, 64, 192, 32, 32, 32, 192, 224, 32, 32, 192, 0, 32, 240, 32, 0, 224, 32, 192, 32, 32, 32, 192, 248, 0, 32, 160, 160, 160, 224, 224, 32, 32, 192, 0, 192, 32, 32, 248, 0, 192, 32, 32, 32, 192, 64, 224, 160, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 192, 192, 224, 48, 144, 88, 120, 60, 148, 156, 12, 8, 142, 142, 26, 50, 100, 52, 156, 152, 72, 88, 152, 16, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 3, 0, 1, 2, 1, 0, 3, 3, 0, 1, 2, 2, 2, 1, 0, 3, 0, 1, 2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2, 1, 3, 0, 0, 3, 0, 0, 3, 2, 0, 3, 0, 1, 2, 2, 2, 1, 3, 0, 3, 2, 2, 2, 3, 3, 0, 0, 3, 0, 1, 2, 2, 3, 0, 1, 2, 2, 2, 1, 1, 2, 2, 1, 240, 188, 132, 150, 22, 179, 163, 45, 27, 77, 179, 83, 70, 142, 134, 138, 143, 137, 28, 55, 225, 228, 228, 38, 16, 24, 29, 18, 15, 6, 5, 38, 40, 108, 103, 105, 22, 159, 162, 58, 86, 252, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 144, 144, 144, 32, 0, 240, 96, 128, 0, 240, 0, 0, 128, 96, 16, 96, 128, 0, 240, 128, 64, 32, 16, 0, 240, 144, 144, 144, 144, 0, 0, 0, 0, 224, 16, 16, 144, 160, 0, 0, 128, 96, 16, 96, 128, 240, 112, 192, 0, 192, 112, 240, 0, 240, 144, 144, 144, 144, 0, 0, 0, 1, 3, 6, 5, 13, 10, 20, 19, 24, 40, 55, 106, 170, 42, 226, 106, 114, 253, 97, 37, 25, 225, 3, 2, 4, 12, 8, 16, 32, 192, 128, 0, 0, 128, 64, 64, 128, 128, 0, 1, 3, 2, 5, 11, 26, 36, 24, 48, 192, 0, 0, 0,
0, 0, 0, 0, 0, 0, 4, 128, 128, 8, 0, 32, 32, 72, 82, 148, 36, 68, 131, 0, 7, 0, 0, 3, 7, 0, 4, 3, 1, 1, 1, 3, 4, 7, 0, 1, 2, 4, 0, 7, 4, 4, 4, 4, 0, 0, 0, 0, 3, 4, 4, 132, 131, 128, 4, 131, 129, 129, 33, 163, 135, 160, 35, 36, 35, 0, 71, 64, 7, 132, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 6, 25, 49, 213, 41, 32, 255, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 2, 5, 94, 236, 13, 154, 247, 241, 22, 16, 0, 32, 0, 82, 241, 80, 57, 15, 0, 0,
0, 0, 0, 0, 0, 0, 0, 1, 2, 5, 9, 250, 140, 152, 48, 96, 128, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 129, 224, 48, 24, 56, 28, 236, 68, 92, 68, 76, 84, 236, 28, 85, 45, 154, 88, 112, 176, 32, 64, 192, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 31, 245, 147, 90, 222, 20, 60, 196, 136, 136, 136, 188, 140, 8, 12, 23, 57, 240, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 128, 192, 64, 96, 176, 176, 136, 196, 119, 40, 54, 21, 12, 7, 0, 0, 0, 224, 248, 36, 186, 158, 113, 47, 43, 39, 22, 98, 214, 74, 220, 60, 152, 80, 48, 96, 192, 128, 0, 0, 0, 0, 0, 0, 0, 0, 255, 214, 213, 88, 71, 189, 96, 161, 33, 28, 227, 129, 1, 3, 2, 4, 10, 23, 41, 114, 213, 148, 12, 35, 83, 87, 86, 172, 120, 16, 224, 192, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 255, 235, 33, 173, 76, 18, 17, 224, 15, 242, 97, 99, 76, 88, 96, 192, 129, 6, 9, 22, 16, 36, 8, 48, 0, 8, 0, 4, 2, 4, 0, 0,
0, 0, 0, 15, 16, 41, 70, 75, 148, 187, 36, 92, 184, 216, 208, 240, 16, 64, 160, 112, 157, 246, 9, 234, 6, 19, 8, 232, 40, 40, 6, 28, 177, 195, 6, 26, 53, 197, 157, 102, 66, 155, 166, 158, 104, 24, 208, 48, 112, 111, 201, 17, 245, 18, 9, 0, 1, 255, 225, 33, 97, 49, 54, 28, 240, 128, 0, 0, 0, 0, 1, 3, 7, 13, 25, 55, 104, 67, 146, 186, 101, 67, 29, 23, 30, 236, 60, 24, 104, 152, 88, 24, 56, 76, 158, 149, 26, 18, 2, 130, 70, 58, 2, 129, 224, 191, 20, 144, 144, 144, 140, 140, 143, 223, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 4, 4, 5, 2, 4, 13, 12, 8, 10, 9, 8, 8, 4, 11, 10, 0, 4, 2, 1, 0, 0, 0, 0, 0, 1, 3, 6, 4, 8, 8, 19, 4, 20, 25, 26, 26, 25, 22, 19, 16, 16, 8, 20, 23, 17, 16, 24, 8, 8, 4, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 2, 4, 4, 8, 11, 28, 20, 20, 16, 32, 36, 36, 34, 33, 32, 33, 33, 81, 56, 104, 100, 98, 33, 33, 41, 41, 41, 25, 17, 4, 12, 6, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
#line 5 "C:/Users/Tiago/Documents/MikroC PRO/GLCD/Snake.c"
char GLCD_DataPort at PORTC;

sbit GLCD_CS1 at RB0_bit;
sbit GLCD_CS2 at RB1_bit;
sbit GLCD_RS at RB2_bit;
sbit GLCD_RW at RB3_bit;
sbit GLCD_EN at RB4_bit;
sbit GLCD_RST at RB5_bit;

sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction at TRISB2_bit;
sbit GLCD_RW_Direction at TRISB3_bit;
sbit GLCD_EN_Direction at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;

 unsigned char  SNAKE[40][2];
 unsigned char  dir = 2;
 unsigned char  food[2], LENGTH_SNAKE = 5;
 unsigned char  posX, posY = 1;
 unsigned char  score, *score_txt = "Score: 00";
 unsigned char  i;

void criar_comida(){
food[0] = rand()/264 + 1;
food[1] = rand()/700 + 1;
Glcd_Dot(food[0], food[1], 1);
}

void gameover(){
 LENGTH_SNAKE = 5;
 PosX = 1;
 PosY = 1;
 score = 0;
 score_txt[8] = '0';
 dir = 2;
 Glcd_Fill(0xFF);
 Glcd_Write_Text("GAME OVER !!!",25,3,0);
 delay_ms(1000);
}

void main() {
 TRISD = 255;
 Glcd_Init();
 Glcd_Image(snake_img);
 delay_ms(4000);
 Inicio:
 Glcd_Fill(0x00);
 criar_comida();

 for(i=0;i<5;i++){
 Glcd_Dot(i,0,1);
 }

 Glcd_Rectangle(0,0,127,50, 1);
 Glcd_Write_Text(score_txt,0,7,1);

 while(1){
 if(PORTD.F0==1) dir = 3;
 if(PORTD.F1==1) dir = 2;
 if(PORTD.F2==1) dir = 1;
 if(PORTD.F3==1) dir = 0;

 if(PORTD.F4==1){
 gameover();
 goto Inicio;
 }


 if(dir==2){
 PosX++;
 if(PosX>126){ gameOver(); goto Inicio; }
 SNAKE[LENGTH_SNAKE - 1][0] = PosX;
 SNAKE[LENGTH_SNAKE - 1][1] = PosY;
 for(i=0; i<length_snake - 1; i++){
 SNAKE[i][0] = SNAKE[i+1][0];
 SNAKE[i][1] = SNAKE[i+1][1];
 }
 }


 if(dir==3){
 PosY++;
 if(PosY>49){ gameOver(); goto Inicio; }
 SNAKE[LENGTH_SNAKE - 1][1] = PosY;
 SNAKE[LENGTH_SNAKE - 1][0] = PosX;
 for(i=0; i<length_snake - 1; i++){
 SNAKE[i][1] = SNAKE[i+1][1];
 SNAKE[i][0] = SNAKE[i+1][0];
 }
 }


 if(dir==1){
 PosY--;
 if(PosY<1){ gameOver(); goto Inicio; }
 SNAKE[LENGTH_SNAKE - 1][1] = PosY;
 SNAKE[LENGTH_SNAKE - 1][0] = PosX;
 for(i=0; i<LENGTH_SNAKE - 1; i++){
 SNAKE[i][1] = SNAKE[i+1][1];
 SNAKE[i][0] = SNAKE[i+1][0];

 }
 }


 if(dir==0){
 PosX--;
 if(PosX<1){ gameOver(); goto Inicio; }
 SNAKE[LENGTH_SNAKE - 1][1] = PosY;
 SNAKE[LENGTH_SNAKE - 1][0] = PosX;
 for(i=0; i<LENGTH_SNAKE - 1; i++){
 SNAKE[i][1] = SNAKE[i+1][1];
 SNAKE[i][0] = SNAKE[i+1][0];

 }
 }


 for(i=0;i<LENGTH_SNAKE;i++){
 Glcd_Dot(SNAKE[i][0], SNAKE[i][1], 1);
 }

 Glcd_Dot(SNAKE[0][0], SNAKE[0][1], 0);


 if(PosX==food[0] && PosY==food[1]){
 LENGTH_SNAKE++;
 if(LENGTH_SNAKE>=38){
 LENGTH_SNAKE=5;
 PosX = 1;
 PosY = 1;
 score = 0;
 dir = 2;
 Glcd_Fill(0xFF);
 Glcd_Write_Text("VOCE GANHOU !!!",25,3,0);
 delay_ms(2000);
 goto Inicio;
 }
 criar_comida();
 score++;
 score_txt[7] = score/10 + 48;
 score_txt[8] = score%10 + 48;
 Glcd_Write_Text(score_txt, 0,7,1);
 }

 for(i = 0; i<450/LENGTH_SNAKE; i++){
 delay_ms(1);
 }
 }
}
