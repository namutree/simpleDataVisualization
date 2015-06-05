Table snowTable;
Table rainTable;

void setup() {
  size(1280, 720, P3D);
  smooth(4);

  snowTable = loadTable("../../data/snowData.csv");
  rainTable = loadTable("../../data/rainData.csv");
}

void draw() {

  background(100);
  noStroke();

  for (int i = 0; i < snowTable.getRowCount (); i++) {
    int snow = snowTable.getInt(i, 1);
    int rain = rainTable.getInt(i, 1);

    float y = height/2;
    float x = map(i, 0, snowTable.getRowCount(), 50, width - 50);
    float snowR = map(snow, 0, 4000, 0, 80);
    float rainR = map(rain, 0, 4000, 0, 80);

    fill(0, 0, 255, 100);
    ellipse(x, y, rainR, rainR);

    fill(255, 100);
    ellipse(x, y, snowR, snowR);

    if (mouseX >x-15 && mouseX <x+15 && mouseY >y-15 && mouseY <y+15) {
      fill(0);
      text(snowTable.getInt(i, 0), width/2, height*3/4);
    }
  }
}

