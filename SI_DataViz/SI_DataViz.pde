Table table;
JSONObject json;
int dataEntries = 20;

void setup() {
  size(1000,600);
  createTable();
  getData();
  addDataToTable();
}

void draw() {
  background(200);
}

void getData() {
  json = loadJSONObject("https://api.acleddata.com/acled/read?limit=40&country=yemen");
}

void createTable() {
  table = new Table();
  table.addColumn("country");
  table.addColumn("date");
  table.addColumn("time precision"); // how precise is the time of the event
  table.addColumn("type of violence");
  table.addColumn("actor1");
  table.addColumn("associated actor 1"); // associated actor that is allied with actor1 / identifies with actor1
  table.addColumn("inter1"); // A numeric code (int) indicating the type of ACTOR1.
  table.addColumn("actor2");
  table.addColumn("associated actor 2"); // associated actor that is allied with actor2 / identifies with actor2
  table.addColumn("inter2"); // A numeric code (int) indicating the type of ACTOR2.
  table.addColumn("interaction"); // A numeric code indicating the interaction between types of ACTOR1 and ACTOR2
  table.addColumn("administrative Area 1"); // biggest administrative area
  table.addColumn("administrative Area 2"); // smaller administrative area
  table.addColumn("administrative Area 3"); // smallest administrative area
  table.addColumn("location");
  table.addColumn("latitude");
  table.addColumn("longtitude");
  table.addColumn("notes"); // description of event
  table.addColumn("sources"); // sources of reports
  table.addColumn("fatalities"); // todesfälle
}

void addDataToTable() {
  for (int i = 0; i<dataEntries; i++) {
    
    TableRow row = table.addRow();
    row.setString("country", json.getJSONArray("data").getJSONObject(i).getString("country"));
    
  
    // save table as csv
    saveTable(table, "data/data.csv");
  }
}
