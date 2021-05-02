import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyTitle extends StatelessWidget {
  final String title;

  MyTitle({this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.05,
      left: width * 0.2,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        enabled: true,
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
