class GameState
{
  static final int START = 0;
  static final int INTRO = 1;
  static final int NAME = 2;
  static final int STAGE_1 = 3;
  static final int STAGE_2 = 4;
  static final int STAGE_3 = 5;
  static final int STAGE_4 = 6;
  static final int STAGE_5 = 7;
  static final int END = 8;
}

class Direction
{
  static final int LEFT = 0;
  static final int RIGHT = 1;
  static final int UP = 2;
  static final int DOWN = 3;
}

/* 3 */
Car [] car = new Car[10];
int[] road=new int[100];
couple gee;
int c=1;
PImage imgboom;
int wait=0;
int walk=0;
int win=0;
PImage s3_text;
PImage s3;
PImage wait1;
PImage wait2;
PImage walk1;
PImage walk2;
PImage win1;
PImage win2;
PImage cimg1, cimg2, cimg3, cimg4, cimg5, cimg6;
float peoplex, peopley;

/* 2 */
int numFrames=5;
int bnumFrames=4;
int currentFrame;
PImage [] images = new PImage[numFrames];
PImage [] bimages = new PImage[bnumFrames];
PImage s2_text;
PImage burp;
PImage rude;
PImage girle1, girle2, girlm1, girlm2;
PImage s2;
int i;
int x;
int mad=0;
int girle=0;
int girlm=0;
int bur=0;
PFont word;
boolean isStop_2 = false;

/* 4 */
//Button button;
//Timer timer;
//Fire fire;
//Home home;
//Sea sea;
int start = 0;
final int  CHOOSE=0, STARTFIRE=1, STARTHOME=2, STARTSEA=3;
PImage stage4, nextTime, proposal, but1, but2, but3, stage4text;

/* comment */
PImage one, two, three, four;


PImage title_img, intro_img, name_img; //START
PImage s1, s1_text;
boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;
boolean mailClick = false;

int state = GameState.START, s = 0;
boolean isWin1 = false;

int timeWait = 3000;
int time;

Boy boy;
Mailgirl mailgirl;
Score score;
Line line;
String name = "", Girl = "Amy";
Button gameStart, intro;
Button [] mail = new Button[5];

