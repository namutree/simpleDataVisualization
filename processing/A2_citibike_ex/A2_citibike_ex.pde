String endPoint = "http://www.citibikenyc.com/stations/json";

void setup() {
  size(1280, 720);
  smooth(4);
  background(10);
  loadBikeData();
}

void draw() {
}

void loadBikeData() {
  JSONObject bikeJSON = loadJSONObject(endPoint);
  JSONArray stations = bikeJSON.getJSONArray("stationBeanList");

  //Single station JSON example -->
  //"id": 72,"stationName": "W 52 St & 11 Ave","availableDocks": 25,"totalDocks": 38,"latitude": 40.76727216,"longitude": -73.99392888,"statusValue": "In Service","statusKey": 1,"availableBikes": 13,"stAddress1": "W 52 St & 11 Ave","stAddress2": "","city": "","postalCode": "","location": "","altitude": "","testStation": false,"lastCommunicationTime": null,"landMark": ""
  for (int i=0; i< stations.size (); i++) {
    JSONObject station = stations.getJSONObject(i);
    //    println(station.getString("stationName"));
    int totalDocks = station.getInt("totalDocks"); 
    int avaiableDocks = station.getInt("availableDocks");

    float x = map(i,0,stations.size(), 50, width-50);
    float y = height*0.5;
    //float x = map (station.getFloat("longitude"), -74.059963 ,-73.818274 ,50, width-50);
    //float y = map(station.getFloat("latitude"),40.635471, 40.775255, height-50, 50); ;

    float w = 2;
    float h = totalDocks*2;
    float h2 = avaiableDocks*2;
    
    noStroke();
    fill(255);
    rect(x,y,w,-h); // "-h" makes the bar faces to up direction!!!!
    
    fill(255,0,0);
    rect(x+1,y,w,-h2);
    
  }
}

