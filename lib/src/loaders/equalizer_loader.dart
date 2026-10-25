import 'package:flutter/material.dart';

class EqualizerLoader extends StatefulWidget {
  final Color color;
  final double size; // Represents the maximum height of the bars
  final Duration duration;

  const EqualizerLoader({
    super.key,
    this.color = Colors.white,
    this.size = 40.0,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<EqualizerLoader> createState() => _EqualizerLoaderState();
}

class _EqualizerLoaderState extends State<EqualizerLoader>
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

  Widget _buildBar(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Apply a phase shift to stagger the animation of each bar
        double value = (_controller.value + delay) % 1.0;

        // Convert the 0.0 to 1.0 linear value into a 0.0 -> 1.0 -> 0.0 peak
        double peak = (0.5 - (value - 0.5).abs()) * 2.0;

        // Ensure the bar always has a minimum height of 30% of the max size
        double currentHeight = widget.size * (0.3 + (0.7 * peak));

        return Container(
          width: widget.size * 0.12, // Bar width relative to overall size
          height: currentHeight,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.size * 0.1),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centers the bars vertically
        children: [
          _buildBar(0.0),
          _buildBar(0.4),
          _buildBar(0.8),
          _buildBar(0.2),
          _buildBar(0.6),
        ],
      ),
    );
  }
}
