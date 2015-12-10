// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'ChampionDisplayComponent.dart';
import 'ChampionStats.dart';
import 'Summoner.dart';
import 'dart:html';

final String darkColor = "#d3d3d3";
final String lightColor = "#F5FFFA";

Future main() async {
  var summonerData = querySelector("#submitSummonerData");
  summonerData.onClick.listen(getSummonerData);
}

Future getSummonerData(Event e) async {
  LeagueOfLegendsServerRequests serverRequests = await new LeagueOfLegendsServerRequests();
  InputElement inputElement = querySelector("#summonerName");
  Summoner summoner = await serverRequests.buildSummoner("skyman12");
  bool dark = true;
  var element = querySelector('#summoner-table');
  element.children.clear();

  for (ChampionStats c in summoner.getChampionStats()) {
    if (dark) {
      element.children.add(ChampionDisplayComponent.buildComponent(c, darkColor));
    } else {
      element.children.add(ChampionDisplayComponent.buildComponent(c, lightColor));
    }
    dark = !dark;
  }

  return;
}

