import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../animations/BUTTONANIMATION.dart';

class LoadingShimmer extends StatelessWidget {
  final String text;
  LoadingShimmer({this.text});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: Color(0xfff9e9b8),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: height * 0.1,
              ),
              WIDGETBUTTONANIMATION(
                Text(
                  'Leading $text ..!',
                  style: TextStyle(fontSize: height * 0.02),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
