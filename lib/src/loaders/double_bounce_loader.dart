import 'package:flutter/material.dart';

class DoubleBounceLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const DoubleBounceLoader({
    super.key,
    this.color = Colors.white,
    this.size = 60.0,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<DoubleBounceLoader> createState() => _DoubleBounceLoaderState();
}

class _DoubleBounceLoaderState extends State<DoubleBounceLoader>
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

  Widget _buildBounceCircle(bool isDelayed) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Shift the second circle's animation by 50% of the duration
        double progress = _controller.value;
        if (isDelayed) {
          progress = (progress + 0.5) % 1.0;
        }

        // Convert the 0.0->1.0 loop into a 0.0->1.0->0.0 bounce
        double bounceProgress = progress < 0.5
            ? progress *
                  2.0 // First half: scale up
            : 2.0 - (progress * 2.0); // Second half: scale down

        // Apply an ease-in-out curve for a natural, snappy bounce
        double scale = Curves.easeInOut.transform(bounceProgress);

        return Transform.scale(
          scale: scale,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Semi-transparent so the overlapping circles blend dynamically
              color: widget.color.withValues(alpha: 0.6),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBounceCircle(false), // Primary circle
          _buildBounceCircle(true), // Inverted circle
        ],
      ),
    );
  }
}
