
PImage img = new PImage();
Table table = new Table();
IntDict colorList;
int margin = 30;
float pixelSize;

void setup() {
  size(300+margin, 300);

  //0 ,1  ,2  ,3  ,4
  //id,lat,lon,url,created_time
  table = loadTable("../../data/ny_instagram_2014.csv", "header");
  loadmyImage();

  pixelSize = img.width * img.height;
}

void draw() {
  background(255);
  image(img, 0, 0);
   //filter(POSTERIZE, 20);

  colorList = new IntDict();

  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      int hh = round(hue(img.get(i, j)));
      int ss = round(saturation(img.get(i, j)));
      int bb = round(brightness(img.get(i, j)));

      String hhh = getThreeNo(hh);
      String sss = getThreeNo(ss);
      String bbb= getThreeNo(bb);

      String ccc = hhh+"-"+sss+"-"+bbb;

      colorList.add(ccc, 1);
    }
  }
  colorMode(HSB);

  colorList.sortKeysReverse();
  String[] theKeys = colorList.keyArray();
  int[] amounts = colorList.valueArray();
  float prevRectEnd = 0.0;

  for (int i=0; i<theKeys.length; i++) {
    String[] hhssbb = theKeys[i].split("-");
    fill(int(hhssbb[0]), int(hhssbb[1]), int(hhssbb[2]));
    noStroke();
    float rectPercent = (1.0*amounts[i])/( pixelSize ) ;
    println("Color " + i + ": " + int(theKeys[i]) + " / " + rectPercent + "%");
    rect(img.width, floor(prevRectEnd), margin, ceil(rectPercent*float(height)) );

    fill(int(hhssbb[0]), 255, 255);
    rect(width-5, floor(prevRectEnd), 5, ceil(rectPercent*float(height)) );

    fill(255,0, int(hhssbb[2]));
    rect(img.width, floor(prevRectEnd), 5, ceil(rectPercent*float(height)) );
    prevRectEnd += rectPercent*float(height);

  }

  println("done");
  noLoop();
}


void keyPressed() {
  loadmyImage();
  loop();
}

void loadmyImage() {
  try {
    int rdNo = floor(random(table.getRowCount()));
    img = loadImage(table.getString(rdNo, "url"));
    img.resize(300, 300);
  }
  catch(Exception e) {
    img = loadImage(table.getString(0, "url"));
    img.resize(300, 300);
  }
}

String getThreeNo (int no) {
  String three;
  if (no<10) three ="00"+str(no);
  else if (no<100) three= "0"+str(no);
  else three = str(no);

  return three;
}

