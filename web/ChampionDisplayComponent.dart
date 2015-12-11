import 'ChampionStats.dart';
import "dart:html";

class ChampionDisplayComponent {

  static TableRowElement buildComponent(ChampionStats c, String rowColor) {
    TableRowElement tableRow = new TableRowElement();
    tableRow.style.backgroundColor = rowColor;
    var image = c.champion.image;
    var version = c.champion.version;

    TableCellElement championPicture = tableRow.insertCell(0);
    championPicture.append(new ImageElement(src: "http://ddragon.leagueoflegends.com/cdn/$version/img/champion/$image", width : 64, height : 64));
    championPicture.style.textAlign = "center";

    TableCellElement championName = tableRow.insertCell(1);
    championName.text = c.champion.name;

    TableCellElement championTotalGames = tableRow.insertCell(2);
    championTotalGames.text = c.stats.totalGamesPlayed.toString();
    championTotalGames.style.textAlign = "center";

    TableCellElement championWinPercentage = tableRow.insertCell(3);
    championWinPercentage.text = (c.stats.winPercentage * 100).toStringAsFixed(2) + "%";
    championWinPercentage.style.textAlign = "center";

    TableCellElement championWins = tableRow.insertCell(4);
    championWins.text = c.stats.wins.toString();
    championWins.style.textAlign = "center";

    TableCellElement championLosses = tableRow.insertCell(5);
    championLosses.text = c.stats.losses.toString();
    championLosses.style.textAlign = "center";

    TableCellElement averageKills = tableRow.insertCell(6);
    averageKills.text = c.stats.averageChampionKills.toStringAsFixed(2);
    averageKills.style.textAlign = "center";

    TableCellElement averageDeaths = tableRow.insertCell(7);
    averageDeaths.text = c.stats.averageDeaths.toStringAsFixed(2);
    averageDeaths.style.textAlign = "center";

    TableCellElement averageAssists = tableRow.insertCell(8);
    averageAssists.text = c.stats.averageAssists.toStringAsFixed(2);
    averageAssists.style.textAlign = "center";

    TableCellElement averageFarm = tableRow.insertCell(9);
    averageFarm.text = c.stats.averageMinionKills.toStringAsFixed(2);
    averageFarm.style.textAlign = "center";

    TableCellElement midScore = tableRow.insertCell(10);
    midScore.text = c.midScore.toStringAsFixed(2);
    midScore.style.textAlign = "center";

    TableCellElement topScore = tableRow.insertCell(11);
    topScore.text = c.topScore.toStringAsFixed(2);
    topScore.style.textAlign = "center";

    TableCellElement adcScore = tableRow.insertCell(12);
    adcScore.text = c.adcScore.toStringAsFixed(2);
    adcScore.style.textAlign = "center";

    TableCellElement supportScore = tableRow.insertCell(13);
    supportScore.text = c.supportScore.toStringAsFixed(2);
    supportScore.style.textAlign = "center";

    TableCellElement jungleScore = tableRow.insertCell(14);
    jungleScore.text = c.jungleScore.toStringAsFixed(2);
    jungleScore.style.textAlign = "center";

    return tableRow;
  }
}