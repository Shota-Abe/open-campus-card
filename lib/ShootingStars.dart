import 'dart:math';

import 'package:flutter/material.dart';
class ShootingStars extends StatefulWidget {
  @override
  _ShootingStarsState createState() => _ShootingStarsState();
}

class _ShootingStarsState extends State<ShootingStars>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Star> stars = List.generate(50, (_) => Star());

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addListener(() {
            setState(() {
              for (final star in stars) {
                star.updatePosition();
              }
            });
          })
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomPaint(
          painter: ShootingStarsPainter(stars),
          child: Container(),
        ),
      ),
    );
  }
}

class ShootingStarsPainter extends CustomPainter {
  final List<Star> stars;

  ShootingStarsPainter(this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      // ..color = Colors.primaries[Random().nextInt(Colors.primaries.length)]
      ..strokeWidth = 2;

    for (final star in stars) {
      final length = 80;
      final startPos = Offset(star.x + length, star.y);
      final endPos = Offset(star.x, star.y + length);
      canvas.drawLine(startPos, endPos, paint);
    }
  }

  @override
  bool shouldRepaint(ShootingStarsPainter oldDelegate) {
    return true;
  }
}

class Star {
  double x = Random().nextDouble() * 500;
  double y = Random().nextDouble() * 500;
  double speed = 5 + (2 * (0.5 - Random().nextDouble()));
  double opacity = 0;

  void updatePosition() {
    x -= speed; // x座標の増加量をマイナスに
    y += speed; // y座標の増加量をプラスに
    if (x < 0 || y > 1000) {
      // 画面外に出た場合はランダムな位置に戻る
      x = Random().nextDouble() * 500;
      y = Random().nextDouble() * 500;
      speed = 5 + (2 * (0.5 - Random().nextDouble()));
    }
  }
}
