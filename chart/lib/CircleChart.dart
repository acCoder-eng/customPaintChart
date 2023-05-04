import 'dart:math';

import 'package:flutter/material.dart';

class CircleChart extends StatelessWidget {
  final double speed;
  final double density;

  const CircleChart({required this.speed, required this.density, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: CircleChartPainter(speed: speed, density: density),
    );
  }
}

class CircleChartPainter extends CustomPainter {
  final double speed;
  final double density;

  CircleChartPainter({required this.speed, required this.density});

  @override
  void paint(Canvas canvas, Size size) {
    // Çemberin rengini belirleyin
    final paint = Paint()..color = Colors.blue;

    // Yüzde cinsinden hız ve yoğunluğu hesaplayın
    final speedPercentage = min(1, speed / 200);
    final densityPercentage = min(1, density / 50);

    // Çemberin yarıçapını hesaplayın
    final radius = min(size.width, size.height) / 2;

    // Çemberin merkezini hesaplayın
    final center = Offset(size.width / 2, size.height / 2);

    // Çemberi çizin
    canvas.drawCircle(center, radius, paint);

    // Hızı gösteren kısmı çizin
    final speedAngle = speedPercentage * 2 * pi - pi / 2;
    final speedPaint = Paint()..color = Colors.red;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        speedAngle,
        true,
        speedPaint);

    // Yoğunluğu gösteren kısmı çizin
    final densityAngle = densityPercentage * 2 * pi - pi / 2;
    final densityPaint = Paint()..color = Colors.green;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        densityAngle,
        true,
        densityPaint);
  }

  @override
  bool shouldRepaint(CircleChartPainter oldDelegate) {
    return oldDelegate.speed != speed || oldDelegate.density != density;
  }
}
