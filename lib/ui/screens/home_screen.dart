import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/food_state.dart';
import 'profile_screen.dart';

import '../../data/app_data.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'food_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTap,
        selectedFontSize: 0,
        items: AppData.bottomNavigationItems.map(
              (element) {
            return BottomNavigationBarItem(
              icon: element.disableIcon,
              label: element.label,
              activeIcon: element.enableIcon,
            );
          },
        ).toList(),
      ),
    );
  }

  final List<Widget> screens = [const FoodList(), const CartScreen(), const FavoriteScreen(), const ProfileScreen()];

  int get currentIndex => FoodState().tabIndex;
  // int currentIndex = 0;
  void onTabTap(int index) async {
    await FoodState().tabTap(index);
    // FoodState().tabIndex = 3;
    setState(() {});
  }
}
