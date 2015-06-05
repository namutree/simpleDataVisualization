//float[] numbers = {6, 3, 7, 5, 4, 5, 6.5, 4, 4, 3, 5, 6, 2, 3, 6, 7, 6, 7, 7, 3, 3};
float[] numbers = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
};
float maxNo, minNo;

void setup() {
  size(1280, 720, P3D);
  smooth(4);

  maxNo = max(numbers);
  minNo = min(numbers);
  println(maxNo);
  println(minNo);

  numbers = sort(numbers);
}

void draw() {

  background(0);
  colorMode(HSB);

  noStroke();
  for (int i=0; i<numbers.length; i++) {
    float n = numbers[i]; 
    float y = height/2;
    float x = map(i, 0, numbers.length-1, 50, width-50);
    float h = map(n, minNo, maxNo, 10, 100);
    float c = map(n, minNo, maxNo, 0, 255);
    float r = map(n, minNo, maxNo, 0, TAU);

    fill(c, 255, 255);

    pushMatrix();
    translate(x, y);
    //rotate(r);
    rect(0, 0, 10, h);
    popMatrix();
  }
}

