import 'package:flutter/material.dart';
import 'package:flutter_url_param/Repository/NameRepository.dart';
import 'package:provider/provider.dart';

import '../App/MyApp.dart';
import '../Screen/MyForm.dart';
import '../Screen/MyHomePage.dart';

class MyRootPage extends StatelessWidget {
  const MyRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    String url = appState.myurl ?? "";
    final name = appState.name;

    if (name.isEmpty) {
      return MyForm(url);
    } else {
      return MyHomePage(url, name);
    }
  }
}
