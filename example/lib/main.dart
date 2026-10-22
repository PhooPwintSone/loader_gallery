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
        appBar: AppBar(title: const Text('Loader Gallery')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoaderGallery.bouncingBall(color: Colors.blue, size: 40),
              const SizedBox(height: 60),
              LoaderGallery.bouncingDots(color: Colors.deepPurple, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}
