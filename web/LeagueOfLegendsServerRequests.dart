import 'dart:html';
import 'dart:convert';
import 'Summoner.dart';
import 'dart:async';

class LeagueOfLegendsServerRequests {

  static var host = "127.0.0.1:8081";

  LeagueOfLegendsServerRequests() {

  }

  static Future<Summoner> buildSummoner(String summonerName) async {
    // URL to get the summoner data associated with the summonerName
    var summonerUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getSummonerData&summonerName=$summonerName";

    // call the web server
    Map summonerData = await HttpRequest.getString(summonerUrl).then(onSummonerDataLoaded);

    //Build a new Summoner once the data is retrieved
    Summoner s = new Summoner(summonerName, summonerData);
    var summonerId = s.getId();

    // URL to get the ranked stats data associated with the summoner id
    var rankedStatsUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getRankedStatsData&summonerId=$summonerId";

    // call the web server
    Map rankedStatsData = await HttpRequest.getString(rankedStatsUrl).then(onSummonerDataLoaded);

    s.addRankedStatsData(rankedStatsData);

    return s;
  }

  static Map onSummonerDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }

  static Map onRankedStatsDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }
}