import 'package:flutter/material.dart';

import 'loaders/bouncing_ball_loader.dart';

class LoaderGallery {
  LoaderGallery._();

  static Widget bouncingBall({
    Color color = Colors.white,
    double size = 30.0,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return BouncingBallLoader(color: color, size: size, duration: duration);
  }
}
