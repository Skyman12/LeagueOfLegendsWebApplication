import 'Summoner.dart';
import 'ChampionStats.dart';

class SummonerWithChampion {

  Summoner summoner;
  ChampionStats stats;

  SummonerWithChampion(Summoner summoner, ChampionStats stats ) {
    this.summoner = summoner;
    this.stats = stats;
  }
}