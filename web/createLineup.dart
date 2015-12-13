// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'SummonerDisplayComponent.dart';
import 'SummonerWithChampion.dart';
import 'ChampionDisplayComponent.dart';
import 'ChampionStats.dart';
import 'Summoner.dart';
import 'Lineup.dart';
import 'dart:html';

final String darkColor = "#d3d3d3";
final String lightColor = "#F5FFFA";

Summoner summoner1;
Summoner summoner2;
Summoner summoner3;
Summoner summoner4;
Summoner summoner5;

SummonerWithChampion topSelection;
SummonerWithChampion midSelection;
SummonerWithChampion jungleSelection;
SummonerWithChampion adcSelection;
SummonerWithChampion supportSelection;

void main() {
  var summonerData = querySelector("#submitSummonerData");
  summonerData.onClick.listen(getSummonerData);
}

Future getSummonerData(Event e) async {
  LeagueOfLegendsServerRequests serverRequests = await new LeagueOfLegendsServerRequests();

  InputElement inputElement1 = querySelector("#summonerName1");
  InputElement inputElement2 = querySelector("#summonerName2");
  InputElement inputElement3 = querySelector("#summonerName3");
  InputElement inputElement4 = querySelector("#summonerName4");
  InputElement inputElement5 = querySelector("#summonerName5");

  InputElement champion1Element = querySelector("#championName1");
  InputElement champion2Element = querySelector("#championName2");
  InputElement champion3Element = querySelector("#championName3");
  InputElement champion4Element = querySelector("#championName4");
  InputElement champion5Element = querySelector("#championName5");

  SelectElement role1Element = querySelector("#role1");
  SelectElement role2Element = querySelector("#role2");
  SelectElement role3Element = querySelector("#role3");
  SelectElement role4Element = querySelector("#role4");
  SelectElement role5Element = querySelector("#role5");

  querySelector("#progressBar").style.visibility = "visible";

  summoner1 = await serverRequests.buildSummoner(inputElement1.value);
  await sleep5();
  summoner2 = await serverRequests.buildSummoner(inputElement2.value);
  await sleep5();
  summoner3 = await serverRequests.buildSummoner(inputElement3.value);
  await sleep5();
  summoner4 = await serverRequests.buildSummoner(inputElement4.value);
  await sleep5();
  summoner5 = await serverRequests.buildSummoner(inputElement5.value);

  getPresetSelections(summoner1, champion1Element, role1Element);
  getPresetSelections(summoner2, champion2Element, role2Element);
  getPresetSelections(summoner3, champion3Element, role3Element);
  getPresetSelections(summoner4, champion4Element, role4Element);
  getPresetSelections(summoner5, champion5Element, role5Element);

  generateSummonerPositions(summoner1, summoner2, summoner3, summoner4, summoner5);

  querySelector("#progressBar").style.visibility = "hidden";
  inputElement1.value = "";
  inputElement2.value = "";
  inputElement3.value = "";
  inputElement4.value = "";
  inputElement5.value = "";
}

void getPresetSelections(Summoner s, InputElement nameElement, SelectElement roleElement) {
  if (nameElement.value.trim() != "") {
    ChampionStats champion = s.getSpecificChampionStats(nameElement.value);
    switch (roleElement.value) {
      case "Top":
        topSelection = new SummonerWithChampion(s, champion);
        break;
      case "Mid":
        midSelection = new SummonerWithChampion(s, champion);
        break;
      case "Jungle":
        jungleSelection = new SummonerWithChampion(s, champion);
        break;
      case "Adc":
        adcSelection = new SummonerWithChampion(s, champion);
        break;
      case "Support":
        supportSelection = new SummonerWithChampion(s, champion);
        break;
    }
  }
}

Future sleep5() {
  return new Future.delayed(const Duration(seconds: 5), () => "5");
}

