import 'package:flutter/material.dart';
import 'dart:math' as math;

class GaugeWidget extends StatelessWidget {
  final double value;
  final String unit; // The unit text (e.g., kWh/Sqft)
  final double percentage; // 0.0 to 1.0 for the progress

  const GaugeWidget({
    super.key,
    required this.value,
    required this.unit,
    this.percentage = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: const Size(200, 140),
          painter: _GaugePainter(percentage: percentage),
          child: SizedBox(
            width: 200,
            height: 100,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  value.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF0D1231), // Dark Navy
                  ),
                ),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0D1231), // Dark Navy
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double percentage;

  _GaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 18.0;
    final Rect rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height * 2 - strokeWidth,
    );

    // Config for the semi-circle (starts from left, goes to right)
    const double startAngle = math.pi * 0.85;
    const double sweepAngle = math.pi * 1.3;

    // 1. Draw Background Arc (Light Blue)
    final Paint backgroundPaint =
        Paint()
          ..color = const Color(0xFFEBF3FF) // Very light blue
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);

    // 2. Draw Progress Arc (Vibrant Blue)
    final Paint progressPaint =
        Paint()
          ..color = const Color(0xFF6391F5) // Medium blue from image
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle * percentage,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
