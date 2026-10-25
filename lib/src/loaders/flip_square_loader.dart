import 'dart:math';

import 'package:flutter/material.dart';

class FlipSquareLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const FlipSquareLoader({
    super.key,
    this.color = Colors.white,
    this.size = 40.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<FlipSquareLoader> createState() => _FlipSquareLoaderState();
}

class _FlipSquareLoaderState extends State<FlipSquareLoader>
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = _controller.value;
        double rotateX = 0.0;
        double rotateY = 0.0;

        if (value <= 0.5) {
          // First half: flip 180 degrees (pi radians) on the X axis
          rotateX = (value * 2) * pi;
        } else {
          // Second half: keep X flipped, flip 180 degrees on the Y axis
          rotateX = pi;
          rotateY = ((value - 0.5) * 2) * pi;
        }

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002) // Adds a subtle 3D perspective depth
            ..rotateX(rotateX)
            ..rotateY(rotateY),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              // Slight border radius as seen in the source image
              borderRadius: BorderRadius.circular(widget.size * 0.15),
            ),
          ),
        );
      },
    );
  }
}
