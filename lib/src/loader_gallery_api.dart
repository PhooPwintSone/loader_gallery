import 'package:flutter/material.dart';

//
import 'loaders/bouncing_ball_loader.dart';
import 'loaders/bouncing_dots_loader.dart';
import 'loaders/chasing_dots_loader.dart';
import 'loaders/coin_flip_loader.dart';
import 'loaders/double_bounce_loader.dart';
import 'loaders/dual_ring_loader.dart';
import 'loaders/ellipse_swap_loader.dart';
import 'loaders/equalizer_loader.dart';
import 'loaders/flip_square_loader.dart';
import 'loaders/folding_cube_loader.dart';

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

  //Coin Flip
  static Widget coinFlip({
    Color color = Colors.white,
    Color edgeColor = Colors.amber,
    double size = 50.0,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return CoinFlipLoader(
      color: color,
      edgeColor: edgeColor,
      size: size,
      duration: duration,
    );
  }

  //Double Bounce
  static Widget doubleBounce({
    Color color = Colors.white,
    double size = 60.0,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    return DoubleBounceLoader(color: color, size: size, duration: duration);
  }

  // Dual Ring
  static Widget dualRing({
    Color color = Colors.white,
    double size = 50.0,
    double strokeWidth = 5.0,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    return DualRingLoader(
      color: color,
      size: size,
      strokeWidth: strokeWidth,
      duration: duration,
    );
  }

  // Ellipse Swap
  static Widget ellipseSwap({
    Color color = Colors.white,
    double size = 50.0,
    double dotSize = 12.0,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return EllipseSwapLoader(
      color: color,
      size: size,
      dotSize: dotSize,
      duration: duration,
    );
  }

  // Equalizer
  static Widget equalizer({
    Color color = Colors.white,
    double size = 40.0,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return EqualizerLoader(color: color, size: size, duration: duration);
  }

  // Flip Square
  static Widget flipSquare({
    Color color = Colors.white,
    double size = 40.0,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    return FlipSquareLoader(color: color, size: size, duration: duration);
  }

  // Folding Cube
  static Widget foldingCube({
    Color color = Colors.white,
    double size = 50.0,
    Duration duration = const Duration(milliseconds: 2400),
  }) {
    return FoldingCubeLoader(color: color, size: size, duration: duration);
  }
}
