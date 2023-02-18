import 'dart:js';
import 'dart:math';
import 'ShootingStars.dart';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyHomePage extends StatelessWidget {
  final String? myurl, id;

  Future<void> _launchUrl() async {
    final String url =
        'https://twitter.com/intent/tweet?text=ここにツイートのテンプレートを書ける';
    context.callMethod('open', [url]);
  }

  const MyHomePage({
    Key? key,
    this.myurl,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(children: [
            ShootingStars(),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(id == null ? "id is null" : "id  = " + id!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SelectableText(
                      myurl == null
                          ? "URl is null"
                          : "URLパラメータ = " + myurl!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(
                    "Produced by Re:monium",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "スクショしてカードを保存",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: QrImage(
                data: myurl ?? "",
                version: QrVersions.auto,
                size: 120.0,
                foregroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _launchUrl();
                      },
                      child: Image.network(
                        'https://abs.twimg.com/icons/apple-touch-icon-192x192.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("2023年4月オープンキャンパス\n参加記念カード",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Transform.translate(
                        offset: Offset(-2.0, 0.0),
                        child: Text("${id} 様",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
              ),
            )
          ]),
        ),
      );
  }
}