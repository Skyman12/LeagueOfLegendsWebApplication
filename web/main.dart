// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';
import 'LeagueOfLegendsServerRequests.dart';
import 'Summoner.dart';


Future main() async {
  // listen for the postMessage from the main page
  LeagueOfLegendsServerRequests lolServerRequests = new LeagueOfLegendsServerRequests();
  Summoner s = await LeagueOfLegendsServerRequests.buildSummoner("skyman12");
  print(s.toString());
}

