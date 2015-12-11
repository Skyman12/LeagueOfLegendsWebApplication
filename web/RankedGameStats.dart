class RankedGameStats {

    int wins;
    int losses;
    int totalGamesPlayed;
    double winPercentage;
    int totalChampionKills;
    int totalAssists;
    int totalMinionKills;
    int totalDeaths;
    double averageChampionKills;
    double averageAssists;
    double averageDeaths;
    double averageMinionKills;

    RankedGameStats(Map data) {
      wins = data['totalSessionsWon'];
      losses = data['totalSessionsLost'];
      totalGamesPlayed = data['totalSessionsPlayed'];
      winPercentage = wins / totalGamesPlayed;
      totalChampionKills = data['totalChampionKills'];
      averageChampionKills = totalChampionKills / totalGamesPlayed;
      totalAssists = data['totalAssists'];
      averageAssists = totalAssists / totalGamesPlayed;
      totalMinionKills = data['totalMinionKills'];
      averageMinionKills = totalMinionKills / totalGamesPlayed;
      totalDeaths = data['totalDeathsPerSession'];
      averageDeaths = totalDeaths / totalGamesPlayed;
    }

    String toString() {
      return "Wins: " + wins.toString() +
        "\nLosses: " + losses.toString() +
        "\nTotal Games: " + totalGamesPlayed.toString() +
        "\nTotal Champion Kills: " + totalChampionKills.toString() +
        "\ntotal Assists: " + totalAssists.toString() +
        "\nTotal Minion Kills: " + totalMinionKills.toString() +
        "\nTotal Deaths: " + totalDeaths.toString() + "\n";
    }
}