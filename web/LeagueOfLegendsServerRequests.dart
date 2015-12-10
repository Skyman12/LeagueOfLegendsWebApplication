import 'dart:html';
import 'dart:convert';
import 'Summoner.dart';
import 'dart:async';

class LeagueOfLegendsServerRequests {

  static var host = "127.0.0.1:8081";

  LeagueOfLegendsServerRequests() {

  }

  static Future<Summoner> buildSummoner(String summonerName) async {
    var url = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getSummonerData&summonerName=$summonerName";

    // call the web server asynchronously
    Map summonerData = await HttpRequest.getString(url).then(onDataLoaded);

    //Build a new Summoner once the data is retrieved
    Summoner s = new Summoner(summonerName, summonerData);
    return s;
  }

  // print the raw json response text from the server
  static Map onDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }
}