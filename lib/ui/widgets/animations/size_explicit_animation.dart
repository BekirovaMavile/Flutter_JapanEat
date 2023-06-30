import 'package:flutter/material.dart';

class SizeExplicitAnimation extends StatefulWidget {
  const SizeExplicitAnimation({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<SizeExplicitAnimation> createState() => _SizeExplicitAnimationState();
}

class _SizeExplicitAnimationState extends State<SizeExplicitAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: animation,
        child: Center(
          child: widget.child,),
      );
    }

    @override
  void dispose(){
    controller.dispose();
    super.dispose();
    }
}
