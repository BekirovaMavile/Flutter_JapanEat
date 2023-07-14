import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/food_state.dart';
import 'package:simple_animations/simple_animations.dart';


// void main() =>
//     runApp(const MaterialApp(home: Scaffold(body: Center(child: Page()))));

class PlayAnimationsBuilder extends StatelessWidget {
  const PlayAnimationsBuilder({Key? key, required this.child, required this.delay}) : super(key: key);
  final Widget child;
  final double delay;

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 40.0, end: 200.0),
      duration: const Duration(seconds: 2),
      // delay: const Duration(seconds: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: (){},
          child: Container(
            width: value,
            height: 50.0,
            child: Text('Checkout'),
          ),
        );
      },
    );
  }
}