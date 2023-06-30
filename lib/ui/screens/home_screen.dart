import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/food_state.dart';
import 'package:flutter_japan_eat/ui/_ui.dart';
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
  int get currentIndex => FoodState().tabIndex;
  GlobalKey<CartScreenState> _cartKey = GlobalKey();
  GlobalKey<FavoriteScreenState> _favoriteKey = GlobalKey();

  void onTabTap (int index) async {
    await FoodState().onTabTap(index);
    setState(() {
    });
    if(index == 1) _cartKey.currentState?.update();
    if(index == 2) _favoriteKey.currentState?.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransition(
        child: screens[currentIndex],
      ),


      bottomNavigationBar: BottomNavigationBar(
        key: FoodState().tabKey,
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

  late final List<Widget> screens = [const FoodList(), CartScreen(key: _cartKey,), FavoriteScreen(key: _favoriteKey,), const ProfileScreen()];
}
