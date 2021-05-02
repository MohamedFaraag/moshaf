import 'package:flutter/material.dart';
import 'dart:async';

class ENTERANIMATION extends StatefulWidget {
  final Widget child;
  final Duration deley;
  final Duration duration;
  final Offset offset;

  const ENTERANIMATION({
    Key key,
    this.deley = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 32.0),
    this.child,
  }) : super(key: key);
  @override
  ENTERANIMATIONState createState() {
    return new ENTERANIMATIONState();
  }
}

class ENTERANIMATIONState extends State<ENTERANIMATION>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _dxAnimation;
  Animation _dyAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    Future.delayed(widget.deley, () {
      if (this.mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform.translate(
              offset: Offset(_dxAnimation.value, _dyAnimation.value),
              child: widget.child,
            ),
          );
        });
  }
}
