import 'dart:html';

class FantasyFootball {

  var host = "127.0.0.1:8081";

  FantasyFootball() {

  }

  void loadData() {
    var url = "http://$host/getData";

    // call the web server asynchronously
    var request = HttpRequest.getString(url).then(onDataLoaded);
    print("jere");
  }

  void onDataLoaded(String responseText) {
    var jsonString = responseText;
    print(jsonString);
  }
}