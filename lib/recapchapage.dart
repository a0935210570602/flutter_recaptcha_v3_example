@JS()
library recaptchaV3.js;
//https://pub.dev/packages/js/install

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

//指定recaptchaV3.js的check function為動態
@JS()
external dynamic check();

class RecaptchaPage extends StatefulWidget {
  RecaptchaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RecaptchaPageState createState() => _RecaptchaPageState();
}

class _RecaptchaPageState extends State<RecaptchaPage> {

  String result = 'Send recapcha request';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            // ignore: unnecessary_lambdas
            jscheck().then((value) {
              // 確認分數為0.8以上則做動作
              if(value>0.8){
                result = 'Hey man';
              }else{
                //若為分數低於0.8則判定為機器人
                result = 'Hey robort';
              }
              setState(() {});
            });
          },
          child: Text(result),
        )
      ),
    );
  }
}

//非同步
Future jscheck() async {
  // 等待js function完成
  var result = await promiseToFuture(check());
  
  return result;
} 