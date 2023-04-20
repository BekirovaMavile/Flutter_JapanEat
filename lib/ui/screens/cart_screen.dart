import 'package:flutter/material.dart';
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

