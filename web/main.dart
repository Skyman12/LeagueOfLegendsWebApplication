// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'FantasyFootball.dart';

void main() {
  // listen for the postMessage from the main page
  FantasyFootball fantasyFootball = new FantasyFootball();
  window.onMessage.listen(fantasyFootball.dataReceived);
  _createScriptTag();

  fantasyFootball.getStockQuote();
}

void _createScriptTag()
{
  String requestString = """function callbackForJsonpApi(s) {
      s.target="dartJsonHandler";
    	window.postMessage(JSON.stringify(s), '*');
    	}""";
  ScriptElement script = new ScriptElement();
  script.innerHtml = requestString;
  document.body.children.add(script);
}
