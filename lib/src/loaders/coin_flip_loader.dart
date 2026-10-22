import 'dart:math';

import 'package:flutter/material.dart';

class CoinFlipLoader extends StatefulWidget {
  final Color color;
  final Color edgeColor;
  final double size;
  final Duration duration;

  const CoinFlipLoader({
    super.key,
    this.color = Colors.white,
    this.edgeColor = Colors.amber,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<CoinFlipLoader> createState() => _CoinFlipLoaderState();
}

class _CoinFlipLoaderState extends State<CoinFlipLoader>
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
          final double rotation = _controller.value * 2 * pi;

          return CustomPaint(
            painter: _CoinFlipPainter(
              color: widget.color,
              edgeColor: widget.edgeColor,
              rotation: rotation,
            ),
          );
        },
      ),
    );
  }
}

class _CoinFlipPainter extends CustomPainter {
  final Color color;
  final Color edgeColor;
  final double rotation;

  _CoinFlipPainter({
    required this.color,
    required this.edgeColor,
    required this.rotation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    // final double radius = size.width / 2;

    // How much of the coin face is visible.
    final double faceScale = cos(rotation).abs();

    // How visible the coin's thickness is.
    final double edgeVisibility = sin(rotation).abs();

    // Coin thickness.
    final double thickness = size.width * 0.14;

    // ------------------------------------------------------------
    // 1. Draw the 3D edge
    // ------------------------------------------------------------

    if (edgeVisibility > 0.01) {
      final double edgeWidth = thickness * edgeVisibility;

      final Paint edgePaint = Paint()
        ..shader =
            LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                edgeColor.withValues(alpha: 0.65),
                edgeColor,
                edgeColor.withValues(alpha: 0.55),
              ],
            ).createShader(
              Rect.fromCenter(
                center: center,
                width: edgeWidth,
                height: size.height * 0.9,
              ),
            );

      final RRect edge = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: edgeWidth,
          height: size.height * 0.9,
        ),
        Radius.circular(edgeWidth / 2),
      );

      canvas.drawRRect(edge, edgePaint);
    }

    // ------------------------------------------------------------
    // 2. Draw the coin face
    // ------------------------------------------------------------

    final double faceWidth = size.width * faceScale;

    if (faceWidth > 0.5) {
      final Rect faceRect = Rect.fromCenter(
        center: center,
        width: faceWidth,
        height: size.height,
      );

      final Paint facePaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.75),
            color,
            color.withValues(alpha: 0.85),
          ],
        ).createShader(faceRect);

      canvas.drawOval(faceRect, facePaint);

      // Subtle highlight around the coin face.
      final Paint highlightPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.025
        ..color = color.withValues(alpha: 0.45);

      canvas.drawOval(faceRect.deflate(size.width * 0.025), highlightPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CoinFlipPainter oldDelegate) {
    return oldDelegate.rotation != rotation ||
        oldDelegate.color != color ||
        oldDelegate.edgeColor != edgeColor;
  }
}
