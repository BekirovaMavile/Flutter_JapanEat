// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';
//
// class SimpleAnimation extends StatelessWidget {
//   // final double delay;
//   final Widget child;
//
//   const SimpleAnimation({Key? key, required this.child})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PlayAnimationBuilder<double>(
//       tween: Tween(begin: 100.0, end: 300.0),
//       duration: const Duration(seconds: 2),
//       delay: const Duration(seconds: 4),
//       curve: Curves.easeOut,
//       builder: (context, value, child) {
//         return Container(
//           width: value,
//           height: 30.0,
//           color: const Color(0xFFFD8629),
//         );
//       },
//     );
//   }
// }
