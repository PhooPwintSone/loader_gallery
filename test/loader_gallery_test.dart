import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_gallery/loader_gallery.dart';
//
import 'package:loader_gallery/src/loaders/bouncing_ball_loader.dart';
import 'package:loader_gallery/src/loaders/bouncing_dots_loader.dart';
import 'package:loader_gallery/src/loaders/chasing_dots_loader.dart';
import 'package:loader_gallery/src/loaders/coin_flip_loader.dart';
import 'package:loader_gallery/src/loaders/double_bounce_loader.dart';

void main() {
  group('LoaderGallery', () {
    // Bouncing Ball Loader
    testWidgets('bouncingBall renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoaderGallery.bouncingBall(color: Colors.blue, size: 40),
          ),
        ),
      );

      expect(find.byType(BouncingBallLoader), findsOneWidget);
    });

    testWidgets('bouncingBall accepts customization', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoaderGallery.bouncingBall(color: Colors.red, size: 50),
          ),
        ),
      );

      final loader = tester.widget<BouncingBallLoader>(
        find.byType(BouncingBallLoader),
      );

      expect(loader.color, Colors.red);
      expect(loader.size, 50);
    });

    // Bouncing Dots Loader
    testWidgets('bouncingDots renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoaderGallery.bouncingDots(color: Colors.blue, size: 14),
          ),
        ),
      );

      expect(find.byType(BouncingDotsLoader), findsOneWidget);
    });

    testWidgets('bouncingDots accepts customization', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoaderGallery.bouncingDots(color: Colors.red, size: 16),
          ),
        ),
      );

      final loader = tester.widget<BouncingDotsLoader>(
        find.byType(BouncingDotsLoader),
      );

      expect(loader.color, Colors.red);
      expect(loader.size, 16);
    });

    // Chasing Dots Loader
    testWidgets('chasingDots renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoaderGallery.chasingDots(color: Colors.deepPurple, size: 50),
          ),
        ),
      );

      expect(find.byType(ChasingDotsLoader), findsOneWidget);
    });
  });

  // Coin Flip Loader
  testWidgets('coinFlip renders correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoaderGallery.coinFlip(color: Colors.blue, size: 50),
        ),
      ),
    );

    expect(find.byType(CoinFlipLoader), findsOneWidget);
  });

  testWidgets('coinFlip accepts customization', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoaderGallery.coinFlip(color: Colors.red, size: 40),
        ),
      ),
    );

    final loader = tester.widget<CoinFlipLoader>(find.byType(CoinFlipLoader));

    expect(loader.color, Colors.red);
    expect(loader.size, 40);
  });

  // Double Bounce Loader
  testWidgets('doubleBounce renders correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoaderGallery.doubleBounce(color: Colors.blue, size: 60),
        ),
      ),
    );

    expect(find.byType(DoubleBounceLoader), findsOneWidget);
  });

  testWidgets('doubleBounce accepts customization', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoaderGallery.doubleBounce(color: Colors.red, size: 70),
        ),
      ),
    );

    final loader = tester.widget<DoubleBounceLoader>(
      find.byType(DoubleBounceLoader),
    );

    expect(loader.color, Colors.red);
    expect(loader.size, 70);
  });

  /// end
}
