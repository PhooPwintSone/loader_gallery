import 'package:flutter/material.dart';

class BouncingDotsLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const BouncingDotsLoader({
    super.key,
    this.color = Colors.white,
    this.size = 12.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<BouncingDotsLoader> createState() => _BouncingDotsLoaderState();
}

class _BouncingDotsLoaderState extends State<BouncingDotsLoader>
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

  Widget _buildDot(int index) {
    // Stagger the start times for each dot
    final double start = index * 0.15;
    final double end = start + 0.5;

    final Animation<double> animation =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0,
              end: -widget.size,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: -widget.size,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: ConstantTween<double>(0),
            weight: 2, // Keeps the dot at rest for the remainder of the loop
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end > 1.0 ? 1.0 : end),
          ),
        );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 5, // Approximate total width including spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) => _buildDot(index)),
      ),
    );
  }
}
