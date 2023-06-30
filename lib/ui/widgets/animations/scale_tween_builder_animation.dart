import 'package:flutter/material.dart';

class ScaleTweenAnimationsBuilder extends StatelessWidget {
  const ScaleTweenAnimationsBuilder({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      // duration: const Duration(seconds: 2),
      // tween: Tween<double>(begin: 0.1, end: 1),
      // builder: (_, double scale, __) {
      //   return Transform.scale(
      //     scale: scale,
      //     child: child,
      //   );
      // },
      // curve: Curves.bounceOut,

      // duration: const Duration(seconds: 2),
      // tween: Tween<double>(begin: 0, end: 2 * 3.14),
      // builder: (_, double angle, __) {
      //   return Transform.rotate(
      //     angle: angle,
      //     child: child,
      //   );
      // },

      // duration: const Duration(seconds: 2),
      // tween: Tween<double>(begin: 0, end: 1),
      // builder: (_, double opacity, __) {
      //   return Opacity(
      //     opacity: opacity,
      //     child: child,
      //   );
      // },
      // curve: Curves.easeOut,

      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 10, end: 300),
      builder: (_, double size, __) {
        return SizedBox(
          width: size,
          height: size,
          child: child,
        );
      },
      curve: Curves.bounceOut,



    );
  }
}
