import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/ui/widgets/empty_wrapper.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        title: "Empty cart",
        isEmpty: true,
        child: Container(),
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Card screen",
      style: Theme.of(context).textTheme.displayMedium,
    ),
  );
}

