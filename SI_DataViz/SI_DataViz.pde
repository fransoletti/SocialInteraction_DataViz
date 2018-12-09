Table table;
JSONObject json  ;

void setup() {
  size(1000,600);
  getData();
}

void draw() {
  background(200);
}

void getData() {
  json = loadJSONObject("https://api.acleddata.com/acled/read?limit=40&country=yemen");
}

void createTable() {
  table = new Table();
  table.addColumn("#");
  table.addColumn("city");
  table.addColumn("aqi");
  table.addColumn("temperature");
  table.addColumn("humidity");
  table.addColumn("clouds");
  table.addColumn("airpressure");
  table.addColumn("ID"); 
}
