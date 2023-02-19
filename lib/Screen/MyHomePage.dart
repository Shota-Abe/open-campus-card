import 'dart:html';
import 'dart:js';
import 'dart:math';

import '../Component/ShootingStars.dart';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'MyForm.dart';

class MyHomePage extends StatelessWidget {
  final String? myurl, name;

  Future<void> _launchUrl() async {
    final String url =
        'https://twitter.com/intent/tweet?text=ここにツイートのテンプレートを書ける';
    context.callMethod('open', [url]);
  }

  MyHomePage(this.myurl, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(children: [
          ShootingStars(),
          // Positioned(
          //   top: 20,
          //   right: 20,
          //   child: const Text(
          //     "Produced by Re:monium",
          //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _changeNameButton(context),
                const Text(
                  "Produced by Re:monium",
                  style: TextStyle(
                    // fontSize: 13, 
                    fontWeight: FontWeight.bold
                    ),
                ),
                // Text(name == null ? "name is null" : "name  = " + name!,
                //     style: TextStyle(
                //         color: Colors.white, fontWeight: FontWeight.bold)),
                // SelectableText(
                //     myurl == null ? "URl is null" : "URLパラメータ = " + myurl!,
                //     style: TextStyle(
                //         color: Colors.white, fontWeight: FontWeight.bold)),
                const Text(
                  "スクショしてカードを保存",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(bottom: 0, right: 0, child: _qrImage()),
          Positioned(bottom: 16, left: 16, child: _tweetButton()),
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
                      child: Text("${name} 様",
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

  Widget _changeNameButton(BuildContext context) {
    return GestureDetector(
      child: const Text(
        "←名前を変更",
        style: TextStyle(
            // fontSize: 14,
            decoration: TextDecoration.underline,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        _changeNameButtonTapped(context);
      },
    );
  }

  Widget _qrImage() {
    return QrImage(
      data: "$myurl?name=$name",
      version: QrVersions.auto,
      size: 120.0,
      foregroundColor: Colors.white,
    );
  }

  Widget _tweetButton() {
    return Container(
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
    );
  }

  void _changeNameButtonTapped(BuildContext context) {
    // Navigator.pop(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MyForm(
              myurl,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Offset begin = Offset(-1.0, 0.0); // 左から右
            final Offset end = Offset.zero;
            final Animatable<Offset> tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: Curves.easeInOut));
            final Animation<Offset> offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }
}
