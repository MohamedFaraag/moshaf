import 'package:flutter/material.dart';
import '../animations/ENTERANIMATION.dart';

class Flare extends StatelessWidget {
  final Offset offset;
  final Color color;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final double height;
  final double width;
  final Duration flareDuration;

  const Flare({
    this.offset,
    this.color,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.height,
    this.width,
    this.flareDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: ENTERANIMATION(
        duration: flareDuration,
        deley: Duration(milliseconds: 100),
        offset: offset,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                color,
                color.withAlpha(150),
                color.withAlpha(100),
                color.withAlpha(50),
                color.withAlpha(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
