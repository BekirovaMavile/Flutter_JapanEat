import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/tab_navigation/tab_provider.dart';
import '../screens/profile_screen.dart';
import '../../data/app_data.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'food_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const FoodList(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    return Scaffold(
        body: SafeArea(
              child: IndexedStack(
                index: tabProvider.currentIndex,
                children: screens,
              ),
            ),
          // },
        // ),
        bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabProvider.currentIndex,
              onTap: (index) => tabProvider.setTabIndex(index),
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
          // },
        // ),
      );
    // );
  }
}
