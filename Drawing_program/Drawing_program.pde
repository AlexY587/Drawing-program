import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables
float colorchangeRedX, colorchangeRedY, colorchangeRedWidth, colorchangeRedHeight;
float colorchangeBlueX, colorchangeBlueY, colorchangeBlueWidth, colorchangeBlueHeight;
float drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight, drawingDiamater;
Boolean draw=false;
PFont titlefont;
color Variable, red=#FF0303, blue=#0503FF, reset=#FFFFFF;
//
void setup() {
  //display checker
  //display orientation checker
  //display and canvas checker
  size(500, 600);
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
  if(orientation == ls) {
    println("good to go");
  } else {
    appwidth *= 0;
    appheight *= 0;
    println(instruct);
  }
  //
  //population
  drawingsurfaceX = width*0;
  drawingsurfaceY = height*0;
  drawingsurfaceWidth = width*3/4;
  drawingsurfaceHeight = height*4/5;
  drawingDiamater = width*1/100;
  colorchangeRedX = appwidth/5;
  colorchangeRedY = appheight*1/10;
  colorchangeRedWidth = appwidth/40;
  colorchangeRedHeight = appheight/24;
  titlefont = createFont("Times New Roman", 60);
  //
  rect(drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight);
  //
  
}//end setup
//
void draw() {
  if (draw == true && (mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight)) {
  stroke(Variable);
  line(mouseX, mouseY, pmouseX, pmouseY); //example circle test 
  }
  fill(red);
  rect(colorchangeRedX, colorchangeRedY, colorchangeRedWidth, colorchangeRedHeight);
  fill(reset);
}//end draw
//
void keyPressed() {
}//end keypressed
//
void mousePressed() {
  if(mouseX>drawingsurfaceX && mouseX<drawingsurfaceX + drawingsurfaceWidth && mouseY>drawingsurfaceY && mouseY<drawingsurfaceY + drawingsurfaceHeight) {
 if (draw == false){
  draw = true;
  }else{
  draw = false;
  }
}
if(mouseX>colorchangeRedX && mouseX<colorchangeRedX+colorchangeRedWidth && mouseY>colorchangeRedY && mouseY<colorchangeRedY+colorchangeRedHeight) {
   if ( mouseButton == LEFT) {
     Variable = red;
   }
   }
}//end mousepressed
//
//end main program
