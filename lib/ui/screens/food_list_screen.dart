import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/food.dart';
import '../../data/models/food_category.dart';
import '../../states/food_state.dart';
import '../../ui_kit/_ui_kit.dart';
import '../../data/app_data.dart';
import '../extension/app_extension.dart';
import '../widgets/food_list_view.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<StatefulWidget> createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  List<Food> get foodsByCategory => FoodState().foodsByCategory;
  List<FoodCategory> get categories => FoodState().categories;
  List<Food> get foods => FoodState().foods;

  void onCategoryTap(FoodCategory category) async {
    await FoodState().onCategoryTap(category);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(context),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Morning, Mavi",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "What do you want to eat \ntoday",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            _searchBar(),
            Text(
              "Available for you",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            _categories(),
            FoodListView(
                foods: foodsByCategory,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best food of the week",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "See all",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: LightThemeColor.accent),
                    ),
                  ),
                ],
              ),
            ),
            FoodListView(
                foods: foods,
                isReversed: true,
            ),
          ],
        ),
      ),
    ),
  );
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, color: LightThemeColor.accent),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeStyle: const BadgeStyle(badgeColor: LightThemeColor.accent),
            badgeContent: const Text(
              "2",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topStart(start: -3),
            child: const Icon(Icons.notifications_none, size: 30),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search food',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  onCategoryTap(category);
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: category.isSelected
                        ? LightThemeColor.accent
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    category.type.name.toCapital,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Container(
              width: 15,
            ),
            itemCount: categories.length),
      ),
    );
  }
}