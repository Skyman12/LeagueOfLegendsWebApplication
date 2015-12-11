// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'ChampionDisplayComponent.dart';
import 'SummonerDisplayComponent.dart';
import 'ChampionStats.dart';
import 'Summoner.dart';
import 'dart:html';

final String darkColor = "#d3d3d3";
final String lightColor = "#F5FFFA";

Summoner summoner;

void main() {
  var summonerData = querySelector("#submitSummonerData");
  summonerData.onClick.listen(getSummonerData);

  var sortingType = querySelector("#sortingType");
  sortingType.onChange.listen(updateChampionDisplayWithSort);

  var sortingOrder = querySelector("#sortingOrder");
  sortingOrder.onChange.listen(updateChampionDisplayWithSort);
}

Future getSummonerData(Event e) async {
  LeagueOfLegendsServerRequests serverRequests = new LeagueOfLegendsServerRequests();
  InputElement inputElement = querySelector("#summonerName");

  querySelector("#progressBar").style.visibility = "visible";

  summoner = await serverRequests.buildSummoner(inputElement.value);

  DivElement summonerDiv = SummonerDisplayComponent.buildComponent(summoner);

  var element = querySelector("#summoner-information-container");
  element.children.clear();
  element.children.add(summonerDiv);

  updateChampionDisplayWithSort();

  querySelector("#progressBar").style.visibility = "hidden";
  inputElement.value = "";
}

void updateChampionDisplayWithSort([Event e]) {
  List data = summoner.getChampionStats();
  SelectElement selection = querySelector("#sortingType");
  SelectElement order = querySelector("#sortingOrder");
  bool highest = order.value == "Highest";
  switch (selection.value) {
    case "Champion" :
      if (highest) {
        data.sort((a, b) => _getChampion(b).compareTo(_getChampion(a)));
      } else {
        data.sort((a, b) => _getChampion(a).compareTo(_getChampion(b)));
      }

      break;
    case "Games Played" :
      if (highest) {
        data.sort((a, b) => _getGamesPlayed(b).compareTo(_getGamesPlayed(a)));
      } else {
        data.sort((a, b) => _getGamesPlayed(a).compareTo(_getGamesPlayed(b)));
      }

      break;
    case "Win Percentage" :
      if (highest) {
        data.sort((a, b) => _getWinPercentage(b).compareTo(_getWinPercentage(a)));
      } else {
        data.sort((a, b) => _getWinPercentage(a).compareTo(_getWinPercentage(b)));
      }

      break;
    case "Wins" :
      if (highest) {
        data.sort((a, b) => _getWins(b).compareTo(_getWins(a)));
      } else {
        data.sort((a, b) => _getWins(a).compareTo(_getWins(b)));
      }

      break;
    case "Losses" :
      if (highest) {
        data.sort((a, b) => _getLosses(b).compareTo(_getLosses(a)));
      } else {
        data.sort((a, b) => _getLosses(a).compareTo(_getLosses(b)));
      }

      break;
    case "Average Kills" :
      if (highest) {
        data.sort((a, b) => _getKills(b).compareTo(_getKills(a)));
      } else {
        data.sort((a, b) => _getKills(a).compareTo(_getKills(b)));
      }

      break;
    case "Average Deaths" :
      if (highest) {
        data.sort((a, b) => _getDeaths(b).compareTo(_getDeaths(a)));
      } else {
        data.sort((a, b) => _getDeaths(a).compareTo(_getDeaths(b)));
      }

      break;
    case "Average Assists" :
      if (highest) {
        data.sort((a, b) => _getAssists(b).compareTo(_getAssists(a)));
      } else {
        data.sort((a, b) => _getAssists(a).compareTo(_getAssists(b)));
      }

      break;
    case "Average Farm" :
      if (highest) {
        data.sort((a, b) => _getFarm(b).compareTo(_getFarm(a)));
      } else {
        data.sort((a, b) => _getFarm(a).compareTo(_getFarm(b)));
      }

      break;
    case "Adc Score" :
      if (highest) {
        data.sort((a, b) => _getAdcScore(b).compareTo(_getAdcScore(a)));
      } else {
        data.sort((a, b) => _getAdcScore(a).compareTo(_getAdcScore(b)));
      }

      break;
    case "Mid Score" :
      if (highest) {
        data.sort((a, b) => _getMidScore(b).compareTo(_getMidScore(a)));
      } else {
        data.sort((a, b) => _getMidScore(a).compareTo(_getMidScore(b)));
      }

      break;
    case "Top Score" :
      if (highest) {
        data.sort((a, b) => _getTopScore(b).compareTo(_getTopScore(a)));
      } else {
        data.sort((a, b) => _getTopScore(a).compareTo(_getTopScore(b)));
      }

      break;
    case "Support Score" :
      if (highest) {
        data.sort((a, b) => _getSupportScore(b).compareTo(_getSupportScore(a)));
      } else {
        data.sort((a, b) => _getSupportScore(a).compareTo(_getSupportScore(b)));
      }

      break;
    case "Jungle Score" :
      if (highest) {
        data.sort((a, b) => _getJungleScore(b).compareTo(_getJungleScore(a)));
      } else {
        data.sort((a, b) => _getJungleScore(a).compareTo(_getJungleScore(b)));
      }

      break;
    }

  updateChampionDisplay(data);
}

double _getKills(ChampionStats cs) {
  return cs.stats.averageChampionKills;
}

double _getDeaths(ChampionStats cs) {
  return cs.stats.averageDeaths;
}

double _getAssists(ChampionStats cs) {
  return cs.stats.averageAssists;
}

double _getFarm(ChampionStats cs) {
  return cs.stats.averageMinionKills;
}

String _getChampion(ChampionStats cs) {
  return cs.champion.name;
}

int _getGamesPlayed(ChampionStats cs) {
  return cs.stats.totalGamesPlayed;
}

double _getWinPercentage(ChampionStats cs) {
  return cs.stats.winPercentage;
}

int _getWins(ChampionStats cs) {
  return cs.stats.wins;
}

int _getLosses(ChampionStats cs) {
  return cs.stats.losses;
}

double _getAdcScore(ChampionStats cs) {
  return cs.adcScore;
}

double _getMidScore(ChampionStats cs) {
  return cs.midScore;
}

double _getTopScore(ChampionStats cs) {
  return cs.topScore;
}

double _getSupportScore(ChampionStats cs) {
  return cs.supportScore;
}

double _getJungleScore(ChampionStats cs) {
  return cs.jungleScore;
}

void updateChampionDisplay(List<ChampionStats> data) {
  bool dark = true;
  var element = querySelector('#summoner-table');
  var header = element.children.elementAt(0);
  element.children.clear();

  element.children.add(header);

  for (ChampionStats c in data) {
    if (dark) {
      element.children.add(ChampionDisplayComponent.buildComponent(c, darkColor));
    } else {
      element.children.add(ChampionDisplayComponent.buildComponent(c, lightColor));
    }
    dark = !dark;
  }
}

