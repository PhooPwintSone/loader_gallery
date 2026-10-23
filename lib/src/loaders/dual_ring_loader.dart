import 'dart:math';

import 'package:flutter/material.dart';

class DualRingLoader extends StatefulWidget {
  final Color color;
  final double size;
  final double strokeWidth;
  final Duration duration;

  const DualRingLoader({
    super.key,
    this.color = Colors.white,
    this.size = 50.0,
    this.strokeWidth = 5.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<DualRingLoader> createState() => _DualRingLoaderState();
}

class _DualRingLoaderState extends State<DualRingLoader>
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
    return RotationTransition(
      turns: _controller,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: _DualRingPainter(
            color: widget.color,
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _DualRingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _DualRingPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    // Each arc sweeps for roughly 125 degrees (pi * 0.7 radians)
    const sweepAngle = pi * 0.7;

    // Top arc
    canvas.drawArc(rect, -pi / 2 + 0.2, sweepAngle, false, paint);
    // Bottom arc
    canvas.drawArc(rect, pi / 2 + 0.2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant _DualRingPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
