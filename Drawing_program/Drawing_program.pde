import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables
//Radio
Minim minim;
AudioPlayer song1, song2, song3;
AudioMetaData songMetaData1, songMetaData2, songMetaData3, song;
float radioX, radioY, radioWidth, radioHeight;
float radioMenuX, radioMenuY, radioMenuWidth, radioMenuHeight;
//
//Size changer NOTE: Size changer does not work with line
float sizeChangeX, sizeChangeY, sizeChangeWidth, sizeChangeHeight;
float sizeDisplayX, sizeDisplayY, sizeDisplayWidth, sizeDisplayHeight;
float sizeUPXbridge, sizeUPYbridge, sizeUPXleft, sizeUPYleft, sizeUPXright, sizeUPYright;
float sizeDOWNXbridge, sizeDOWNYbridge, sizeDOWNXleft, sizeDOWNYleft, sizeDOWNXright, sizeDOWNYright;
float upButtonX, upButtonY, upButtonWidth, upButtonHeight;
float downButtonX, downButtonY, downButtonWidth, downButtonHeight; 
int drawSize = 10;
String displaySize = String.valueOf(drawSize);
//
//color changer
float colorchangeRedX, colorchangeRedY, colorchangeRedWidth, colorchangeRedHeight;
float colorchangeBlueX, colorchangeBlueY, colorchangeBlueWidth, colorchangeBlueHeight;
float colorchangeGreenX, colorchangeGreenY, colorchangeGreenWidth, colorchangeGreenHeight;
float colorchangeBlackX, colorchangeBlackY, colorchangeBlackWidth, colorchangeBlackHeight;
float colorSelectorX, colorSelectorY, colorSelectorWidth, colorSelectorHeight;
float palletX, palletY, palletWidth, palletHeight;
//drawing surface
float drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight, drawingDiamater;
//shape selector
float shapeSelectorX, shapeSelectorY, shapeSelectorWidth, shapeSelectorHeight;
float circleStampX, circleStampY, circleStampWidth, circleStampHeight;
float circleButtonX, circleButtonY, circleButtonWidth, circleButtonHeight;
float squareStampX, squareStampY, squareStampWidth, squareStampHeight;
float circleDrawX, circleDrawY, circleDrawWidth, circleDrawHeight;
float defaultX, defaultY, defaultWidth, defaultHeight;
float shapePalletX, shapePalletY, shapePalletWidth, shapePalletHeight;
Boolean drawCircle=false, drawLine=true, drawSquare=false;
//menu
float menuX, menuY, menuWidth, menuHeight;
//misc
int colorSelectortitleSize;
String colorSelectortitle = "Color Selector";
Boolean draw=false, colorSelecting=false, shapeSelecting=false;
PFont titlefont;
color Variable, red=#FF0303, blue=#0503FF, reset=#FFFFFF, green=#36FF00, black=#000000, grey=#AFAFAF;
color redTint=#A50000, blueTint=#0011A5, greenTint=#00A52D, blackTint=#5D5D5D, selectorTint=#FFFFFF, shapeSelectorTint=#FFFFFF, squareTint=#FFFFFF, circleTint=#FFFFFF, lineTint=#FFFFFF;
color upTint, downTint;
//
void setup() {
  //display checker
  //display orientation checker
  //display and canvas checker
  size(1500, 800);
  int appwidth = width;
  int appheight = height;
  if (width < displayWidth || height < displayHeight) {
    appwidth = displayWidth;
    appheight = displayHeight;
    println("canvas needs to be re adjusted");
  } else {
    println("canvas is good to go");
  }
  //display orientation
  String ls="Landscape or Square", p="portrait", DO="Display Orientation", instruct="Bru, turn your phon";
  String orientation = (appwidth >= appheight) ? ls : p ;
  println(DO, orientation);
  if (orientation == ls) {
    println("good to go");
  } else {
    appwidth *= 0;
    appheight *= 0;
    println(instruct);
  }
  //
/*  minim = new Minim(this);
  song1 = minim.loadFile("Audio/Glass - Anno Domini Beats.mp3");
  song2 = minim.loadFile("Audio/Coast - Anno Domini Beats.mp3");
  song3 = minim.loadFile("Audio/Pray - Anno Domini Beats.mp3");
  songMetaData1 = song1.getMetaData();
  songMetaData2 = song2.getMetaData();
  songMetaData3 = song3.getMetaData();*/
  //population
  drawingsurfaceX = appwidth/4;
  drawingsurfaceY = appheight*0;
  drawingsurfaceWidth = appwidth*3/4;
  drawingsurfaceHeight = appheight*4/5;
  menuX = appwidth/-2;
  menuY = appheight*0;
  menuWidth = appwidth*3/4;
  menuHeight = appheight*4/5;
  drawingDiamater = appwidth*1/100;
  colorchangeRedX = appwidth/5;
  colorchangeRedY = appheight*1/18;
  colorchangeRedWidth = appwidth/40;
  colorchangeRedHeight = appheight/24;
  colorchangeBlueX = appwidth/6;
  colorchangeBlueY = appheight*1/18;
  colorchangeBlueWidth = appwidth/40;
  colorchangeBlueHeight = appheight/24;
  colorchangeGreenX = appwidth/7.5;
  colorchangeGreenY = appheight*1/18;
  colorchangeGreenWidth = appwidth/40;
  colorchangeGreenHeight = appheight/24;
  colorchangeBlackX = appwidth/10;
  colorchangeBlackY = appheight*1/18;
  colorchangeBlackWidth = appwidth/40;
  colorchangeBlackHeight = appheight/24;
  colorSelectorX = appwidth/40;
  colorSelectorY = appheight*1/20;
  colorSelectorWidth = appwidth/20;
  colorSelectorHeight = appheight/18;
  palletX = appwidth/12;
  palletY = appheight*1/20;
  palletWidth = appwidth/6.5;
  palletHeight = appheight/18;
  shapeSelectorX = appwidth/40;
  shapeSelectorY = appheight/5;
  shapeSelectorWidth = appwidth/20;
  shapeSelectorHeight = appheight/18;
  shapePalletX = palletX;
  shapePalletY = shapeSelectorY/1.1;
  shapePalletWidth = palletWidth/1.2;
  shapePalletHeight = palletHeight*2;
  squareStampX = colorchangeBlackX;
  squareStampY = shapeSelectorY*1.05;
  squareStampWidth = colorchangeRedWidth;
  squareStampHeight = colorchangeRedHeight;
  circleStampX = colorchangeGreenX*1.1;
  circleStampY = squareStampY*1.1;
  circleStampWidth = squareStampWidth;
  circleStampHeight = squareStampHeight;
  defaultX = colorchangeBlueX;
  defaultY = squareStampY;
  defaultWidth = squareStampWidth;
  defaultHeight = squareStampHeight;
  circleButtonX = colorchangeGreenX;
  circleButtonY = squareStampY;
  circleButtonWidth = squareStampWidth;
  circleButtonHeight = squareStampHeight;
  sizeChangeX = shapeSelectorX;
  sizeChangeY = appheight/2.8;
  sizeChangeWidth = appwidth/12;
  sizeChangeHeight = appheight/11;
  sizeDisplayX = sizeChangeX*1.5;
  sizeDisplayY = sizeChangeY*1.06;
  sizeDisplayWidth = appwidth/40;
  sizeDisplayHeight = appheight/25;
  sizeUPXbridge = appwidth/11.7;
  sizeUPYbridge = appheight/2.65;
  sizeUPXleft = appwidth/10;
  sizeUPYleft = sizeDisplayY*1.05;
  sizeUPXright = appwidth/14;
  sizeUPYright = sizeDisplayY*1.05;
  sizeDOWNXbridge = sizeUPXbridge;
  sizeDOWNYbridge = appheight/2.35;
  sizeDOWNXleft = sizeUPXleft;
  sizeDOWNYleft = sizeDisplayY*1.07;
  sizeDOWNXright = sizeUPXright;
  sizeDOWNYright = sizeDisplayY*1.07;
  upButtonX = sizeUPXbridge*0.83;
  upButtonY = sizeUPYbridge*1;
  upButtonWidth = sizeUPXright/2.4;
  upButtonHeight = sizeUPYbridge/18;
  downButtonX = sizeUPXright;
  downButtonY = sizeDOWNYbridge/1.05;
  downButtonWidth = sizeUPXright/2.4;
  downButtonHeight = sizeUPYbridge/18; 
  radioX = palletX;
  radioY = appheight/4;
  radioWidth = appwidth/24;
  radioHeight = appheight/18;
  titlefont = createFont("Times New Roman", 60);
  //
  rect(drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight);
  //
}//end setup
//
void draw() {
  fill(grey);
  rect(menuX, menuY, menuWidth, menuHeight);
  fill(reset);
  if (draw == true && (mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight)) {
    stroke(Variable);
    fill(Variable);
    if (drawLine == true) {
      line(mouseX, mouseY, pmouseX, pmouseY); //line draw
    } else {
      if (drawSquare == true) {
        rect(mouseX, mouseY, drawSize, drawSize);
      } else {
        if (drawCircle == true) {
          ellipse(mouseX, mouseY, drawSize, drawSize);
        }
      }
    }
    //line(mouseX, mouseY, 0, 0); //cooler line draw put in Cool stuff later
    fill(reset);
    stroke(black);
  }
  if (mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight) {//fixes a bug whare you could draw outside the drawing surface
  } else {
    draw = false;
  }
  if (mouseX>colorchangeRedX && mouseX<colorchangeRedX+colorchangeRedWidth && mouseY>colorchangeRedY && mouseY<colorchangeRedY+colorchangeRedHeight) {
    redTint = #A50000;
  } else {
    redTint = red;
  }//end hoverover
  if (mouseX>colorchangeBlueX && mouseX<colorchangeBlueX+colorchangeBlueWidth && mouseY>colorchangeBlueY && mouseY<colorchangeBlueY+colorchangeBlueHeight) {
    blueTint = #0011A5;
  } else {
    blueTint = blue;
  }//end hoverover
  if (mouseX>colorchangeGreenX && mouseX<colorchangeGreenX+colorchangeGreenWidth && mouseY>colorchangeGreenY && mouseY<colorchangeGreenY+colorchangeGreenHeight) {
    greenTint = #00A52D;
  } else {
    greenTint = green;
  }//end hoverover
  if (mouseX>colorchangeBlackX && mouseX<colorchangeBlackX+colorchangeBlackWidth && mouseY>colorchangeBlackY && mouseY<colorchangeBlackY+colorchangeBlackHeight) {
    blackTint = #5D5D5D;
  } else {
    blackTint = black;
  }//end hoverover
  if (mouseX>colorSelectorX && mouseX<colorSelectorX+colorSelectorWidth && mouseY>colorSelectorY && mouseY<colorSelectorY+colorSelectorHeight) {
    selectorTint = grey;
  } else {
    selectorTint = reset;
  }//end hoverover
  if (mouseX>shapeSelectorX && mouseX<shapeSelectorX+shapeSelectorWidth && mouseY>shapeSelectorY && mouseY<shapeSelectorY+shapeSelectorHeight) {
    shapeSelectorTint = grey;
  } else {
    shapeSelectorTint = reset;
  }//end hoverover
  if (mouseX>squareStampX && mouseX<squareStampX+squareStampWidth && mouseY>squareStampY && mouseY<squareStampY+squareStampHeight) {
    squareTint = grey;
  } else {
    squareTint = reset;
  }//end hoverover
  if (mouseX>circleButtonX && mouseX<circleButtonX+circleButtonWidth && mouseY>circleButtonY && mouseY<circleButtonY+circleButtonHeight) {
    circleTint = grey;
  } else {
    circleTint = reset;
  }//end hoverover
  if (mouseX>defaultX && mouseX<defaultX+defaultWidth && mouseY>defaultY && mouseY<defaultY+defaultHeight) {
    lineTint = grey;
  } else {
    lineTint = reset;
  }//end hoverover
  if (mouseX>upButtonX && mouseX<upButtonX+upButtonWidth && mouseY>upButtonY && mouseY<upButtonY+upButtonHeight) {
    upTint = grey;
  } else {
    upTint = reset;
  }//end hoverover
  if (mouseX>downButtonX && mouseX<downButtonX+downButtonWidth && mouseY>downButtonY && mouseY<downButtonY+downButtonHeight) {
    downTint = grey;
  } else {
    downTint = reset;
  }//end hoverover
  fill(selectorTint);
  rect(colorSelectorX, colorSelectorY, colorSelectorWidth, colorSelectorHeight);
  fill(black);
  textAlign(CENTER, CENTER );
  colorSelectortitleSize = 15;
  textFont(titlefont, colorSelectortitleSize);
  text(colorSelectortitle, colorSelectorX, colorSelectorY, colorSelectorWidth, colorSelectorHeight);
  fill(reset);
  if (colorSelecting == true) {
    rect(palletX, palletY, palletWidth, palletHeight);
    fill(redTint);
    rect(colorchangeRedX, colorchangeRedY, colorchangeRedWidth, colorchangeRedHeight);
    fill(blueTint);
    rect(colorchangeBlueX, colorchangeBlueY, colorchangeBlueWidth, colorchangeBlueHeight);
    fill(greenTint);
    rect(colorchangeGreenX, colorchangeGreenY, colorchangeGreenWidth, colorchangeGreenHeight);
    fill(blackTint);
    rect(colorchangeBlackX, colorchangeBlackY, colorchangeBlackWidth, colorchangeBlackHeight);
    fill(reset);
  }
  fill(shapeSelectorTint);
  rect(shapeSelectorX, shapeSelectorY, shapeSelectorWidth, shapeSelectorHeight);
  fill(black);
  textAlign(CENTER, CENTER );
  textFont(titlefont, 15);
  text("Shape Selector",shapeSelectorX, shapeSelectorY, shapeSelectorWidth, shapeSelectorHeight);
  fill(reset);
  if(shapeSelecting == true){
    rect(shapePalletX, shapePalletY, shapePalletWidth, shapePalletHeight);
    fill(squareTint);
    rect(squareStampX, squareStampY, squareStampWidth, squareStampHeight);
    fill(circleTint);
    ellipse(circleStampX, circleStampY, circleStampWidth, circleStampHeight);
    fill(lineTint);
    rect(defaultX, defaultY, defaultWidth, defaultHeight);
    fill(black);
    textAlign(CENTER, CENTER );
    textFont(titlefont, 15);
    text("Line",defaultX, defaultY, defaultWidth, defaultHeight);
    fill(reset);
  }
  rect(sizeChangeX, sizeChangeY, sizeChangeWidth, sizeChangeHeight);
  fill(black);
  textAlign(CENTER, TOP );
  textFont(titlefont, 15);
  text("Size Selector", sizeChangeX, sizeChangeY, sizeChangeWidth, sizeChangeHeight);
  fill(reset);
  rect(sizeDisplayX, sizeDisplayY, sizeDisplayWidth, sizeDisplayHeight);
  fill(black);
  textAlign(CENTER, CENTER );
  textFont(titlefont, 15);
  text(drawSize + "px", sizeDisplayX, sizeDisplayY, sizeDisplayWidth, sizeDisplayHeight);
  fill(upTint);
  triangle(sizeUPXbridge, sizeUPYbridge, sizeUPXleft, sizeUPYleft, sizeUPXright, sizeUPYright);
  fill(downTint);
  println(downButtonX, downButtonY, downButtonWidth, downButtonHeight);
  triangle(sizeDOWNXbridge, sizeDOWNYbridge, sizeDOWNXleft, sizeDOWNYleft, sizeDOWNXright, sizeDOWNYright);
  fill(reset);
  //Music Player
  rect(radioX, radioY, radioWidth, radioHeight);
  rect(radioMenuX, radioMenuY, radioMenuWidth, radioMenuHeight);
  //
}//end draw
//
void keyPressed() {
}//end keypressed
//
void mousePressed() {
  if (mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight) {
    if (draw == false) {
      draw = true;
    } else {
      draw = false;
    }
  }
  if (mouseX>colorchangeRedX && mouseX<colorchangeRedX+colorchangeRedWidth && mouseY>colorchangeRedY && mouseY<colorchangeRedY+colorchangeRedHeight) {
    if ( mouseButton == LEFT) {
      if (colorSelecting == true){
      Variable = red;
      }
    }
  }
  if (mouseX>colorchangeBlueX && mouseX<colorchangeBlueX+colorchangeBlueWidth && mouseY>colorchangeBlueY && mouseY<colorchangeBlueY+colorchangeBlueHeight) {
    if ( mouseButton == LEFT) {
      if (colorSelecting == true){
      Variable = blue;
      }
    }
  }
  if (mouseX>colorchangeGreenX && mouseX<colorchangeGreenX+colorchangeGreenWidth && mouseY>colorchangeGreenY && mouseY<colorchangeGreenY+colorchangeGreenHeight) {
    if ( mouseButton == LEFT) {
      if (colorSelecting == true){
      Variable = green;
      }
    }
  }
  if (mouseX>colorchangeBlackX && mouseX<colorchangeBlackX+colorchangeBlackWidth && mouseY>colorchangeBlackY && mouseY<colorchangeBlackY+colorchangeBlackHeight) {
    if ( mouseButton == LEFT) {
      if (colorSelecting == true){
      Variable = black;
      }
    }
  }
  if (mouseX>colorSelectorX && mouseX<colorSelectorX+colorSelectorWidth && mouseY>colorSelectorY && mouseY<colorSelectorY+colorSelectorHeight) {
    if ( mouseButton == LEFT) {
      if (colorSelecting == false) {
      colorSelecting = true;
      } else {
      colorSelecting = false;
      }
    }
  }
  if (mouseX>shapeSelectorX && mouseX<shapeSelectorX+shapeSelectorWidth && mouseY>shapeSelectorY && mouseY<shapeSelectorY+shapeSelectorHeight) {
    if ( mouseButton == LEFT) {
      if (shapeSelecting == false) {
      shapeSelecting = true;
      } else {
      shapeSelecting = false;
      }
    }
  }
   if (mouseX>squareStampX && mouseX<squareStampX+squareStampWidth && mouseY>squareStampY && mouseY<squareStampY+squareStampHeight) {
    if ( mouseButton == LEFT) {
      if (shapeSelecting == true){
      drawSquare = true;
      drawLine = false;
      drawCircle = false;
      }
    }
  }
   if (mouseX>circleButtonX && mouseX<circleButtonX+circleButtonWidth && mouseY>circleButtonY && mouseY<circleButtonY+circleButtonHeight) {
    if ( mouseButton == LEFT) {
      if (shapeSelecting == true){
      drawCircle = true;
      drawSquare = false;
      drawLine = false;
      }
    }
  }
   if (mouseX>defaultX && mouseX<defaultX+defaultWidth && mouseY>defaultY && mouseY<defaultY+defaultHeight) {
    if ( mouseButton == LEFT) {
      if (shapeSelecting == true){
      drawLine = true;
      drawCircle = false;
      drawSquare = false;
      }
    }
  }
   if (mouseX>upButtonX && mouseX<upButtonX+upButtonWidth && mouseY>upButtonY && mouseY<upButtonY+upButtonHeight) {
    if ( mouseButton == LEFT) {
      drawSize = drawSize + 1;
    }
  }
   if (mouseX>downButtonX && mouseX<downButtonX+downButtonWidth && mouseY>downButtonY && mouseY<downButtonY+downButtonHeight) {
    if ( mouseButton == LEFT) {
      drawSize = drawSize - 1;
    }
  }
}//end mousepressed
void mouseReleased() {
  draw = false;
}
//
//end main program
