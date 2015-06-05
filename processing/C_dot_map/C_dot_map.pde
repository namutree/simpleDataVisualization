Table table;
PImage pImg;

float latMax, latMin, lonMax, lonMin;

void setup() {

  table = loadTable("../../data/ny_instagram_2014.csv", "header");
  pImg = loadImage("../../data/point.png");
  pImg.resize(4, 4);


  float[] lat = table.getFloatColumn("lat");
  float[] lon = table.getFloatColumn("lon");

  latMax= max(lat);
  latMin= min(lat);
  lonMax= max(lon);
  lonMin= min(lon);
  
  println(latMax);
  println(latMin);
  println(lonMax);
  println(lonMin);

  float w = (lonMax - lonMin)*1700;
  float h = (latMax - latMin)*1700;

  size((int)w, (int)h);
  println("w:", w, ", h:", h);
}

void draw() {

  background(0);
  for (TableRow t : table.rows ()) {
    float lat = t.getFloat("lat"); //y
    float lon = t.getFloat("lon"); //x
    lat = map(lat, latMin, latMax, height, 0);
    lon = map(lon, lonMin, lonMax, 0, width);

    noStroke();
    fill(255);//, 20);
    pushMatrix();
    {
      translate(lon, lat);
      //ellipse(0, 0, 5, 5);
      tint(255, 100);
      image(pImg, 0, 0);
    }
    popMatrix();
  }

}

