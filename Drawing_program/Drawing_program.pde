import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables
//Radio
Minim minim;
AudioPlayer song1, song2, song3, songVar;
AudioMetaData songMetaData1, songMetaData2, songMetaData3, songVarData;
float radioX, radioY, radioWidth, radioHeight;
float radioMenuX, radioMenuY, radioMenuWidth, radioMenuHeight;
float imageX, imageY, imagewidth, imageheight, picWidthAdjusted, picHeightAdjusted;
float imageX2, imageY2, imagewidth2, imageheight2, picWidthAdjusted2, picHeightAdjusted2;
float imageLargerDimension, imageSmallerDimension;
float imageLargerDimension2, imageSmallerDimension2;
float imageWidthRatio, imageHeightRatio;
float imageWidthRatio2, imageHeightRatio2;
PImage pic, pic2;
Boolean widthLarger = false, heightLarger = false;
Boolean widthLarger2 = false, heightLarger2 = false;
float playX, playY, playWidth, playHeight;
float pauseX, pauseY, pauseWidth, pauseHeight;
float fastForwardX, fastForwardY, fastForwardWidth, fastForwardHeight;
float skipBackwardsX, skipBackwardsY, skipBackwardsWidth, skipBackwardsHeight;
float nextX, nextY, nextWidth, nextHeight;
float backX, backY, backWidth, backHeight;
int songNumber=1;
Boolean radioOn=false;
float loopX, loopY, loopWidth, loopHeight;
color invisible=color(100,100,100,0), Tint=color(80, 80, 80, 147.0), playTint, pauseTint, forwardTint, backwardTint, nextTint, backTint, loopTint;
//
//Size changer
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
float exitX, exitY, exitWidth, exitHeight;
int colorSelectortitleSize;
String colorSelectortitle = "Color Selector";
Boolean draw=false, colorSelecting=false, shapeSelecting=false;
PFont titlefont;
color Variable, red=#FF0303, blue=#0503FF, reset=#FFFFFF, green=#36FF00, black=#000000, grey=#AFAFAF;
color redTint=#A50000, blueTint=#0011A5, greenTint=#00A52D, blackTint=#5D5D5D, selectorTint=#FFFFFF, shapeSelectorTint=#FFFFFF, squareTint=#FFFFFF, circleTint=#FFFFFF, lineTint=#FFFFFF;
color upTint, downTint, exitTint, closeTint;
color radioTint;
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
  minim = new Minim(this);
  song1 = minim.loadFile("Audio/Glass - Anno Domini Beats.mp3");
  song2 = minim.loadFile("Audio/Coast - Anno Domini Beats.mp3");
  song3 = minim.loadFile("Audio/Pray - Anno Domini Beats.mp3");
  songMetaData1 = song1.getMetaData();
  songMetaData2 = song2.getMetaData();
  songMetaData3 = song3.getMetaData(); 
  songVar = song1;
  songVarData = songMetaData1;
  //population
  drawingsurfaceX = appwidth/4;
  drawingsurfaceY = appheight/12;
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
  radioX = colorSelectorX;
  radioY = appheight/1.8;
  radioWidth = appwidth/24;
  radioHeight = appheight/18;
  radioMenuX = appwidth/12;
  radioMenuY = appheight/1.95;
  radioMenuWidth = appwidth/6.5;
  radioMenuHeight = appheight/6;
  pic = loadImage("musicControls.png");//Dimensions : width 511.333px, height 767
  pic2 = loadImage("repeat.png");//dimensions : width 525, height 393
  int picWidth = 960;
  int picHeight = 480;
  int picWidth2 = 1200;
  int picHeight2 = 630;
  if (picWidth >= picHeight) {
  imageLargerDimension = picWidth;
  imageSmallerDimension = picHeight;
  widthLarger = true;
  } else {
  imageLargerDimension = picHeight;
  imageSmallerDimension = picWidth;
  heightLarger = true;
   }
   if (picWidth2 >= picHeight2) {
  imageLargerDimension2 = picWidth2;
  imageSmallerDimension2 = picHeight2;
  widthLarger2 = true;
  } else {
  imageLargerDimension2 = picHeight2;
  imageSmallerDimension2 = picWidth2;
  heightLarger2 = true;
   }
  if (widthLarger == true) imageWidthRatio = imageLargerDimension / imageLargerDimension;
  if (widthLarger == true) imageHeightRatio = imageSmallerDimension / imageLargerDimension;
  if (heightLarger == true) imageWidthRatio = imageSmallerDimension / imageLargerDimension;
  if (heightLarger == true) imageHeightRatio = imageLargerDimension / imageLargerDimension;
  //2
  if (widthLarger2 == true) imageWidthRatio2 = imageLargerDimension2 / imageLargerDimension2;
  if (widthLarger2 == true) imageHeightRatio2 = imageSmallerDimension2 / imageLargerDimension2;
  if (heightLarger2 == true) imageWidthRatio2 = imageSmallerDimension2 / imageLargerDimension2;
  if (heightLarger2 == true) imageHeightRatio2 = imageLargerDimension2 / imageLargerDimension2;
  imageX = appwidth/11;
  imageY = appheight/1.85;
  imagewidth = appwidth/15;
  imageheight = appheight/2;
  imageX2 = appwidth/11;
  imageY2 = appheight/1.6;
  imagewidth2 = appwidth/42;
  imageheight2 = appheight/10;
  picWidthAdjusted = imagewidth * imageWidthRatio;
  picHeightAdjusted = imageheight * imageHeightRatio;
  picWidthAdjusted2 = imagewidth2 * imageWidthRatio2;
  picHeightAdjusted2 = imageheight2 * imageHeightRatio2;
  playX = appwidth/7;
  playY = appheight/1.71;
  playWidth = appwidth/52;
  playHeight = appheight/31;
  pauseX = appwidth/6.15;
  pauseY = appheight/1.71;
  pauseWidth = appwidth/51;
  pauseHeight = appheight/31 ;
  fastForwardX = appwidth/5.46;
  fastForwardY = appheight/1.71;
  fastForwardWidth = appwidth/52;
  fastForwardHeight = appheight/31;
  skipBackwardsX = appwidth/8.5;
  skipBackwardsY = appheight/1.71;
  skipBackwardsWidth = appwidth/52;
  skipBackwardsHeight = appheight/31;
  nextX = appwidth/4.8;
  nextY = appheight/1.71;
  nextWidth = appwidth/52;
  nextHeight = appheight/31;
  backX = appwidth/10.8;
  backY = appheight/1.71;
  backWidth = appwidth/52;
  backHeight = appheight/31;
  loopX = appwidth/10.86;
  loopY = appheight/1.59;
  loopWidth = appwidth/52;
  loopHeight = appheight/31;
  exitX = appwidth/1.323;
  exitY = appheight*0;
  exitWidth = appwidth/40;
  exitHeight = appheight/24;
  titlefont = createFont("Times New Roman", 60);
  //
  rect(drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight);
  //
}//end setup
//
void draw() {
  fill(grey);
  noStroke();
  rect(menuX, menuY, menuWidth, menuHeight);
  stroke(1);
  fill(reset);
  if (draw == true && (mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight)) {
    stroke(Variable);
    fill(Variable);
    if (drawLine == true) {
      strokeWeight(drawSize);
      line(mouseX, mouseY, pmouseX, pmouseY); //line draw
      strokeWeight(1);
    } else {
      if (drawSquare == true) {
        rect(mouseX*1, mouseY*1, drawSize, drawSize);
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
  if (mouseX>radioX && mouseX<radioX+radioWidth && mouseY>radioY && mouseY<radioY+radioHeight) {
    radioTint = grey;
  } else {
    radioTint = reset;
  }//end hoverover
  if (mouseX>pauseX && mouseX<pauseX+pauseWidth && mouseY>pauseY && mouseY<pauseY+pauseHeight) {
    pauseTint = Tint;
  } else {
    pauseTint = invisible;
  }//end hoverover
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    playTint = Tint;
  } else {
    playTint = invisible;
  }//end hoverover
  if (mouseX>fastForwardX && mouseX<fastForwardX+fastForwardWidth && mouseY>fastForwardY && mouseY<fastForwardY+fastForwardHeight) {
    forwardTint = Tint;
  } else {
    forwardTint = invisible;
  }//end hoverover
  if (mouseX>skipBackwardsX && mouseX<skipBackwardsX+skipBackwardsWidth && mouseY>skipBackwardsY && mouseY<skipBackwardsY+skipBackwardsHeight) {
    backwardTint = Tint;
  } else {
    backwardTint = invisible;
  }//end hoverover
  if (mouseX>backX && mouseX<backX+backWidth && mouseY>backY && mouseY<backY+backHeight) {
    backTint = Tint;
  } else {
    backTint = invisible;
  }//end hoverover
  if (mouseX>nextX && mouseX<nextX+nextWidth && mouseY>nextY && mouseY<nextY+nextHeight) {
    nextTint = Tint;
  } else {
    nextTint = invisible;
  }//end hoverover
  if (mouseX>fastForwardX && mouseX<fastForwardX+fastForwardWidth && mouseY>fastForwardY && mouseY<fastForwardY+fastForwardHeight) {
    forwardTint = Tint;
  } else {
    forwardTint = invisible;
  }//end hoverover
  if (mouseX>fastForwardX && mouseX<fastForwardX+fastForwardWidth && mouseY>fastForwardY && mouseY<fastForwardY+fastForwardHeight) {
    forwardTint = Tint;
  } else {
    forwardTint = invisible;
  }//end hoverover
  if (mouseX>loopX && mouseX<loopX+loopWidth && mouseY>loopY && mouseY<loopY+loopHeight) {
    loopTint = Tint;
  } else {
    loopTint = invisible;
  }//end hoverover
  if (mouseX>exitX && mouseX<exitX+exitWidth && mouseY>exitY && mouseY<exitY+exitHeight) {
    exitTint = red;
    closeTint = reset;
  } else {
    exitTint = reset;
    closeTint = black;
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
  triangle(sizeDOWNXbridge, sizeDOWNYbridge, sizeDOWNXleft, sizeDOWNYleft, sizeDOWNXright, sizeDOWNYright);
  fill(reset);
  //Music Player
  fill(radioTint);
  rect(radioX, radioY, radioWidth, radioHeight);
  fill(black);
  textAlign(CENTER, CENTER );
  textFont(titlefont, 15);
  text("Radio",radioX, radioY, radioWidth, radioHeight);
  if(radioOn == true){
  fill(reset);
  rect(radioMenuX, radioMenuY, radioMenuWidth, radioMenuHeight);
    //
  noStroke();
  fill(pauseTint);
  rect(pauseX, pauseY, pauseWidth, pauseHeight);
  fill(playTint);
  rect(playX, playY, playWidth, playHeight);
  fill(reset);
  stroke(1);
  image(pic,imageX, imageY, picHeightAdjusted, picWidthAdjusted);
  image(pic2,imageX2, imageY2, picHeightAdjusted2, picWidthAdjusted2);
  fill(black);
  textAlign(CENTER, TOP);
  textFont(titlefont, 30);
  text("Now Playing:"+songVarData.title(),radioMenuX, radioMenuY, radioMenuWidth, radioMenuHeight);
  fill(reset);
  noStroke();
  fill(playTint);
  rect (playX, playY, playWidth, playHeight);
  fill(pauseTint);
  rect (pauseX, pauseY, pauseWidth, pauseHeight);
  fill(forwardTint);
  rect (fastForwardX, fastForwardY, fastForwardWidth, fastForwardHeight);
  fill(backwardTint);
  rect (skipBackwardsX, skipBackwardsY, skipBackwardsWidth, skipBackwardsHeight);
  fill(nextTint);
  rect (nextX, nextY, nextWidth, nextHeight);
  fill(backTint);
  rect (backX, backY, backWidth, backHeight);
  fill(loopTint);
  rect (loopX, loopY, loopWidth, loopHeight);
  stroke(1);
  fill(reset);
  //
  }
  //
  fill(exitTint);
  rect(exitX, exitY, exitWidth, exitHeight);
  fill(closeTint);
  textAlign(CENTER, CENTER );
  textFont(titlefont, 15);
  text("X",exitX, exitY, exitWidth, exitHeight);
  fill(reset);
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
  if (mouseX>pauseX && mouseX<pauseX+pauseWidth && mouseY>pauseY && mouseY<pauseY+pauseHeight) {
    if ( mouseButton == LEFT) {
      if(radioOn == true){
      songVar.pause();
      }
    }
  }
  if (mouseX>playX && mouseX<playX+playWidth && mouseY>playY && mouseY<playY+playHeight) {
    if ( mouseButton == LEFT) {
     if(radioOn == true){
      songVar.play();
     }
    }
  }
  if (mouseX>fastForwardX && mouseX<fastForwardX+fastForwardWidth && mouseY>fastForwardY && mouseY<fastForwardY+fastForwardHeight) {
    if ( mouseButton == LEFT) {
      if(radioOn == true){
      songVar.skip(1000);
      }
    }
  }
  if (mouseX>skipBackwardsX && mouseX<skipBackwardsX+skipBackwardsWidth && mouseY>skipBackwardsY && mouseY<skipBackwardsY+skipBackwardsHeight) {
    if ( mouseButton == LEFT) {
       if(radioOn == true){
      songVar.skip(-1000);
       }
    }
  }
  if (mouseX>nextX && mouseX<nextX+nextWidth && mouseY>nextY && mouseY<nextY+nextHeight) {
    if ( mouseButton == LEFT) {
       if(radioOn == true){
      if (songNumber == 1) {
        songVar.pause();
        songVar.rewind();
        songNumber = 2;
        songVar = song2;
        songVarData = songMetaData2;
        songVar.play();
      } else {
      if (songNumber == 2) {
        songVar.pause();
        songVar.rewind();
        songNumber = 3;
        songVar = song3;
        songVarData = songMetaData3;
        songVar.play();
        } else {
          if (songNumber == 3) {
          songVar.pause();
          songVar.rewind();
          songNumber = 1;
          songVar = song1;
          songVarData = songMetaData1;
          songVar.play();
          }
         }
        }
      }
    }
  }
  if (mouseX>backX && mouseX<backX+backWidth && mouseY>backY && mouseY<backY+backHeight) {
    if ( mouseButton == LEFT) {
      if(radioOn == true){
      if (songNumber == 1) {
        songVar.pause();
        songVar.rewind();
        songNumber = 3;
        songVar = song3;
        songVarData = songMetaData3;
        songVar.loop(0);
      } else {
      if (songNumber == 2) {
        songVar.pause();
        songVar.rewind();
        songNumber = 1;
        songVar = song1;
        songVarData = songMetaData1;
        songVar.play();
        songVar.loop(0);
        } else {
          if (songNumber == 3) {
          songVar.pause();
          songVar.rewind();
          songNumber = 2;
          songVar = song2;
          songVarData = songMetaData2;
          songVar.play();
          songVar.loop(0);
          }
          }
        }
      }
    }
  }
  if (mouseX>radioX && mouseX<radioX+radioWidth && mouseY>radioY && mouseY<radioY+radioHeight) {
    if ( mouseButton == LEFT) {
      if (radioOn == false) {
        radioOn = true;
      } else {
        radioOn = false;
      }
    }
  }
  if (mouseX>loopX && mouseX<loopX+loopWidth && mouseY>loopY && mouseY<loopY+loopHeight) {
    if ( mouseButton == LEFT) {
      songVar.loop();
    }
  }
  if (mouseX>exitX && mouseX<exitX+exitWidth && mouseY>exitY && mouseY<exitY+exitHeight) {
    if ( mouseButton == LEFT) {
      exit();
    }
  }
//
}//end mousepressed
void mouseReleased() {
  draw = false;
}
//
//end main program
