/*

 ITP Data Art by Jer Thorp
 NYTimes Article Search v2 Simple Example
 
 **Note - you must put your API key in the first field for this to work!
 
 Article Search v2 docs: http://developer.nytimes.com/docs/read/article_search_api_v2 
 
 */

String apiKey = "------PUT YOUR APIKEY-----";
String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?";
int startYear = 1965;
int endYear = 2014;
String searchWord = "rain";

void setup() {
  size(1280, 720, P3D);
  smooth(4);
  background(255);
  
  //This function returns a list of integers, counting a search term per year
  int[] issCounts = doASearchYears(searchWord, startYear, endYear+1);
  
  //Which we can draw a bar chart from:
  for (int i = 0; i < issCounts.length; i++) {
   fill(0,150);
   float x = map(i,0, issCounts.length,100, width - 100);
   float y = height - 100;
   float w = (width - 200)/issCounts.length;
   float h = -map(issCounts[i], 0, max(issCounts), 0, height - 200);
   rect(x, y, w, h);
   fill(255);
   pushMatrix();
   translate(x,y);
   rotate(PI/2);
   textSize(10);
   text(i + 1901, 0, 8);
   popMatrix();
  }
  
  //It's often useful to save data like this (so we don't have to call the API every time once we're visualizing)
  PrintWriter writer = createWriter("../../data/"+searchWord+"Data.csv");
  int c =0;
  writer.println("year,counts");
  for (int i:issCounts) {
    writer.println(startYear+c+","+i);
    c++;
  }
  writer.flush();
  writer.close();
  
}

void draw() {
}



