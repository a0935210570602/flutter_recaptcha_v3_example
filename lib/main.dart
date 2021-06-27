// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:recaptcha/recapchapage.dart';

void main() {
  ScriptElement scr = ScriptElement();
  // ignore: cascade_invocations
  scr.src = 'https://www.google.com/recaptcha/api.js?render=6LdW_d8aAAAAAKVYPB15ParsKxgqQ-UCooWHaWdq';
  
  // 隱藏grecaptcha標誌
  StyleElement sty = StyleElement();
  // ignore: cascade_invocations
  sty.innerHtml = ".grecaptcha-badge {display: none !important;}";

  document.body!.children.add(scr);
  document.body!.children.add(sty);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recaptcha V3 Example',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RecaptchaPage(title: 'Flutter Recaptcha V3 Example'),
    );
  }
}