void generateSummonerPositions(Summoner s1, Summoner s2, Summoner s3, Summoner s4, Summoner s5) {

  List<SummonerWithChampion> bestTop = new List();
  List<SummonerWithChampion> bestMid = new List();
  List<SummonerWithChampion> bestAdc = new List();
  List<SummonerWithChampion> bestJungle = new List();
  List<SummonerWithChampion> bestSupport = new List();

  addToList(5, s1.getChampionStats(), bestTop, "Top", s1);
  addToList(5, s1.getChampionStats(), bestMid, "Mid", s1);
  addToList(5, s1.getChampionStats(), bestJungle, "Jungle", s1);
  addToList(5, s1.getChampionStats(), bestSupport, "Support", s1);
  addToList(5, s1.getChampionStats(), bestAdc, "Adc", s1);

  addToList(5, s2.getChampionStats(), bestTop, "Top", s2);
  addToList(5, s2.getChampionStats(), bestMid, "Mid", s2);
  addToList(5, s2.getChampionStats(), bestJungle, "Jungle", s2);
  addToList(5, s2.getChampionStats(), bestSupport, "Support", s2);
  addToList(5, s2.getChampionStats(), bestAdc, "Adc", s2);

  addToList(5, s3.getChampionStats(), bestTop, "Top", s3);
  addToList(5, s3.getChampionStats(), bestMid, "Mid", s3);
  addToList(5, s3.getChampionStats(), bestJungle, "Jungle", s3);
  addToList(5, s3.getChampionStats(), bestSupport, "Support", s3);
  addToList(5, s3.getChampionStats(), bestAdc, "Adc", s3);

  addToList(5, s4.getChampionStats(), bestTop, "Top", s4);
  addToList(5, s4.getChampionStats(), bestMid, "Mid", s4);
  addToList(5, s4.getChampionStats(), bestJungle, "Jungle", s4);
  addToList(5, s4.getChampionStats(), bestSupport, "Support", s4);
  addToList(5, s4.getChampionStats(), bestAdc, "Adc", s4);

  addToList(5, s5.getChampionStats(), bestTop, "Top", s5);
  addToList(5, s5.getChampionStats(), bestMid, "Mid", s5);
  addToList(5, s5.getChampionStats(), bestJungle, "Jungle", s5);
  addToList(5, s5.getChampionStats(), bestSupport, "Support", s5);
  addToList(5, s5.getChampionStats(), bestAdc, "Adc", s5);

  if (topSelection != null) {
    bestTop.clear();
    bestTop.add(topSelection);
  }

  if (midSelection != null) {
    bestMid.clear();
    bestMid.add(midSelection);
  }

  if (jungleSelection != null) {
    bestJungle.clear();
    bestJungle.add(jungleSelection);
  }

  if (adcSelection != null) {
    bestAdc.clear();
    bestAdc.add(adcSelection);
  }

  if (supportSelection != null) {
    bestSupport.clear();
    bestSupport.add(supportSelection);
  }

  Lineup bestLineup = generateBestLineup(bestTop, bestMid, bestJungle, bestAdc, bestSupport);

  displayLineup(bestLineup);
}

Lineup generateBestLineup(List<SummonerWithChampion> top, List<SummonerWithChampion> mid, List<SummonerWithChampion> jungle, List<SummonerWithChampion> adc, List<SummonerWithChampion> support) {
  Lineup lineup;
  double score = 0.0;
    for (SummonerWithChampion t in top) {
      for (SummonerWithChampion m in mid) {
        for (SummonerWithChampion j in jungle) {
          for (SummonerWithChampion a in adc) {
            for (SummonerWithChampion s in support) {
                if (checkForUniqueSummoner(t.summoner,m.summoner,j.summoner,a.summoner,s.summoner) && checkForUniqueChampions(t.stats,m.stats,j.stats,a.stats,s.stats)) {
                  Lineup temp = new Lineup(t,m,j,a,s);
                  if (temp.getScore() > score && temp.hasMage() && temp.hasTank()) {
                    lineup = new Lineup(t, m, j, a, s);
                    score = lineup.getScore();
                  }
                }
            }
          }
        }
      }
    }

  return lineup;
}

void addToList(int number, List<ChampionStats> listToSort, List<SummonerWithChampion> listToAddTo, String type, Summoner s) {
  List<ChampionStats> temp = listToSort;
  sortByChampionStats(type, temp);
  for (int i = 0; i < number; i++) {
    if (temp.elementAt(i).champion.roles.contains(type)) {
      listToAddTo.add(new SummonerWithChampion(s, temp.elementAt(i)));
    }
  }
}

bool checkForUniqueSummoner(Summoner t, Summoner m, Summoner j, Summoner a, Summoner s) {
  Map<String, String> names = new Map();

  if(names.containsKey(t.getName())) return false;
  names[t.getName()] = "";

  if(names.containsKey(m.getName())) return false;
  names[m.getName()] = "";

  if(names.containsKey(j.getName())) return false;
  names[j.getName()] = "";

  if(names.containsKey(a.getName())) return false;
  names[a.getName()] = "";

  if(names.containsKey(s.getName())) return false;
  names[s.getName()] = "";

  return true;
}

