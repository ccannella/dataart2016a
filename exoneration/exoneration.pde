Table table;

void setup() {
  size(850,2500);
  loadData();
      smooth(2);

}

void draw () {

}

void loadData() {
  colorMode(HSB);
  background(10,10,10);

  String url = "exonerations.csv";
  table= loadTable(url, "header");
  
 println(table.getRowCount() + " total rows in table"); 
 
 fill(150,97,144);     
 noStroke();
 
 beginShape();
  vertex(69,0);
  vertex(width, 0);
  vertex(width+69, height);
  
  endShape();
 //rect(width/2,0,width,height);

 for (TableRow row : table.rows()) {

    
    int  intime = row.getInt("Yrs in Jail") ;
    float intimemap = map (intime, 0,100, 0,500);
    int outtime = row.getInt("sentence in years2")- intime;
    float outtimemap = map (outtime, 0, 100, 0, 500);

     float rowq = row.getInt("RowID");
     float y = 2 + map(row.getInt("RowID"),0,1570,0,height);
     
    //println(date + " (" + age + " YO) has an ID of " + id);
    strokeWeight(1);
    colorMode(HSB);
    //blendMode(ADD);
    blendMode(ADD);
    fill(150,97,144,95);
   
    float startx = width/12 + y;
    float yeach = 10;
    
 if(outtime > 0){
    // time in jail
  beginShape(TRIANGLES);
  vertex(startx, y);
  vertex(startx - intimemap, y);
  vertex(startx- intimemap, y + yeach);

  endShape();
     
     fill(0,0,255,80);
    
    beginShape(TRIANGLES);
  vertex(startx, y);
  vertex(startx + outtimemap, y);
  vertex(startx+ outtimemap, y - yeach);

  endShape();
  }

 }
}