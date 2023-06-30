import 'package:flutter/material.dart';

class ScaleTweenAnimationsBuilder extends StatelessWidget {
  const ScaleTweenAnimationsBuilder({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0.1, end: 1),
      builder: (_, double scale, __) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      curve: Curves.bounceOut,
    );
  }
}
