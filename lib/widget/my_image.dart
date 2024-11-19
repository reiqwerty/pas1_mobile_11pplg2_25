import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const MyImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
    );
  }
}
