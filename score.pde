class Score {
  PImage haogandoImg, heart;
  int textX = 200, textY = 10;
  int img = 0;
  int value = 1;
  int time;
  int [] gameWin = {0, 0, 0, 0};

  Score() {
    haogandoImg = loadImage("img/通用文字、按鈕/heart_text.png");
    heart = loadImage("img/素材包/heart1.png");
  }

  void draw() {
    image(haogandoImg, textX, textY);

    if (isWin1==true) {
      gameWin[0] = 1;
    }
    if(bur==1 && mad==0){
      gameWin[1] = 1;
    }
    if(win==1){
      gameWin[2] = 1;
    }

    value = 1+gameWin[0]+gameWin[1]+gameWin[2]+gameWin[3];

    for (int a=0; a<value; a++) {
      image(heart, textX+110+35*a, textY+12);
    }
  }
}