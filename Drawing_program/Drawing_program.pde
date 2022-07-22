import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global variables
float drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight, drawingDiamater;
Boolean draw=false;
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
  //
  rect(drawingsurfaceX, drawingsurfaceY, drawingsurfaceWidth, drawingsurfaceHeight);
  //
  
}//end setup
//
void draw() {
  if () {} else{}
  ellipse(mouseX, mouseY, drawingDiamater, drawingDiamater); //example circle test 
}//end draw
//
void keyPressed() {
}//end keypressed
//
void mousePressed() {
  if(mouseX> && mouseX< && mouseY> && mouseY<)
}//end mousepressed
//
//end main program