void setup () {
  size(500, 500);
  boy = new Boy();
  mailgirl = new Mailgirl();
  score = new Score();
  line = new Line();
  title_img = loadImage("img/開頭/title.png");
  intro_img = loadImage("img/開頭/intro.png");
  name_img = loadImage("img/開頭/enter_name.png");
  s1 = loadImage("img/stage 1/stage1.png");
  s1_text = loadImage("img/stage 1/stage1_text.png");
  gameStart = new Button("img/開頭/start_button", 300, 400);
  intro = new Button("img/開頭/intro_button", 100, 400);
  for (int a=0; a<5; a++)
    mail[a] = new Button("img/stage 1/letter", 85+a*75, 220);

  one = loadImage("img/評語/comment_01.png");
  two = loadImage("img/評語/comment_2.png");
  three = loadImage("img/評語/comment_3.png");
  four = loadImage("img/評語/comment_45.png");


  /* 2 */
  s2 = loadImage ("img/stage 2/stage2.png");
  s2_text = loadImage ("img/stage 2/stage2_text.png");
  burp = loadImage ("img/stage 2/burp.PNG");
  rude = loadImage ("img/stage 2/rude.PNG");
  girle1 = loadImage ("img/stage 2/gfEating1.PNG");
  girle2 = loadImage ("img/stage 2/gfEating2.PNG");
  girlm1 = loadImage ("img/stage 2/gfMad1.PNG");
  girlm2 = loadImage ("img/stage 2/gfMad2.PNG");
  currentFrame = 0;
  word = createFont("img/stage 2/Arial", 24);
  for (int i=0; i<numFrames; i++) {
    images[i] = loadImage("img/stage 2/bfBurp" + (i*2+1) + ".PNG");
  }
  for (int i=0; i<bnumFrames; i++) {
    bimages[i] = loadImage("img/stage 2/bfBurp" + (i*2+2) + ".PNG");
  }
  frameRate(60);

  /* 3 */
  s3_text = loadImage ("img/stage 3/stage3_text.png");
  s3 = loadImage ("img/stage 3/stage3.png");
  imgboom = loadImage ("img/stage 3/blood.png");
  wait1 = loadImage ("img/stage 3/waiting1.PNG");
  wait2 = loadImage ("img/stage 3/waiting2.PNG");
  win1 = loadImage ("img/stage 3/win1.PNG");
  win2 = loadImage ("img/stage 3/win2.PNG");
  walk1 = loadImage ("img/stage 3/walking1.PNG");
  walk2 = loadImage ("img/stage 3/walking2.PNG");
  cimg1 = loadImage("img/stage 3/car1.PNG");
  cimg2 = loadImage("img/stage 3/car2.PNG");
  cimg3 = loadImage("img/stage 3/car3.PNG");
  cimg4 = loadImage("img/stage 3/car4.PNG");
  cimg5 = loadImage("img/stage 3/car5.PNG");
  cimg6 = loadImage("img/stage 3/car6.PNG");
  car[0]=new Car(-20, 0, 1, cimg1, 560);
  car[1]=new Car(530, 0, -5, cimg2, -40);
  car[2]=new Car(530, 0, -3, cimg3, -40);
  car[3]=new Car(-20, 0, 2, cimg4, 550);
  car[4]=new Car(522, 0, -4, cimg5, -50);
  car[5]=new Car(-10, 0, 5, cimg6, 550);
  gee = new couple(width/2, 85);
  for (int i=0; i<6; i++)
  {
    road[i]=0;
  }

  /* 4 */
  //fire = new Fire();
  //home = new Home();
  //timer = new Timer(0);
  //sea= new Sea();
  stage4=loadImage("img/stage 4/stage4.png");
  stage4text=loadImage("img/stage 4/stage4_text.png");
  nextTime=loadImage("img/stage 4/button_nexttime.png");
  proposal=loadImage("img/stage 4/button_proposal.png");
  but1=loadImage("img/stage 4/stage4_button1.png");
  but2=loadImage("img/stage 4/stage4_button2.png");
  but3=loadImage("img/stage 4/stage4_button3.png");

  //image(stage4text,0,0);
}

