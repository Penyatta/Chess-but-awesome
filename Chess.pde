//chess
PImage WhiteKing;
PImage BlackKing;
PImage WhiteQueen;
PImage BlackQueen;
PImage WhiteRook;
PImage BlackRook;
PImage WhiteBishop;
PImage BlackBishop;
PImage BlackKnight;
PImage WhiteKnight;
PImage WhitePawn;
PImage BlackPawn;
PImage TrashCan;
boolean PieceSelected=false;
int PieceInHand;
int SidsteX=1000;
int SidsteY=1000;
boolean WhiteDead=false;
boolean BlackDead=false;
boolean PieceFromBoard;
boolean musik=true;

import processing.sound.*;
SoundFile PeaceLoveAndHarmony;
SoundFile Splat;

int [][] positioner = new int[8][8];
int white=-1;
void setup () {
  if (musik) {
  PeaceLoveAndHarmony = new SoundFile(this, "PeaceLoveAndHarmony.mp3");
  PeaceLoveAndHarmony.loop();
  }
  Splat = new SoundFile(this, "Splat.mp3");
  noStroke();
  WhiteKing=loadImage("WhiteKing.png");
  BlackKing=loadImage("BlackKing.png");
  WhiteQueen=loadImage("WhiteQueen.png");
  BlackQueen=loadImage("BlackQueen.png");
  WhiteRook=loadImage("WhiteRook.png");
  BlackRook=loadImage("BlackRook.png");
  WhiteBishop=loadImage("WhiteBishop.png");
  BlackBishop=loadImage("BlackBishop.png");
  WhiteKnight=loadImage("WhiteKnight.png");
  BlackKnight=loadImage("BlackKnight.png");
  WhitePawn=loadImage("WhitePawn.png");
  BlackPawn=loadImage("BlackPawn.png");
  TrashCan=loadImage("TrashCan.png");

  size(1100, 800);
  pushMatrix();
  //kom brikker ind i et array

  for (int i=0; i<8; i++) {
    positioner[i][0]=i+1;
  }
  for (int i=0; i<8; i++) {
    positioner[i][6]=9;
  }

  for (int i=10; i<18; i++) {
    positioner[i-10][7]=i;
  }
  for (int i=0; i<8; i++) {
    positioner[i][1]=18;
  }
}

void mouseReleased () {
  if (WhiteDead==false && BlackDead==false) {
    if (mouseX<800) {
      if (PieceSelected==false) {
        if (0<positioner[int(mouseX/100)][int(mouseY/100)]) {
          PieceInHand=positioner[int(mouseX/100)][int(mouseY/100)];
          SidsteX=int(mouseX/100);
          SidsteY=int(mouseY/100);
          PieceSelected=true;
          PieceFromBoard=true;
        }
      } else {
        if (PieceFromBoard) {
          positioner[SidsteX][SidsteY]=0;
        }
        if (positioner[int(mouseX/100)][int(mouseY/100)]>0) {
          Splat.jump(0.3);
        }
        positioner[int(mouseX/100)][int(mouseY/100)]=PieceInHand;
        PieceSelected=false;
        SidsteX=1000;
        SidsteY=1000;
        PieceInHand=0;
      }
    }
    if(mouseX>900 && mouseY>600) {
     PieceInHand=0;
     PieceSelected=false;
     if(SidsteX<9 && SidsteY<9) {
       positioner[SidsteX][SidsteY]=0;
       SidsteX=1000;
        SidsteY=1000;
     }
    }
  } 
  else {
    for (int i=0; i<8; i++) {
      white=-1*white;
      for (int t=0; t<8; t++) {
        positioner[i][t]=0;
      }
    }

    for (int i=0; i<8; i++) {
      positioner[i][0]=i+1;
    }
    for (int i=0; i<8; i++) {
      positioner[i][6]=9;
    }
    //hvid
    for (int i=10; i<18; i++) {
      positioner[i-10][7]=i;
    }
    for (int i=0; i<8; i++) {
      positioner[i][1]=18;
    }
    PieceInHand=0;
     PieceSelected=false;
      SidsteX=1000;
        SidsteY=1000;
  }
  if (mouseX>900 && mouseY<600) {
    PieceFromBoard=false;
    PieceSelected=true;
    if (int(mouseX/100)==9 && int(mouseY/100)==0) {
      PieceInHand=14;
      PieceSelected=true;
    }
    if (int(mouseX/100)==9 && int(mouseY/100)==1) {
      PieceInHand=13;
      PieceSelected=true;
    }
    if (int(mouseX/100)==9 && int(mouseY/100)==2) {
      PieceInHand=12;
      PieceSelected=true;
    }
    if (int(mouseX/100)==9 && int(mouseY/100)==3) {
      PieceInHand=11;
      PieceSelected=true;
    }
    if (int(mouseX/100)==9 && int(mouseY/100)==4) {
      PieceInHand=10;
      PieceSelected=true;
    }
    if (int(mouseX/100)==9 && int(mouseY/100)==5) {
      PieceInHand=9;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==0) {
      PieceInHand=5;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==1) {
      PieceInHand=4;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==2) {
      PieceInHand=3;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==3) {
      PieceInHand=2;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==4) {
      PieceInHand=1;
      PieceSelected=true;
    }
    if (int(mouseX/100)==10 && int(mouseY/100)==5) {
      PieceInHand=18;
      PieceSelected=true;
    }
  }
}