void displayLineup(Lineup lineup) {
  TableRowElement topRow = SummonerDisplayComponent.buildPlayerRoleComponent(lineup.top.summoner, "Top");
  TableRowElement topSummonerRow = ChampionDisplayComponent.buildComponent(lineup.top.stats, "#FFFFFF");

  TableRowElement midRow = SummonerDisplayComponent.buildPlayerRoleComponent(lineup.mid.summoner, "Mid");
  TableRowElement midSummonerRow = ChampionDisplayComponent.buildComponent(lineup.mid.stats, "#FFFFFF");

  TableRowElement adcRow = SummonerDisplayComponent.buildPlayerRoleComponent(lineup.adc.summoner, "Adc");
  TableRowElement adcSummonerRow = ChampionDisplayComponent.buildComponent(lineup.adc.stats, "#FFFFFF");

  TableRowElement jungleRow = SummonerDisplayComponent.buildPlayerRoleComponent(lineup.jungle.summoner, "Jungle");
  TableRowElement jungleSummonerRow = ChampionDisplayComponent.buildComponent(lineup.jungle.stats, "#FFFFFF");

  TableRowElement supportRow = SummonerDisplayComponent.buildPlayerRoleComponent(lineup.support.summoner, "Support");
  TableRowElement supportSummonerRow = ChampionDisplayComponent.buildComponent(lineup.support.stats, "#FFFFFF");

  var element = querySelector('#summoner-table');
  var header = element.children.elementAt(0);
  element.children.clear();

  element.children.add(header);

  element.children.add(topRow);
  element.children.add(topSummonerRow);
  element.children.add(midRow);
  element.children.add(midSummonerRow);
  element.children.add(adcRow);
  element.children.add(adcSummonerRow);
  element.children.add(jungleRow);
  element.children.add(jungleSummonerRow);
  element.children.add(supportRow);
  element.children.add(supportSummonerRow);
}

bool checkForUniqueChampions(ChampionStats t, ChampionStats m, ChampionStats j, ChampionStats a, ChampionStats s) {
  Map<String, String> names = new Map();

  if(names.containsKey(t.champion.name)) return false;
  names[t.champion.name] = "";

  if(names.containsKey(m.champion.name)) return false;
  names[m.champion.name] = "";

  if(names.containsKey(j.champion.name)) return false;
  names[j.champion.name] = "";

  if(names.containsKey(a.champion.name)) return false;
  names[a.champion.name] = "";

  if(names.containsKey(s.champion.name)) return false;
  names[s.champion.name] = "";

  return true;
}

ChampionStats getBestAdcScore(Summoner s) {
  double score = -100.0;
  ChampionStats highest = s.getChampionStats()[0];
  for (ChampionStats c in s.getChampionStats()) {
      if (c.champion.roles.contains("Adc")) {
        if (c.adcScore > score) {
          highest = c;
          score = c.adcScore;
        }
      }
  }

  return highest;
}

void sortByChampionStats(String sortType, List<ChampionStats> toSort) {
  switch (sortType) {
    case "Adc" :
      toSort.sort((a, b) => _getAdcScoreChampionStats(b).compareTo(_getAdcScoreChampionStats(a)));
      break;
    case "Mid" :
      toSort.sort((a, b) => _getMidScoreChampionStats(b).compareTo(_getMidScoreChampionStats(a)));
      break;
    case "Top" :
      toSort.sort((a, b) => _getTopScoreChampionStats(b).compareTo(_getTopScoreChampionStats(a)));
      break;
    case "Support" :
      toSort.sort((a, b) => _getSupportScoreChampionStats(b).compareTo(_getSupportScoreChampionStats(a)));
      break;
    case "Jungle" :
      toSort.sort((a, b) => _getJungleScoreChampionStats(b).compareTo(_getJungleScoreChampionStats(a)));
      break;
  }
}

double _getAdcScoreChampionStats(ChampionStats cs) {
  return cs.adcScore;
}

double _getMidScoreChampionStats(ChampionStats cs) {
  return cs.midScore;
}

double _getTopScoreChampionStats(ChampionStats cs) {
  return cs.topScore;
}

double _getSupportScoreChampionStats(ChampionStats cs) {
  return cs.supportScore;
}

double _getJungleScoreChampionStats(ChampionStats cs) {
  return cs.jungleScore;
}



