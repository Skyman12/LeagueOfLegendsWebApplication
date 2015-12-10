import 'dart:html';
import 'dart:convert';
import 'Summoner.dart';
import 'dart:async';
import 'Champion.dart';

class LeagueOfLegendsServerRequests {
  Map<int, Champion> championMap;
  var host = "127.0.0.1:8081";

  LeagueOfLegendsServerRequests() {
    _getStaticChampionInformation();
  }

  Future<Summoner> buildSummoner(String summonerName) async {
    if (championMap == null) {
      await _getStaticChampionInformation();
    }

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

    s.addRankedStatsData(rankedStatsData, championMap);

    return s;
  }

  Future _getStaticChampionInformation() async {
    // URL to get the champion data
    var championUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getChampionData";

    // call the web server
    await HttpRequest.getString(championUrl).then(onChampionsLoaded);
  }

  Map onSummonerDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }

  Map onRankedStatsDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }

  void onChampionsLoaded(String responseText) {
    var jsonString = responseText;
    Map data =  JSON.decode(jsonString);
    List championNames = data['data'].keys;
    championMap = new Map();

    for (String key in championNames) {
      Champion champion = new Champion(key, data);
      championMap[data['data'][key]['id']] = champion;
    }
  }
}