void draw() {
  background(255);
  switch(state) {
  case GameState.START:
    image(title_img, 20, 70);
    gameStart.display();
    intro.display();
    break;
  case GameState.INTRO:
    image(intro_img, 70, 150);
    textSize(15);
    textAlign(CENTER);
    text("press enter back to title", 250, 450);
    break;
  case GameState.NAME:
    image(name_img, 80, 80);
    if (name!=null) {
      textSize(50); 
      fill(0);
      textAlign(CENTER);
      text(name, 250, 180);
    }
    if (Girl!=null) {
      textSize(50); 
      fill(0);
      textAlign(CENTER);
      text(Girl, 250, 375);
    }
    break;
  case GameState.STAGE_1:
    if (millis()-time <= timeWait) {
      image(s1_text, 140, 190);
      textSize(25); 
      fill(0);
      text(Girl, 140+115, 190+28);
      text(Girl, 140+172, 190+128);
    } else {
      line.draw();
      line.redLine();
      if (!mailClick) {
        for (int a=0; a<5; a++)
          mail[a].display();
      }
      boy.draw();
      mailgirl.draw();
      score.draw();
      if (mailClick)
        line.move();
      break;
    }
    break;
  case GameState.STAGE_2:
    if (millis()-time <= timeWait) {
      image(s2_text, 80, 170);
      textSize(20); 
      fill(0);
      text(Girl, 80+116, 170+28);
      //text(Girl, 140+172, 190+128);
    } else {
      if (!isStop_2) {
        image(s2, 0, 0);
        /*if (frameCount % 30 !=0 && bur==1 && i!=0 ) {
         image(burp, 180, 300);
         mad=0;
         } else if (frameCount % 30 !=0 && bur==1 && i==0 )
         {
         image(burp, 180, 300);
         mad=1;
         } else {
         bur=0;
         }*/

        if (frameCount % 20 !=0 &&girle==0&& mad==0 ) {
          image(girle1, 300, 300);
        } else if (frameCount % 20 ==0 &&girle==0&& mad==0 ) {
          girle++;
        } else if (frameCount % 20 !=0 &&girle==1&& mad==0 ) {
          image(girle2, 300, 300);
        } else if (frameCount % 20 ==0&&girle==1&& mad==0 ) {
          girle--;
        } else if (frameCount % 20 !=0 &&girlm==0 && mad==1 ) {
          image(girlm1, 300, 300);
          image(rude, 300, 250);
        } else if (frameCount % 20 ==0 &&girlm==0&& mad==1 ) {
          girlm++;
        } else if (frameCount % 20 !=0 &&girlm==1&& mad==1 ) {
          image(girlm2, 300, 300);
          image(rude, 300, 250);
        } else if (frameCount % 20 ==0&&girlm==1&& mad==1 ) {
          girlm--;
        }

        if (frameCount % (30) == 0) {
          i = (currentFrame ++) % numFrames;
        } else {
          if (bur==0||(bur==1&&i==4))
            image(images[i], 100, 300);
          else if (bur==1&&i==0)
            image(bimages[0], 100, 300);
          else if (bur==1&&i==1)
            image(bimages[1], 100, 300);
          else if (bur==1&&i==2)
            image(bimages[2], 100, 300);
          else if (bur==1&&i==3)
            image(bimages[3], 100, 300);
        }
      } else {
        if (girle==0&& mad==0 ) {
          image(girle1, 300, 300);
        } else if (girle==0&& mad==0 ) {
          girle++;
        } else if (girle==1&& mad==0 ) {
          image(girle2, 300, 300);
        } else if (girle==1&& mad==0 ) {
          girle--;
        } else if (girlm==0 && mad==1 ) {
          image(girlm1, 300, 300);
          image(rude, 300, 250);
        } else if (girlm==0&& mad==1 ) {
          girlm++;
        } else if (girlm==1&& mad==1 ) {
          image(girlm2, 300, 300);
          image(rude, 300, 250);
        } else if (girlm==1&& mad==1 ) {
          girlm--;
        }


        if (bur==0||(bur==1&&i==4))
          image(images[i], 100, 300);
        else if (bur==1&&i==0)
          image(bimages[0], 100, 300);
        else if (bur==1&&i==1)
          image(bimages[1], 100, 300);
        else if (bur==1&&i==2)
          image(bimages[2], 100, 300);
        else if (bur==1&&i==3)
          image(bimages[3], 100, 300);

        if (frameCount % 30 !=0 && bur==1 && i!=0 ) {
          image(burp, 180, 300);
          mad=0;
        } else if (frameCount % 30 !=0 && bur==1 && i==0 )
        {
          image(burp, 180, 300);
          mad=1;
        } else {
          bur=0;
        }
        textSize(15);
        fill(255, 0, 0);
        textAlign(CENTER);
        text("press enter to the next stage", 250, 80);
      }
    }
    score.draw();
    break;
  case GameState.STAGE_3:
    if (gee.x>=450)
    {
      gee.x=450;
    } else if (gee.x<=0)
    {
      gee.x=0;
    } else if (gee.y>=440)
    {
      gee.y=440;
    } else if (gee.y<=50)
    {
      gee.y=50;
    }
    if (millis()-time <= timeWait) {
      image(s3_text, 60, 190);
      textSize(20); 
      fill(0);
      text(Girl, 60+232, 190+28);
      //text(Girl, 140+172, 190+128);
    } else {
      stroke(0);
      strokeWeight(5);
      line(0, 420, 500, 420);
      line(0, 148, 500, 148);

      image(s3, 0, 0);
      /*line(0, 70, 500, 70);
       line(0, 145, 500, 145);
       line(0, 220, 500, 220);
       line(0, 295, 500, 295);
       line(0, 370, 500, 370);*/

      if (frameCount % 30 !=0 &&  gee.y==85 && wait==0) {
        image(wait1, gee.x, gee.y);
      } else if (frameCount % 30 ==0 &&  gee.y==85 && wait==0) {
        wait++;
      } else if (frameCount % 30 !=0 &&  gee.y==85 && wait==1) {
        image(wait2, gee.x, gee.y);
      } else if (frameCount % 30 ==0 && gee.y==85 && wait==1) {
        wait--;
      } else if (frameCount % 20 !=0 && gee.y<420  && walk==0) {
        image(walk1, gee.x, gee.y);
      } else if (frameCount % 20 ==0 && gee.y<420 && walk==0) {
        walk++;
      } else if (frameCount % 20 !=0  && gee.y<420 && walk==1) {
        image(walk2, gee.x, gee.y);
      } else if (frameCount % 20 ==0 && gee.y<420  && walk==1) {
        walk--;
      } else if (frameCount % 30 !=0 && gee.y>=420 && win==0) {
        image(win1, gee.x, gee.y);
      } else if (frameCount % 30 ==0 && gee.y>=420 && win==0) {
        win++;
      } else if (frameCount % 30 !=0 && gee.y>=420 && win==1) {
        image(win2, gee.x, gee.y);
      } else if (frameCount % 30 ==0 &&gee.y>=420 && win==1) {
        win--;
      }
      if (gee.y>=420) {
        textSize(15);
        fill(255, 0, 0);
        textAlign(CENTER);
        text("press enter to the next stage", 250, 80);
      }

      for (int i=0; i<6; i++)
      {
        if (car[i].running==0)
        {
          for (int a=0; a<4; a++)
          {
            if (road[a]==0) {
              car[i].y=150+a*70;
              car[i].road=a;
              road[a]=1;
              car[i].running=1;
              break;
            }
          }
        } else
        {
          car[i].display();
          car[i].moveForward();
        }
        if (car[i].x==car[i].finish)
        {
          car[i].reset();
          road[car[i].road]=0;
        }
        if (isHit(gee.x, gee.y, 50, 60, car[i].x, car[i].y, car[i].img.width, car[i].img.height)) {
          c=0;
          peoplex=gee.x; 
          peopley=gee.y;
          gee.reset();
        }

        if (frameCount % 30 !=0 && c==0) {
          image(imgboom, peoplex, peopley);
        } else {
          c++;
        }
      }
    }
    score.draw();
    break;
  case GameState.STAGE_4:
   // image(stage4, 0, 0);
   /*
    image(but1, width/4-34, height/2);
    image(but2, width/2-34, height/2);
    image(but3, width/1.3-34, height/2);

    image(nextTime, -100-34, -100);
    image(proposal, -100-34, -100);
    switch(start) {

      //  case DISCR:

      //timer.currentTime++;
      //if(timer.currentTime>4){
      //image(stage4text,-1000,0);
      //start=CHOOSE;
      ////}

      //    break;

    case CHOOSE:
      if (mousePressed) {
        if ( (mouseX<=125+110-34) && (mouseX >=(width/4-34)) && (mouseY<=(height/2+60)) && (mouseY>=(height/2)) ) {

          start=STARTFIRE;
        } else if ( (mouseX<=250-34+110) && (mouseX >=(width/2-34)) && (mouseY<=(height/2+60)) && (mouseY>=(height/2)) ) {

          start=STARTSEA;
        } else if ( (mouseX<=(width/1.3)-34+110) && (mouseX >=(width/1.3-34)) && (mouseY<=(height/2+60)) && (mouseY>=(height/2)) ) {

          start=STARTHOME;
        }
      }
      break;

    case STARTFIRE:
      background(255);
      image(stage4, -100, -100);
      image(but1, -500+width/4, -500+height/2);
      image(but2, -500+width/2, -500+ height/2);
      image(but3, -500+width/1.3, -500+ height/2);

      fire.display();
      break;

    case STARTSEA:
      background(255);
      image(stage4, -100, -100);
      image(but1, -500+width/4, -500+height/2);
      image(but2, -500+width/2, -500+ height/2);
      image(but3, -500+width/1.3, -500+ height/2);
      sea.display();
      break;

    case STARTHOME:
      background(255);
      image(stage4, -100, -100);
      image(but1, -500+width/4, -500+ height/2);
      image(but2, -500+width/2, -500+ height/2);
      image(but3, -500+width/1.3, -500+height/2);
      home.draw();

      break;
    }
*/
    score.draw();
    break;
    //case GameState.STAGE_5:
    //   break;
  case GameState.END:
    if (score.value==1)
      image(one, 0, 0);
    else if (score.value==2)
      image(two, 0, 0);
    else if (score.value==3)
      image(three, 0, 0);
    else if (score.value==4||score.value==5)
      image(four, 0, 0);
    //score.draw();
    mailClick = false;
    break;
  }
}

