import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_gallery/loader_gallery.dart';
import 'package:loader_gallery/src/loaders/bouncing_ball_loader.dart';

void main() {
  group('LoaderGallery', () {
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
  });
}
