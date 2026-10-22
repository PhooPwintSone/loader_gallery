import 'package:flutter/material.dart';

import 'loaders/bouncing_ball_loader.dart';
import 'loaders/bouncing_dots_loader.dart';
import 'loaders/chasing_dots_loader.dart';

class LoaderGallery {
  LoaderGallery._();

  //Bouncing Ball
  static Widget bouncingBall({
    Color color = Colors.white,
    double size = 30.0,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return BouncingBallLoader(color: color, size: size, duration: duration);
  }

  //Bouncing Dots
  static Widget bouncingDots({
    Color color = Colors.white,
    double size = 12.0,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    return BouncingDotsLoader(color: color, size: size, duration: duration);
  }

  //Chansing Dots
  static Widget chasingDots({
    Color color = Colors.white,
    double size = 50.0,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return ChasingDotsLoader(color: color, size: size, duration: duration);
  }
}