void keyPressed() {
  if (state == GameState.STAGE_3) {
    if (key == CODED ) {
      switch(keyCode) {
      case UP:
        gee.moveUp();
        break;
      case DOWN:
        gee.moveDown();
        break;
      case LEFT:
        gee.moveLeft();
        break;
      case RIGHT:
        gee.moveRight();
        break;
      }
    }
  }
  switch(keyCode) {
  case UP : 
    isMovingUp = true ;
    break ;
  case DOWN : 
    isMovingDown = true ; 
    break ;
  case LEFT : 
    isMovingLeft = true ; 
    break ;
  case RIGHT : 
    isMovingRight = true ; 
    break ;
  default :
    break ;
  }
}
void keyReleased() {
  switch(keyCode) {
  case UP : 
    isMovingUp = false ;
    gee.moveUp();
    break ;
  case DOWN : 
    isMovingDown = false ; 
    break ;
  case LEFT : 
    isMovingLeft = false ; 
    break ;
  case RIGHT : 
    isMovingRight = false ; 
    break ;
  default :
    break ;
  }
  if (key == ' ') {
    if (state == GameState.STAGE_2) {
      bur = 1;
      isStop_2 = true;
    }
  }
  if (key == ENTER) {
    switch(state) {
    case GameState.NAME:
      state = GameState.STAGE_1;
      break;
    case GameState.INTRO:
    case GameState.END:
      for (int a=0; a<4; a++) {
        score.gameWin[a] = 0;
      }
      state = GameState.START;
      break;
    case GameState.STAGE_1:
      if (line.isEnd) {
        state = GameState.STAGE_2;
        time = millis();
      }
      break;
    case GameState.STAGE_2:
      state = GameState.STAGE_3;
      time = millis();
      break;
    case GameState.STAGE_3:
      state = GameState.STAGE_4;
      time = millis();
      break;    
    case GameState.STAGE_4:
      state = GameState.END;
      break;
    default : 
      break ;
    }
  }
  if (key == DELETE) {
    name = name.substring(0, name.length()-1);
  }
}