void draw () {
  background(155);
  WhiteDead=true;
  BlackDead=true;
  if (keyCode==SHIFT && keyPressed&& mouseX<800) {
    positioner[int(mouseX/100)][int(mouseY/100)]=PieceInHand;
  }
  //tegn bræt
  for (int i=0; i<8; i++) {
    white=-1*white;
    for (int t=0; t<8; t++) {
      if (positioner[i][t]==5) {
        BlackDead=false;
      }
      if (positioner[i][t]==14) {
        WhiteDead=false;
      }
      popMatrix();
      pushMatrix();
      translate(i*100, t*100);
      if (white==1) {
        fill(255);
      } else {
        fill(100);
      }
      rect(0, 0, 100, 100);
      white=-1*white;

      if (SidsteX==i && SidsteY==t) {
        fill(0, 255, 0);
        rect(0, 0, 100, 100);
      }
      //tegn brikker
      if (positioner[i][t]>0) {
        //sorte brikker
        if (positioner[i][t]==1 ||  positioner[i][t]==8) {
          //sort tårn
          image(BlackRook, 0, 0, 100, 100);
        }
        if (positioner[i][t]==2 ||  positioner[i][t]==7) {
          //sort hest
          image(BlackKnight, 0, 0, 100, 100);
        }
        if (positioner[i][t]==3 ||  positioner[i][t]==6) {
          //sort løber
          image(BlackBishop, 0, 0, 100, 100);
        }
        if (positioner[i][t]==4) {
          //sort dronning
          image(BlackQueen, 0, 0, 100, 100);
        }
        if (positioner[i][t]==5) {
          //sort konge
          image(BlackKing, 0, 0, 100, 100);
        }
        if (positioner[i][t]==18) {
          //sort bønder
          image(BlackPawn, 0, 0, 100, 100);
        }

        //hvide brikker
        if (positioner[i][t]==10 ||  positioner[i][t]==17) {
          //hvid tårn
          image(WhiteRook, 0, 0, 100, 100);
        }
        if (positioner[i][t]==11 ||  positioner[i][t]==16) {
          //hvid hest
          image(WhiteKnight, 0, 0, 100, 100);
        }
        if (positioner[i][t]==12 ||  positioner[i][t]==15) {
          //hvid løber
          image(WhiteBishop, 0, 0, 100, 100);
        }
        if (positioner[i][t]==13) {
          //hvid dronning
          image(WhiteQueen, 0, 0, 100, 100);
        }
        if (positioner[i][t]==14) {
          //hvid konge
          image(WhiteKing, 0, 0, 100, 100);
        }
        if (positioner[i][t]==9) {
          //hvid bønder
          image(WhitePawn, 0, 0, 100, 100);
        }
      }
    }
  }



  popMatrix();
  pushMatrix();
  image(TrashCan,900,600,200,200);
  translate(mouseX-50, mouseY-50);
  //tegner brikken i hånden
  if (PieceInHand>0) {
    //sorte brikker
    if (PieceInHand==1 ||  PieceInHand==8) {
      //sort tårn
      image(BlackRook, 0, 0, 100, 100);
    }
    if (PieceInHand==2 ||  PieceInHand==7) {
      //sort hest
      image(BlackKnight, 0, 0, 100, 100);
    }
    if (PieceInHand==3 ||  PieceInHand==6) {
      //sort løber
      image(BlackBishop, 0, 0, 100, 100);
    }
    if (PieceInHand==4) {
      //sort dronning
      image(BlackQueen, 0, 0, 100, 100);
    }
    if (PieceInHand==5) {
      //sort konge
      image(BlackKing, 0, 0, 100, 100);
    }
    if (PieceInHand==18) {
      //sort bønder
      image(BlackPawn, 0, 0, 100, 100);
    }

    //hvide brikker
    if (PieceInHand==10 ||  PieceInHand==17) {
      //hvid tårn
      image(WhiteRook, 0, 0, 100, 100);
    }
    if (PieceInHand==11 ||  PieceInHand==16) {
      //hvid hest
      image(WhiteKnight, 0, 0, 100, 100);
    }
    if (PieceInHand==12 ||  PieceInHand==15) {
      //hvid løber
      image(WhiteBishop, 0, 0, 100, 100);
    }
    if (PieceInHand==13) {
      //hvid dronning
      image(WhiteQueen, 0, 0, 100, 100);
    }
    if (PieceInHand==14) {
      //hvid konge
      image(WhiteKing, 0, 0, 100, 100);
    }
    if (PieceInHand==9) {
      //hvid bønder
      image(WhitePawn, 0, 0, 100, 100);
    }
  }
  popMatrix();
  pushMatrix();
  image(WhiteKing, 900, 0, 100, 100);
  image(WhiteQueen, 900, 100, 100, 100);
  image(WhiteBishop, 900, 200, 100, 100);
  image(WhiteKnight, 900, 300, 100, 100);
  image(WhiteRook, 900, 400, 100, 100);
  image(WhitePawn, 900, 500, 100, 100);
  image(BlackKing, 1000, 0, 100, 100);
  image(BlackQueen, 1000, 100, 100, 100);
  image(BlackBishop, 1000, 200, 100, 100);
  image(BlackKnight, 1000, 300, 100, 100);
  image(BlackRook, 1000, 400, 100, 100);
  image(BlackPawn, 1000, 500, 100, 100);
  if (WhiteDead==true) {
    popMatrix();
    pushMatrix();
    background(0);
    textAlign(CENTER);
    textSize(40);
    text("black won", 550, 400);
  }
  if (BlackDead==true) {
    popMatrix();
    pushMatrix();
    background(0);
    textAlign(CENTER);
    textSize(40);
    text("white won", 550, 400);
  }
}
