import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_japan_eat/ui_kit/_ui_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<StatefulWidget> createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(context),
  );
}

PreferredSizeWidget _appBar(BuildContext context){
  return AppBar(
    leading: IconButton(
      icon: const FaIcon(FontAwesomeIcons.dice),
      onPressed: () {},
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on_outlined, color: LightThemeColor.accent),
        Text("Location",
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Badge(
          badgeStyle: const BadgeStyle(
              badgeColor: LightThemeColor.accent
          ),
          badgeContent: const Text(
            "2",
            style: TextStyle(color: Colors.white),
          ),
          position: BadgePosition.topStart(
              start: -3
          ),
          child: const Icon(Icons.notifications_none,
              size: 30),
        ),
      )
    ],
  );
}