void keyTyped() {
  if (state == GameState.NAME) {
    if (key == DELETE||key == BACKSPACE) {
      if (name.length()!=0)
        name = name.substring(0, name.length()-1);
    } else if (key == ENTER) {
      state = GameState.STAGE_1;
      time = millis();
    } else
      name += char(key);
  }
}

void mousePressed() {
  if (state == GameState.START) {
    if (mouseX > gameStart.x && mouseY > gameStart.y &&
      mouseX < gameStart.x+gameStart.w && mouseY < gameStart.y+gameStart.h) {
      // hit start
      state = GameState.NAME;
    }
    if (mouseX > intro.x && mouseY > intro.y &&
      mouseX < intro.x+intro.w && mouseY < intro.y+intro.h) {
      // hit intro
      state = GameState.INTRO;
    }
  }
  if (state == GameState.STAGE_1) {
    for (int a=0; a<5; a++) {
      if (mouseX > mail[a].x && mouseY > mail[a].y &&
        mouseX < mail[a].x+mail[a].w && mouseY < mail[a].y+mail[a].h) {
        // hit start
        mailClick = true;
        line.choice = a+1;
      }
    }
  }
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return (
    ax+aw > bx       &&
    ax    < bx + bw  &&
    ay+ah > by       &&
    ay    < by + bh  );
}