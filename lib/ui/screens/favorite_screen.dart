import 'package:flutter/material.dart';

import '../../data/app_data.dart';
import '../../data/models/food.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_icon.dart';
import '../widgets/empty_wrapper.dart';
import '../../states/food_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  List<int> get favoriteIds => FoodState().favoriteIds;
  var favoriteFood = AppData.favoriteItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      // body: _favoriteListView(),
      body: EmptyWrapper(
        type: EmptyWrapperType.favorite,
        title: 'Empty favorite',
        isEmpty: favoriteFood.isEmpty,
        child: _favoriteListView(),
      ),
    );
  }
  void update() {
    setState(() {});
  }
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Favorite screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _favoriteListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: favoriteFood.length,
      itemBuilder: (_, index) {
        Food food = favoriteFood[index];
        return Card(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white :
          DarkThemeColor.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              food.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: Image.asset(food.image),
            subtitle: Text(
              food.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }

}