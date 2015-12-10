import "LeagueOfLegendsServerRequests.dart";

class Summoner {
  int _id;
  String _name;
  int _profileIconId;
  int _summonerLevel;


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

  void _buildBasicSummonerInformation(Map summonerData) {
    _id = summonerData[_name]['id'];
    _profileIconId = summonerData[_name]['profileIconId'];
    _summonerLevel = summonerData[_name]['summonerLevel'];
  }

  void addRankedStatsData(Map data) {
    print(data.toString());
  }

  String toString() {
    return
      "ID: " + _id.toString() +
      "\nName: " + _name +
      "\nProfile Icon Id: " + _profileIconId.toString() +
      "\nSummoner Level: " + _summonerLevel.toString();
  }

}