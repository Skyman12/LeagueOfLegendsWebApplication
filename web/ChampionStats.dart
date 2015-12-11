import 'Champion.dart';
import 'RankedGameStats.dart';

class ChampionStats {

  Champion champion;
  RankedGameStats stats;

  double adcScore;
  double midScore;
  double topScore;
  double supportScore;
  double jungleScore;

  ChampionStats(Champion champion, RankedGameStats stats) {
    this.champion = champion;
    this.stats = stats;
    adcScore = _calculateAdcScore();
    midScore = _calculateMidScore();
    topScore = _calculateTopScore();
    supportScore = _calculateSupportScore();
    jungleScore = _calculateJungleScore();
  }

  String toString() {
    return "Champion: " + champion.toString() +
      "\nStats: " + stats.toString();
  }

  double _calculateAdcScore() {
    if (champion.roles.contains("Adc")) {
      double gamesMultiplier = 1.0;

      int gameScore = stats.wins  - stats.losses;
      if (stats.totalGamesPlayed < 5 ) {
        gamesMultiplier = .2 * stats.totalGamesPlayed;
      }

      double statsScore = 1 * stats.averageChampionKills + .5 * stats.averageAssists - 1 * stats.averageDeaths + .025 * stats.averageMinionKills;
      return (gameScore + statsScore) * gamesMultiplier;
    } else {
      return 0.0;
    }
  }

  double _calculateMidScore() {
    if (champion.roles.contains("Mid")) {
      double gamesMultiplier = 1.0;

      int gameScore = stats.wins  - stats.losses;
      if (stats.totalGamesPlayed < 5 ) {
        gamesMultiplier = .2 * stats.totalGamesPlayed;
      }

      double statsScore = 1 * stats.averageChampionKills + .5 * stats.averageAssists - 1 * stats.averageDeaths + .025 * stats.averageMinionKills;
      return (gameScore + statsScore) * gamesMultiplier;
    } else {
      return 0.0;
    }
  }

  double _calculateTopScore() {
    if (champion.roles.contains("Top")) {
      double gamesMultiplier = 1.0;

      int gameScore = stats.wins  - stats.losses;
      if (stats.totalGamesPlayed < 5 ) {
        gamesMultiplier = .2 * stats.totalGamesPlayed;
      }

      double statsScore = 1 * stats.averageChampionKills + .5 * stats.averageAssists - 1 * stats.averageDeaths + .025 * stats.averageMinionKills;
      return (gameScore + statsScore) * gamesMultiplier;
    } else {
      return 0.0;
    }
  }

  double _calculateSupportScore() {
    if (champion.roles.contains("Support")) {
      double gamesMultiplier = 1.0;

      int gameScore = stats.wins  - stats.losses;
      if (stats.totalGamesPlayed < 5 ) {
        gamesMultiplier = .2 * stats.totalGamesPlayed;
      }

      double statsScore = 1 * stats.averageChampionKills + 1.0 * stats.averageAssists - 1.5 * stats.averageDeaths + 0 * stats.averageMinionKills;
      return (gameScore + statsScore) * gamesMultiplier;
    } else {
      return 0.0;
    }
  }

  double _calculateJungleScore() {
    if (champion.roles.contains("Jungle")) {
      double gamesMultiplier = 1.0;

      int gameScore = stats.wins  - stats.losses;
      if (stats.totalGamesPlayed < 5 ) {
        gamesMultiplier = .2 * stats.totalGamesPlayed;
      }

      double statsScore = 1 * stats.averageChampionKills + .75 * stats.averageAssists - 1 * stats.averageDeaths + .05 * stats.averageMinionKills;
      return (gameScore + statsScore) * gamesMultiplier;
    } else {
      return 0.0;
    }
  }

}