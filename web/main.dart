// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'ChampionDisplayComponent.dart';
import 'ChampionStats.dart';
import 'Summoner.dart';
import 'dart:html';


Future main() async {
  LeagueOfLegendsServerRequests serverRequests = new LeagueOfLegendsServerRequests();
  Summoner s = await serverRequests.buildSummoner("cotton85");
  print(s.toString());
  print(s.getChampionStats().toString());

  for (ChampionStats c in s.getChampionStats()) {
    var element = querySelector('#summoner1-container');
    DivElement component = new DivElement();
    var image = c.champion.image;
    var version = c.champion.version;
    component.append(new ImageElement(src: "http://ddragon.leagueoflegends.com/cdn/$version/img/champion/$image", width : 64, height : 64));
    LabelElement label = new LabelElement();
    label.text = c.toString();
    component.append(label);
    element.children.add(component);
  }
}

