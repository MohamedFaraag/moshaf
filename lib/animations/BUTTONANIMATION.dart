import 'dart:async';
import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final Widget child;
  final Duration time;

  const ButtonAnimation(this.child, this.time);
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with SingleTickerProviderStateMixin {
  Timer timer;
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 290), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0.1, 2 - (animation.value) * 5),
            child: child,
          ),
        );
      },
    );
  }
}

Timer timer;
Duration duration = Duration();

wait() {
  if (timer == null || !timer.isActive) {
    timer = Timer(Duration(microseconds: 120), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: 100);
  return duration;
}

class WIDGETBUTTONANIMATION extends StatelessWidget {
  final Widget child;
  WIDGETBUTTONANIMATION(this.child);
  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(child, wait());
  }
}
