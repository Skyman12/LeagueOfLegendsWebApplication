// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'Summoner.dart';


Future main() async {
  LeagueOfLegendsServerRequests serverRequests = new LeagueOfLegendsServerRequests();
  Summoner s = await serverRequests.buildSummoner("cotton85");
  print(s.toString());
  print(s.getChampionStats().toString());

}

