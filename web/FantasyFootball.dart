import 'dart:html';
import "dart:js";

class FantasyFootball {

  var host = "127.0.0.1:8081";

  FantasyFootball() {

  }

  void getStockQuote()
  {
    String requestString = "http://www.fantasyfootballnerd.com/service/schedule/xml/6s2562qvn9mg/?format=json&callback=callbackForJsonpApi";
   //String requestString = "http://finance.yahoo.com/webservice/v1/symbols/" + "2" + "/quote?format=json&callback=callbackForJsonpApi";

    ScriptElement script = new ScriptElement();
    script.src = requestString;
    document.body.children.add(script);
  }

  void dataReceived(MessageEvent e)
  {
    print("here");
    String s = (e.data as String);
    print(s);

    // Handle the response
  }


}