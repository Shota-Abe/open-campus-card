import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_url_param/Repository/NameRepository.dart';
import 'package:provider/provider.dart';

import '../Root/MyRootPage.dart';

// http://192.168.11.5:50505/?id=精華太郎
// idが空文字なら名前入力ページを表示する
// 名前入力ページからHomeへの遷移はツイートと同じ方法を使う
// google sheet apiを使って、コメントを打ってもらう
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: "オープンキャンパス記念カード",
        home: const MyRootPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String? myurl = Uri.base.toString();
  String name = Uri.base.queryParameters["name"] ?? NameRepository.getName();

  void setId(String newId) {
    name = newId;
    notifyListeners();
  }
}
