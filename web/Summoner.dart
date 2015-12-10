import "LeagueOfLegendsServerRequests.dart";
import 'ChampionStats.dart';
import 'Champion.dart';
import 'RankedGameStats.dart';

class Summoner {
  int _id;
  String _name;
  int _profileIconId;
  int _summonerLevel;
  List<ChampionStats> _championStats;


  Summoner(String summonerName, Map summonerData) {
    _name = summonerName;
    _buildBasicSummonerInformation(summonerData);
  }

  String getName() {
    return _name;
  }

  int getId() {
    return _id;
  }

  int getProfileIconId() {
    return _profileIconId;
  }

  int getSummonerLevel() {
    return _summonerLevel;
  }

  List<ChampionStats> getChampionStats() {
    return _championStats;
  }

  void _buildBasicSummonerInformation(Map summonerData) {
    _id = summonerData[_name]['id'];
    _profileIconId = summonerData[_name]['profileIconId'];
    _summonerLevel = summonerData[_name]['summonerLevel'];
  }

  void addRankedStatsData(Map data, Map<int, Champion> championMap) {
    _championStats = new List();
    for (Map rankedData in data['champions']) {
        // Dont want to get 0 -- that is the data for all champions
        if (rankedData['id'] != 0) {
          Champion champion = championMap[rankedData['id']];
          RankedGameStats stats = new RankedGameStats(rankedData['stats']);
          _championStats.add(new ChampionStats(champion, stats));
        }
    }
  }

  String toString() {
    return
      "ID: " + _id.toString() +
      "\nName: " + _name +
      "\nProfile Icon Id: " + _profileIconId.toString() +
      "\nSummoner Level: " + _summonerLevel.toString();
  }



}