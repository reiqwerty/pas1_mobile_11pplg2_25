import 'package:flutter/material.dart';

class MyImageNetwork extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const MyImageNetwork({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      width: width,
      height: height,
    );
  }
}
