import 'package:flutter/material.dart';
import '../../ui/screens/profile_screen.dart';

import '../../data/app_data.dart';
import '../../states/food_state.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'food_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CartScreenState> _cartKey = GlobalKey();
  late final List<Widget> screens = [
    const FoodList(),
    CartScreen(
      key: _cartKey,
    ),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  int get currentIndex => FoodState().currentIndex;
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

  void onTabTap(int index) async {
    await FoodState().onTabTap(index);
    setState(() {});
    if (index == 1) _cartKey.currentState?.update();
  }
}