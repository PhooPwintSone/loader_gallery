import 'package:flutter/material.dart';

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

  /// Creates a bouncing ball loading animation.
  ///
  /// [color] sets the ball color. Defaults to white.
  /// [size] sets the ball size. Defaults to 30 logical pixels.
  /// [duration] sets the animation duration. Defaults to 800 milliseconds.
  static Widget bouncingBall({
    Color color = Colors.white,
    double size = 30.0,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return BouncingBallLoader(color: color, size: size, duration: duration);
  }

  /// Creates a loading animation with bouncing dots.
  ///
  /// [color] sets the dot color. Defaults to white.
  /// [size] sets the dot size. Defaults to 12 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1200 milliseconds.
  static Widget bouncingDots({
    Color color = Colors.white,
    double size = 12.0,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    return BouncingDotsLoader(color: color, size: size, duration: duration);
  }

  /// Creates a chasing dots loading animation.
  ///
  /// [color] sets the dot color. Defaults to white.
  /// [size] sets the animation size. Defaults to 50 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1500 milliseconds.
  static Widget chasingDots({
    Color color = Colors.white,
    double size = 50.0,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return ChasingDotsLoader(color: color, size: size, duration: duration);
  }

  /// Creates a coin-flipping loading animation.
  ///
  /// [color] sets the main coin color. Defaults to white.
  /// [edgeColor] sets the coin's edge color. Defaults to amber.
  /// [size] sets the coin size. Defaults to 50 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1000 milliseconds.
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

  /// Creates a loading animation with two bouncing circles.
  ///
  /// [color] sets the circle color. Defaults to white.
  /// [size] sets the animation size. Defaults to 60 logical pixels.
  /// [duration] sets the animation duration. Defaults to 2000 milliseconds.
  static Widget doubleBounce({
    Color color = Colors.white,
    double size = 60.0,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    return DoubleBounceLoader(color: color, size: size, duration: duration);
  }

  /// Creates a dual-ring rotating loading animation.
  ///
  /// [color] sets the ring color. Defaults to white.
  /// [size] sets the animation size. Defaults to 50 logical pixels.
  /// [strokeWidth] sets the ring stroke width. Defaults to 5 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1200 milliseconds.
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

  /// Creates an ellipse-swapping dots loading animation.
  ///
  /// [color] sets the dot color. Defaults to white.
  /// [size] sets the overall animation size. Defaults to 50 logical pixels.
  /// [dotSize] sets the individual dot size. Defaults to 12 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1500 milliseconds.
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

  /// Creates an equalizer-style loading animation.
  ///
  /// [color] sets the bar color. Defaults to white.
  /// [size] sets the animation size. Defaults to 40 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1000 milliseconds.
  static Widget equalizer({
    Color color = Colors.white,
    double size = 40.0,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return EqualizerLoader(color: color, size: size, duration: duration);
  }

  /// Creates a rotating square loading animation.
  ///
  /// [color] sets the square color. Defaults to white.
  /// [size] sets the square size. Defaults to 40 logical pixels.
  /// [duration] sets the animation duration. Defaults to 1200 milliseconds.
  static Widget flipSquare({
    Color color = Colors.white,
    double size = 40.0,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    return FlipSquareLoader(color: color, size: size, duration: duration);
  }

  /// Creates a folding-cube loading animation.
  ///
  /// [color] sets the cube color. Defaults to white.
  /// [size] sets the animation size. Defaults to 50 logical pixels.
  /// [duration] sets the animation duration. Defaults to 2400 milliseconds.
  static Widget foldingCube({
    Color color = Colors.white,
    double size = 50.0,
    Duration duration = const Duration(milliseconds: 2400),
  }) {
    return FoldingCubeLoader(color: color, size: size, duration: duration);
  }
}
