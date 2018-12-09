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
  table.addColumn("actor 1");
  table.addColumn("associated actor 1"); // associated actor that is allied with actor1 / identifies with actor1
  table.addColumn("inter 1"); // A numeric code (int) indicating the type of ACTOR1.
  table.addColumn("actor 2");
  table.addColumn("associated actor 2"); // associated actor that is allied with actor2 / identifies with actor2
  table.addColumn("inter 2"); // A numeric code (int) indicating the type of ACTOR2.
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
    row.setString("date", json.getJSONArray("data").getJSONObject(i).getString("event_date"));
    row.setString("time precision", json.getJSONArray("data").getJSONObject(i).getString("time_precision"));
    row.setString("type of violence", json.getJSONArray("data").getJSONObject(i).getString("event_type"));
    row.setString("actor 1", json.getJSONArray("data").getJSONObject(i).getString("actor1"));
    row.setString("associated actor 1", json.getJSONArray("data").getJSONObject(i).getString("assoc_actor_1"));
    row.setString("inter 1", json.getJSONArray("data").getJSONObject(i).getString("inter1"));
    row.setString("actor 2", json.getJSONArray("data").getJSONObject(i).getString("actor2"));
    row.setString("associated actor 2", json.getJSONArray("data").getJSONObject(i).getString("assoc_actor_2"));
    row.setString("inter 2", json.getJSONArray("data").getJSONObject(i).getString("inter2"));
    
  
    // save table as csv
    saveTable(table, "data/data.csv");
  }
}
