// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'FantasyFootball.dart';

void main() {
  FantasyFootball fantasyFootball = new FantasyFootball();
  fantasyFootball.loadData();
  querySelector('#output').text = 'Your Dart app is testing.';
}
