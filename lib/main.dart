import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'MyForm.dart';
import 'MyHomePage.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  //URL取得
  String myurl = Uri.base.toString();
  //クエリパラメータ取得
  String? id = Uri.base.queryParameters["id"];

  runApp(MyApp(myurl: myurl, id: id ?? ''));
}

// idが空文字なら名前入力ページを表示する
// 名前入力ページからHomeへの遷移はツイートと同じ方法を使う
// google sheet apiを使って、コメントを打ってもらう
class MyApp extends StatefulWidget {
  String? myurl, id;
  MyApp({this.myurl, this.id});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Test App",
      home: widget.id == ""
      ? MyForm(widget.myurl)
      : MyHomePage(myurl: widget.myurl, id: widget.id)
    );
  }
}

