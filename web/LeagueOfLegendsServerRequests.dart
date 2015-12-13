import 'dart:html';
import 'dart:convert';
import 'Summoner.dart';
import 'dart:async';
import 'Champion.dart';

class LeagueOfLegendsServerRequests {
  Map<int, Champion> championMap;
  Map<String, List<String>> championRoles;
  Map summonerData;
  Map summonerRank;
  Map rankedStatsData;

  var host = "lolteamarchitect.elasticbeanstalk.com";

  Future<Summoner> buildSummoner(String summonerName) async {
    if (championMap == null) {
      await _getStaticChampionInformation();
      await _addToChampionRoles();
    }

    // URL to get the summoner data associated with the summonerName
    var summonerUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getSummonerData&summonerName=$summonerName";

    // call the web server
    await HttpRequest.getString(summonerUrl).then(onSummonerDataLoaded).then(_assignSummonerData);

    //Build a new Summoner once the data is retrieved
    Summoner s = new Summoner(summonerName, summonerData);
    var summonerId = s.getId();

    // Get the Summoners rank
    var summonerRankUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getSummonerRank&summonerId=$summonerId";

    // call the web server
    await HttpRequest.getString(summonerRankUrl).then(onSummonerRankLoaded).then(_assignSummonerRank);

    await s.addRank(summonerRank);

    // URL to get the ranked stats data associated with the summoner id
    var rankedStatsUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getRankedStatsData&summonerId=$summonerId";

    // call the web server
    await HttpRequest.getString(rankedStatsUrl).then(onSummonerDataLoaded).then(_assignRankedStatsData);

    await s.addRankedStatsData(rankedStatsData, championMap, championRoles);

    return await s;
  }

  Future _getStaticChampionInformation() async {
    // URL to get the champion data
    var championUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getChampionData";

    // call the web server
    await HttpRequest.getString(championUrl).then(onChampionsLoaded);
  }

  Future _addToChampionRoles() async {
    // URL to get the champion data
    var championUrl = "http://$host/LeagueOfLegendsServer/simpleserver.php?action=getChampionRoles";

    // call the web server
    await HttpRequest.getString(championUrl).then(onChampionRolesLoaded);
  }

  void _assignSummonerData(Map data) {
    summonerData = data;
  }

  void _assignSummonerRank(Map data) {
    summonerRank = data;
  }

  void _assignRankedStatsData(Map data) {
    rankedStatsData = data;
  }

  Map onSummonerDataLoaded(String responseText) {
    var jsonString = responseText;
    return JSON.decode(jsonString);
  }

  Map onSummonerRankLoaded(String responseText) {
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

  void onChampionRolesLoaded(String responseText) {
    var jsonString = responseText;
    championRoles = JSON.decode(jsonString);
  }
}