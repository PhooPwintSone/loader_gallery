import 'package:flutter/material.dart';

class BouncingBallLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const BouncingBallLoader({
    super.key,
    this.color = Colors.white,
    this.size = 30.0,
    // A faster duration creates a more energetic, realistic bounce
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<BouncingBallLoader> createState() => _BouncingBallLoaderState();
}

class _BouncingBallLoaderState extends State<BouncingBallLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    // Map the bounce height. It goes up to 1.5x its size.
    _bounceAnimation = TweenSequence([
      TweenSequenceItem(
        // Moving up: starts fast, slows down at the peak
        tween: Tween<double>(
          begin: 0,
          end: -widget.size * 1.5,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 50,
      ),
      TweenSequenceItem(
        // Falling down: starts slow, accelerates until it hits the ground
        tween: Tween<double>(
          begin: -widget.size * 1.5,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 50,
      ),
    ]).animate(_controller);
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
      height: widget.size * 2.5, // Extra height to accommodate the jump
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Normalize the current height to a 0.0 -> 1.0 ratio
          // 0.0 is on the ground, 1.0 is at the peak of the jump
          double heightRatio = (_bounceAnimation.value / (-widget.size * 1.5));

          // Shrink and fade the shadow as the ball gets higher
          double shadowScale = 1.0 - (heightRatio * 0.5);
          double shadowOpacity = 0.4 - (heightRatio * 0.3);

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Shadow
              Transform.scale(
                scale: shadowScale,
                child: Opacity(
                  opacity: shadowOpacity,
                  child: Container(
                    width: widget.size * 0.8,
                    height: widget.size * 0.2, // Flattened ellipse
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(widget.size),
                    ),
                  ),
                ),
              ),
              // Ball
              Transform.translate(
                // Offset slightly above the shadow so they don't overlap completely
                offset: Offset(0, _bounceAnimation.value - widget.size * 0.2),
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
