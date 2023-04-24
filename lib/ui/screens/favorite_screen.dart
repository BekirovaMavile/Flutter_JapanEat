import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_japan_eat/ui/widgets/empty_wrapper.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        type: EmptyWrapperType.favorite,
        title: 'Empty favorite',
        isEmpty: true,
        child: Container(),
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Favorite screen",
      style: Theme.of(context).textTheme.displayMedium,
    ),
  );
}


