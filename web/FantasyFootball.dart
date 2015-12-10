import 'dart:html';
import 'dart:convert';

class FantasyFootball {

  var host = "127.0.0.1:8081";

  FantasyFootball() {

  }

  void loadData() {
    var url = "http://127.0.0.1:8081/simpleserver.php?action=CreatePost";

    // call the web server asynchronously
    var request = HttpRequest.getString(url).then(onDataLoaded);
  }

  // print the raw json response text from the server
  void onDataLoaded(String responseText) {
    var jsonString = responseText;
    Map parsedMap = JSON.decode(jsonString);
    print(parsedMap['skyman12']["summonerLevel"]);
  }
}