// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'SummonerDisplayComponent.dart';
import 'SummonerWithChampion.dart';
import 'ChampionDisplayComponent.dart';
import 'ChampionStats.dart';
import 'Summoner.dart';
import 'dart:html';

final String darkColor = "#d3d3d3";
final String lightColor = "#F5FFFA";

Summoner summoner1;
Summoner summoner2;
Summoner summoner3;
Summoner summoner4;
Summoner summoner5;

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

  generateSummonerPositionsSimple(summoner1, summoner2, summoner3, summoner4, summoner5);

  querySelector("#progressBar").style.visibility = "hidden";
  inputElement1.value = "";
  inputElement2.value = "";
  inputElement3.value = "";
  inputElement4.value = "";
  inputElement5.value = "";
}

Future sleep5() {
  return new Future.delayed(const Duration(seconds: 5), () => "5");
}

List<TableRowElement> generateSummonerPositions(Summoner s1, Summoner s2, Summoner s3, Summoner s4, Summoner s5) {

}

void generateSummonerPositionsSimple(Summoner s1, Summoner s2, Summoner s3, Summoner s4, Summoner s5) {
  List<SummonerWithChampion> bestTop = new List();
  List<SummonerWithChampion> bestMid = new List();
  List<SummonerWithChampion> bestAdc = new List();
  List<SummonerWithChampion> bestJungle = new List();
  List<SummonerWithChampion> bestSupport = new List();

  bestTop.add(new SummonerWithChampion(s1, getBestTopScore(s1)));
  bestTop.add(new SummonerWithChampion(s2, getBestTopScore(s2)));
  bestTop.add(new SummonerWithChampion(s3, getBestTopScore(s3)));
  bestTop.add(new SummonerWithChampion(s4, getBestTopScore(s4)));
  bestTop.add(new SummonerWithChampion(s5, getBestTopScore(s5)));
  sort("Top", bestTop);

  bestMid.add(new SummonerWithChampion(s1, getBestMidScore(s1)));
  bestMid.add(new SummonerWithChampion(s2, getBestMidScore(s2)));
  bestMid.add(new SummonerWithChampion(s3, getBestMidScore(s3)));
  bestMid.add(new SummonerWithChampion(s4, getBestMidScore(s4)));
  bestMid.add(new SummonerWithChampion(s5, getBestMidScore(s5)));
  sort("Mid", bestMid);

  bestAdc.add(new SummonerWithChampion(s1, getBestAdcScore(s1)));
  bestAdc.add(new SummonerWithChampion(s2, getBestAdcScore(s2)));
  bestAdc.add(new SummonerWithChampion(s3, getBestAdcScore(s3)));
  bestAdc.add(new SummonerWithChampion(s4, getBestAdcScore(s4)));
  bestAdc.add(new SummonerWithChampion(s5, getBestAdcScore(s5)));
  sort("Adc", bestAdc);

  bestJungle.add(new SummonerWithChampion(s1, getBestJungleScore(s1)));
  bestJungle.add(new SummonerWithChampion(s2, getBestJungleScore(s2)));
  bestJungle.add(new SummonerWithChampion(s3, getBestJungleScore(s3)));
  bestJungle.add(new SummonerWithChampion(s4, getBestJungleScore(s4)));
  bestJungle.add(new SummonerWithChampion(s5, getBestJungleScore(s5)));
  sort("Jungle", bestJungle);

  bestSupport.add(new SummonerWithChampion(s1, getBestSupportScore(s1)));
  bestSupport.add(new SummonerWithChampion(s2, getBestSupportScore(s2)));
  bestSupport.add(new SummonerWithChampion(s3, getBestSupportScore(s3)));
  bestSupport.add(new SummonerWithChampion(s4, getBestSupportScore(s4)));
  bestSupport.add(new SummonerWithChampion(s5, getBestSupportScore(s5)));
  sort("Support", bestSupport);

  SummonerWithChampion top = bestTop.elementAt(0);

  TableRowElement topRow = SummonerDisplayComponent.buildPlayerRoleComponent(top.summoner, "Top");
  TableRowElement topSummonerRow = ChampionDisplayComponent.buildComponent(top.stats, "#FFFFFF");

  SummonerWithChampion mid = bestMid.elementAt(0);

  TableRowElement midRow = SummonerDisplayComponent.buildPlayerRoleComponent(mid.summoner, "Mid");
  TableRowElement midSummonerRow = ChampionDisplayComponent.buildComponent(mid.stats, "#FFFFFF");

  SummonerWithChampion adc = bestAdc.elementAt(0);

  TableRowElement adcRow = SummonerDisplayComponent.buildPlayerRoleComponent(adc.summoner, "Adc");
  TableRowElement adcSummonerRow = ChampionDisplayComponent.buildComponent(adc.stats, "#FFFFFF");

  SummonerWithChampion jungle = bestJungle.elementAt(0);

  TableRowElement jungleRow = SummonerDisplayComponent.buildPlayerRoleComponent(jungle.summoner, "Jungle");
  TableRowElement jungleSummonerRow = ChampionDisplayComponent.buildComponent(jungle.stats, "#FFFFFF");

  SummonerWithChampion support = bestSupport.elementAt(0);

  TableRowElement supportRow = SummonerDisplayComponent.buildPlayerRoleComponent(support.summoner, "Support");
  TableRowElement supportSummonerRow = ChampionDisplayComponent.buildComponent(support.stats, "#FFFFFF");

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

ChampionStats getBestTopScore(Summoner s) {
  double score = -100.0;
  ChampionStats highest = s.getChampionStats()[0];
  for (ChampionStats c in s.getChampionStats()) {
    if (c.champion.roles.contains("Top")) {
      if (c.topScore > score) {
        highest = c;
        score = c.topScore;
      }
    }
  }

  return highest;
}

ChampionStats getBestMidScore(Summoner s) {
  double score = -100.0;
  ChampionStats highest = s.getChampionStats()[0];
  for (ChampionStats c in s.getChampionStats()) {
    if (c.champion.roles.contains("Mid")) {
      if (c.midScore > score) {
        highest = c;
        score = c.midScore;
      }
    }
  }

  return highest;
}

ChampionStats getBestJungleScore(Summoner s) {
  double score = -100.0;
  ChampionStats highest = s.getChampionStats()[0];
  for (ChampionStats c in s.getChampionStats()) {
    if (c.champion.roles.contains("Jungle")) {
      if (c.jungleScore > score) {
        highest = c;
        score = c.jungleScore;
      }
    }
  }

  return highest;
}

ChampionStats getBestSupportScore(Summoner s) {
  double score = -100.0;
  ChampionStats highest = s.getChampionStats()[0];
  for (ChampionStats c in s.getChampionStats()) {
    if (c.champion.roles.contains("Support")) {
      if (c.supportScore > score) {
        highest = c;
        score = c.supportScore;
      }
    }
  }

  return highest;
}

void sort(String sortType, List toSort) {
  switch (sortType) {
    case "Adc" :
      toSort.sort((a, b) => _getAdcScore(b).compareTo(_getAdcScore(a)));
      break;
    case "Mid" :
      toSort.sort((a, b) => _getMidScore(b).compareTo(_getMidScore(a)));
      break;
    case "Top" :
      toSort.sort((a, b) => _getTopScore(b).compareTo(_getTopScore(a)));
      break;
    case "Support" :
      toSort.sort((a, b) => _getSupportScore(b).compareTo(_getSupportScore(a)));
      break;
    case "Jungle" :
      toSort.sort((a, b) => _getJungleScore(b).compareTo(_getJungleScore(a)));
      break;
  }
}

double _getAdcScore(SummonerWithChampion cs) {
  return cs.stats.adcScore;
}

double _getMidScore(SummonerWithChampion cs) {
  return cs.stats.midScore;
}

double _getTopScore(SummonerWithChampion cs) {
  return cs.stats.topScore;
}

double _getSupportScore(SummonerWithChampion cs) {
  return cs.stats.supportScore;
}

double _getJungleScore(SummonerWithChampion cs) {
  return cs.stats.jungleScore;
}



