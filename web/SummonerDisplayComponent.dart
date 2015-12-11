import 'Summoner.dart';
import "dart:html";

class SummonerDisplayComponent {

  static DivElement buildComponent(Summoner s) {
      DivElement div = new DivElement();
      div.className = "jumbotron text-center";

      String summonerName = s.getName();
      String displayString = summonerName + " : " + s.tier + " " + s.division;
      div.innerHtml = "<h1> $displayString </h1>";
      return div;
  }

  static TableRowElement buildPlayerRoleComponent(Summoner s) {
    TableRowElement tableRow = new TableRowElement();
    tableRow.style.backgroundColor = "#FF0000";

    TableCellElement summonerName = tableRow.insertCell(0);
    summonerName.text = s.getName();
    summonerName.style.textAlign = "center";

    return tableRow;
  }
}