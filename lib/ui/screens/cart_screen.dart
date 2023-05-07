import 'package:flutter/material.dart';
import '../widgets/empty_wrapper.dart';
import '../../data/app_data.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_text_style.dart';
import '../widgets/counter_button.dart';
import '../../states/food_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  List<int> get cartIds => FoodState().cartIds;
  final cartFood = AppData.cartItems;
  double get subtotal => FoodState().calculateSubtotalPrice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        title: "Empty cart",
        isEmpty: cartIds.isEmpty,
        child: _cartListView(),
      ),
      bottomNavigationBar: cartIds.isEmpty ? const SizedBox() : _bottomAppBar(),
    );
  }

  void update() {
    setState(() {});
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
      itemCount: cartIds.length,
      itemBuilder: (_, index) {
        final food = FoodState().foodById(cartIds[index]);
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
              Image.asset(food.image,
                  scale: 10),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${food.price}",
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
                      food.quantity.toString(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Text(
                    "\$${FoodState().calculatePricePerEachItem(food)}",
                    style: AppTextStyle.h2Style.copyWith(color: LightThemeColor.accent),
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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
          child: SizedBox(
              height: 250,
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? 					DarkThemeColor.primaryLight : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const
                          EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style:
                                Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "\$${subtotal.toString()}",
                                style:
                                Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const
                          EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: 									MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Taxes",
                                style:
                                Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "\$${5.00}",
                                style:
                                Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 						           20),
                          child: Divider(thickness: 4.0, height:
                          30.0),
                        ),
                        Padding(
                          padding: const
                          EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style:
                                Theme.of(context).textTheme.displayMedium,
                              ),
                              Text(
                                "\$${(subtotal + 5.0).toString()}",
                                style:
                                AppTextStyle.h2Style.copyWith(
                                  color: LightThemeColor.accent,),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: Padding(
                            padding: const
                            EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const
                              Text("Checkout"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          )
      )
    );
  }

}