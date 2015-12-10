class RankedGameStats {

    int wins;
    int losses;
    int totalGamesPlayed;
    int totalChampionKills;
    int totalAssists;
    int totalMinionKills;
    int totalDeaths;

    RankedGameStats(Map data) {
      wins = data['totalSessionsWon'];
      losses = data['totalSessionsLost'];
      totalGamesPlayed = data['totalSessionsPlayed'];
      totalChampionKills = data['totalChampionKills'];
      totalAssists = data['totalAssists'];
      totalMinionKills = data['totalMinionKills'];
      totalDeaths = data['totalDeathsPerSession'];
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