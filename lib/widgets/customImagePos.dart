import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double opacity;
  final double height;
  final String networkImageUrl;
  CustomImage({
    this.opacity,
    this.height,
    this.networkImageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.network(
            networkImageUrl,
            height: height,
          ),
        ),
      ),
    );
  }
}
