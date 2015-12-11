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
  
  print("here 1");
  await serverRequests.buildSummoner(inputElement2.value).then(_assignSummoner2);
  print("here 2");
  await serverRequests.buildSummoner(inputElement3.value).then(_assignSummoner3);
  print("here 3");
  await serverRequests.buildSummoner(inputElement4.value).then(_assignSummoner4);
  print("here 4");
  await serverRequests.buildSummoner(inputElement5.value).then(_assignSummoner5);
  print("here 5");

  TableRowElement summoner1Row = SummonerDisplayComponent.buildPlayerRoleComponent(summoner1);
  TableRowElement summoner2Row = SummonerDisplayComponent.buildPlayerRoleComponent(summoner2);
  TableRowElement summoner3Row = SummonerDisplayComponent.buildPlayerRoleComponent(summoner3);
  TableRowElement summoner4Row = SummonerDisplayComponent.buildPlayerRoleComponent(summoner4);
  TableRowElement summoner5Row = SummonerDisplayComponent.buildPlayerRoleComponent(summoner5);

  var element = querySelector('#summoner-table');
  var header = element.children.elementAt(0);
  element.children.clear();

  element.children.add(header);

  element.children.add(summoner1Row);
  element.children.add(summoner2Row);
  element.children.add(summoner3Row);
  element.children.add(summoner4Row);
  element.children.add(summoner5Row);

  querySelector("#progressBar").style.visibility = "hidden";
  inputElement1.value = "";
  inputElement2.value = "";
  inputElement3.value = "";
  inputElement4.value = "";
  inputElement5.value = "";
}

void _assignSummoner1(Summoner s) {
  summoner1 = s;
}

void _assignSummoner2(Summoner s) {
  print("inside 2");
  summoner2 = s;
  print("past 2");
}

void _assignSummoner3(Summoner s) {
  print("inside 3");
  summoner3 = s;
  print("past 3");
}

void _assignSummoner4(Summoner s) {
  print("inside 4");
  summoner4 = s;
  print("past 4");
}

void _assignSummoner5(Summoner s) {
  summoner5 = s;
}


