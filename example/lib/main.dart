import 'package:flutter/material.dart';
import 'package:loader_gallery/loader_gallery.dart';

void main() {
  runApp(const LoaderGalleryExampleApp());
}

class LoaderGalleryExampleApp extends StatelessWidget {
  const LoaderGalleryExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderGallery.bouncingBall(color: Colors.blue, size: 40),
                  const SizedBox(width: 60),
                  LoaderGallery.bouncingDots(
                    color: Colors.deepPurple,
                    size: 12,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderGallery.chasingDots(color: Colors.deepPurple, size: 50),
                  const SizedBox(width: 60),
                  LoaderGallery.coinFlip(
                    color: Colors.black,
                    edgeColor: Colors.black54,
                    size: 50,
                  ),
                ],
              ),

              const SizedBox(height: 60),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderGallery.doubleBounce(color: Colors.yellow, size: 60),
                  const SizedBox(width: 60),
                  LoaderGallery.dualRing(color: Colors.green, size: 60),
                ],
              ),
              //
              const SizedBox(height: 60),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderGallery.ellipseSwap(color: Colors.red, size: 30),
                  const SizedBox(width: 60),
                  LoaderGallery.equalizer(color: Colors.cyan, size: 60),
                ],
              ),

              //
              const SizedBox(height: 60),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderGallery.flipSquare(color: Colors.brown, size: 50),
                  const SizedBox(width: 60),
                  LoaderGallery.foldingCube(color: Colors.green, size: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
