import 'Champion.dart';
import 'RankedGameStats.dart';

class ChampionStats {

  Champion _champion;
  RankedGameStats _stats;

  ChampionStats(Champion champion, RankedGameStats stats) {
    _champion = champion;
    _stats = stats;
  }

  String toString() {
    return "Champion: " + _champion.toString() +
      "\nStats: " + _stats.toString();
  }
}