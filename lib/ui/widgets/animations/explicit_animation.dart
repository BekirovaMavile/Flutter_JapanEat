import 'package:flutter/material.dart';
class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    // animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut))
    // ..addListener(() {setState(() {
    // });
    // });
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}
