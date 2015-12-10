// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'FantasyFootball.dart';

void main() {
  // listen for the postMessage from the main page
  FantasyFootball fantasyFootball = new FantasyFootball();
  fantasyFootball.loadData();
}

