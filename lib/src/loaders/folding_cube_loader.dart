import 'dart:math';

import 'package:flutter/material.dart';

class FoldingCubeLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const FoldingCubeLoader({
    super.key,
    this.color = Colors.white,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 2400),
  });

  @override
  State<FoldingCubeLoader> createState() => _FoldingCubeLoaderState();
}

class _FoldingCubeLoaderState extends State<FoldingCubeLoader>
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

  Widget _buildCube(
    int index,
    Alignment alignment,
    Offset offset,
    bool isXAxis,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Stagger the start time for each of the 4 cubes (25% of the total time each)
        double start = index * 0.25;
        double end = start + 0.25;

        // Calculate the local progress for this specific cube
        double progress = 0.0;
        if (_controller.value >= start && _controller.value <= end) {
          progress = (_controller.value - start) / 0.25;
        } else if (_controller.value > end) {
          progress = 1.0;
        }

        // Add a delay before it resets for the next loop
        if (_controller.value > 0.9) {
          progress = 0.0; // Reset quickly at the end
        }

        // Apply an ease-in-out curve
        double curvedProgress = Curves.easeInOut.transform(progress);

        // Flip from 0 to 180 degrees (pi radians)
        double angle = curvedProgress * pi;

        // Apply slight opacity fading to enhance the 3D effect
        double opacity = 1.0 - (curvedProgress * 0.5);

        return Positioned(
          top: offset.dy,
          left: offset.dx,
          child: Transform(
            alignment: alignment,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003) // Perspective
              ..rotateX(isXAxis ? angle : 0.0)
              ..rotateY(isXAxis ? 0.0 : angle),
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: widget.size / 2,
                height: widget.size / 2,
                color: widget.color,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double halfSize = widget.size / 2;

    return Transform.rotate(
      angle: -pi / 4, // Rotate the entire group to form a diamond shape
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            // Top Left -> Folds on X axis (bottom edge anchor)
            _buildCube(0, Alignment.bottomRight, const Offset(0, 0), true),
            // Top Right -> Folds on Y axis (left edge anchor)
            _buildCube(1, Alignment.bottomLeft, Offset(halfSize, 0), false),
            // Bottom Right -> Folds on X axis (top edge anchor)
            _buildCube(2, Alignment.topLeft, Offset(halfSize, halfSize), true),
            // Bottom Left -> Folds on Y axis (right edge anchor)
            _buildCube(3, Alignment.topRight, Offset(0, halfSize), false),
          ],
        ),
      ),
    );
  }
}
