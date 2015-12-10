import 'Champion.dart';
import 'RankedGameStats.dart';

class ChampionStats {

  Champion champion;
  RankedGameStats stats;

  ChampionStats(Champion champion, RankedGameStats stats) {
    this.champion = champion;
    this.stats = stats;
  }

  String toString() {
    return "Champion: " + champion.toString() +
      "\nStats: " + stats.toString();
  }

}