import 'package:flutter/material.dart';
import '../widgets/empty_wrapper.dart';
import '../../data/app_data.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_text_style.dart';
import '../widgets/counter_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  var cartFood = AppData.cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body:  _cartListView(),

      bottomNavigationBar: _bottomAppBar(),
    );
  }
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _cartListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: cartFood.length,
      itemBuilder: (_, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 20),
              Image.asset(cartFood[index].image, scale: 10),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartFood[index].name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${cartFood[index].price}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  CounterButton(
                    onIncrementTap: () {
                      // ignore: avoid_print
                      print('Нажали на увеличение количества');
                    },
                    onDecrementTap: () {
                      // ignore: avoid_print
                      print('Нажали на уменьшение количества');
                    },
                    size: const Size(24, 24),
                    padding: 0,
                    label: Text(
                      cartFood[index].quantity.toString(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Text(
                    "\$10",
                    style: AppTextStyle.h2Style.copyWith(color:
                    LightThemeColor.accent),
                  )
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
        child: SizedBox(
            height: 250,
            child: Container(
              color: Colors.white,
            )));
  }

}