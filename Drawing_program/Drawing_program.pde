import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables
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
float squareStampX, squareStampY, squareStampWidth, squareStampHeight;
float circleDrawX, circleDrawY, circleDrawWidth, circleDrawHeight;
float defaultX, defaultY, defaultWidth, defaultHeight;
float shapePalletX, shapePalletY, shapePalletWidth, shapePalletHeight;
//menu
float menuX, menuY, menuWidth, menuHeight;
//misc
int colorSelectortitleSize;
String colorSelectortitle = "Color Selector";
Boolean draw=false, colorSelecting=false;
PFont titlefont;
color Variable, red=#FF0303, blue=#0503FF, reset=#FFFFFF, green=#36FF00, black=#000000, grey=#AFAFAF;
color redTint=#A50000, blueTint=#0011A5, greenTint=#00A52D, blackTint=#5D5D5D, selectorTint=#FFFFFF, shapeSelectorTint=#FFFFFF, squareTint=#FFFFFF, circleTint=#FFFFFF, lineTint=#FFFFFF;
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
    line(mouseX, mouseY, pmouseX, pmouseY); //line draw
    //line(mouseX, mouseY, 0, 0); //cooler line draw
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
  if (mouseX>squareStampX && mouseX<squareStampX+squareStampWidth && mouseY>squareStampY && mouseY<squareStampY+squareStampHeight) {
    squareTint = grey;
  } else {
    squareTint = reset;
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
  rect(shapePalletX, shapePalletY, shapePalletWidth, shapePalletHeight);
  fill(squareTint);
  rect(squareStampX, squareStampY, squareStampWidth, squareStampHeight);
  fill(circleTint);
  ellipse(circleStampX, circleStampY, circleStampWidth, circleStampHeight);
  rect(defaultX, defaultY, defaultWidth, defaultHeight);
  fill(black);
  textAlign(CENTER, CENTER );
  textFont(titlefont, 15);
  text("Line",defaultX, defaultY, defaultWidth, defaultHeight);
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
}//end mousepressed
void mouseReleased() {
  draw = false;
}
//
//end main program
