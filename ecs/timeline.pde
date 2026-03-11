//Lucy Kleven | 23 Feb 2026 | Timeline
void setup() {
  size(950, 400);
}
void draw() {
  background(#5C78FA);
  drawRef();
  histEvent(191,200, "August 2015",true, "Chloe learns about lacrosse, this is when she first starts playing.");
  histEvent(332,300, "Febuary 2019",false, "Chloe starts her high school career on Darien High School's Varsity Girls Lacrosse.");
  histEvent(473, 200,"Febuary 2023",true, "Chloe plays her last season in high school.");
  histEvent(614, 300," May 2023", false, "She gets recruited for University of North Carolina.");
  histEvent(755, 200, "May 2025", true, "She wins Tewaarton Award.");
}
void drawRef() {
  textAlign(CENTER);
  textSize(36);
  text("Chloe Humphrey: Timelime", width/2,70);
  textSize(20);
  text("by Lucy Kleven", width/2, 95);
  strokeWeight(5);
  line(50,250,900,250);
  textSize(15);
  text("2005",50, 220);
  text("2026", 900, 220);
 
  strokeWeight(2);
  line(50, 230,50,270);
   line(900, 230,900,270);
    
    
    
}
void histEvent(int x, int y, String title, boolean top, String detail) {
  if(top==true) {
    line(x,y,x-15,y+50);
  } else {
    line(x,y,x-15,y-50);
  }
  rectMode(CENTER);
  fill(#4169E1);
  strokeWeight(2);
  rect(x,y,100,30,10);
  fill(0);
  text(title,x,y+5);
  if(mouseX > x-50 && mouseX < x+50 && mouseY > y-15 && mouseY < y+15) {
  text(detail, width/2,350);
}
}
