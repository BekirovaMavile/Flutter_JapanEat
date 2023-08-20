import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/tab_navigation/tab_cubit.dart';
import '../screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final List<Widget> screens = [
    const FoodList(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  void onTabTap(int index) {
    context.read<LogicCubit>().onTabTap(index);
  }

  @override
  Widget build(BuildContext context) {
    final logicTab = context.watch<LogicCubit>().state.currentIndex;
    return Scaffold(
        body: SafeArea(
              child: IndexedStack(
                index: logicTab,
                children: screens,
              ),
            ),
          // },
        // ),
        bottomNavigationBar: BottomNavigationBar(
              currentIndex: logicTab,
              onTap: (index) => onTabTap(index),
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
