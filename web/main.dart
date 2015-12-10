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
  LeagueOfLegendsServerRequests serverRequests = await new LeagueOfLegendsServerRequests();

  querySelector("#progressBar").style.visibility = "visible";
  Summoner s = await serverRequests.buildSummoner("icastilloa");

  bool dark = true;
  for (ChampionStats c in s.getChampionStats()) {
    var element = querySelector('#summoner1-table');
    if (dark) {
      element.children.add(ChampionDisplayComponent.buildComponent(c, darkColor));
    } else {
      element.children.add(ChampionDisplayComponent.buildComponent(c, lightColor));
    }
    dark = !dark;
  }

  querySelector("#progressBar").style.visibility = "hidden";
}

