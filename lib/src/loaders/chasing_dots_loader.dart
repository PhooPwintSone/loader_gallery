import 'dart:math';

import 'package:flutter/material.dart';

class ChasingDotsLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const ChasingDotsLoader({
    super.key,
    this.color = Colors.white,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ChasingDotsLoader> createState() => _ChasingDotsLoaderState();
}

class _ChasingDotsLoaderState extends State<ChasingDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _ChasingDotsPainter(
              color: widget.color,
              progress: _controller.value,
            ),
          );
        },
      ),
    );
  }
}

class _ChasingDotsPainter extends CustomPainter {
  final Color color;
  final double progress;

  _ChasingDotsPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    const int dotCount = 8; // Number of dots in the ring
    final double maxDotRadius = size.width * 0.12; // Size of the leading dot

    for (int i = 0; i < dotCount; i++) {
      // Calculate a phase shift so the trail follows a clockwise rotation
      double factor = (i / dotCount - progress + 1.0) % 1.0;

      // Scale dot size down for the trailing tail
      double dotRadius = maxDotRadius * (0.3 + 0.7 * factor);

      // Fade opacity for the trailing tail
      double opacity = 0.1 + (0.9 * factor);

      final paint = Paint()
        ..color = color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      // Calculate angle, starting from top center (-pi / 2)
      final angle = (i * 2 * pi) / dotCount - (pi / 2);

      // Push the dots to the outer edge of the bounding box
      final double cx = radius + cos(angle) * (radius - maxDotRadius);
      final double cy = radius + sin(angle) * (radius - maxDotRadius);

      canvas.drawCircle(Offset(cx, cy), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ChasingDotsPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
