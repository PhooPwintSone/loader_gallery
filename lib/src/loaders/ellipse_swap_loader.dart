import 'dart:math';

import 'package:flutter/material.dart';

class EllipseSwapLoader extends StatefulWidget {
  final Color color;
  final double size; // The total width of the swap area
  final double dotSize;
  final Duration duration;

  const EllipseSwapLoader({
    super.key,
    this.color = Colors.white,
    this.size = 50.0,
    this.dotSize = 12.0,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<EllipseSwapLoader> createState() => _EllipseSwapLoaderState();
}

class _EllipseSwapLoaderState extends State<EllipseSwapLoader>
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

  // Returns a Map containing the widget and its current depth (Z-value)
  Map<String, dynamic> _buildDotData(double phaseOffset) {
    double angle = (_controller.value * 2 * pi) + phaseOffset;

    // Calculate coordinates for a flattened ellipse
    double x = cos(angle) * (widget.size / 2);
    double y =
        sin(angle) * (widget.size / 6); // Compress Y axis for perspective

    // Use the sine value to simulate depth (scale up when in front, down when in back)
    double depth = sin(angle);
    double scale = 0.75 + (0.25 * depth);

    Widget dot = Transform.translate(
      offset: Offset(x, y),
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: widget.dotSize,
          height: widget.dotSize,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );

    return {'widget': dot, 'depth': depth};
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size + widget.dotSize,
      height: widget.size + widget.dotSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Generate data for both dots, offset by 180 degrees (pi)
          final dot1 = _buildDotData(0.0);
          final dot2 = _buildDotData(pi);

          // Determine which dot is in front based on depth, so it renders on top
          Widget frontDot = dot1['depth'] > dot2['depth']
              ? dot1['widget']
              : dot2['widget'];
          Widget backDot = dot1['depth'] > dot2['depth']
              ? dot2['widget']
              : dot1['widget'];

          return Stack(
            alignment: Alignment.center,
            children: [backDot, frontDot],
          );
        },
      ),
    );
  }
}
