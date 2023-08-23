import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:flutter_japan_eat/states/food/food_cubit.dart';
import '../widgets/empty_wrapper.dart';
import '../../data/app_data.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_text_style.dart';
import '../widgets/counter_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  double taxes = 5;
  @override
  Widget build(BuildContext context) {
    final List<Food> cartFood = context.watch<FoodCubit>().getCartList;
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        title: "Empty cart",
        isEmpty: cartFood.isEmpty,
        child: _cartListView(),
      ),
      bottomNavigationBar: cartFood.isEmpty? const SizedBox() : _bottomAppBar(),
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
    final List<Food> cartFood = context.watch<FoodCubit>().getCartList;
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: cartFood.length,
      itemBuilder: (_, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              context.read<FoodCubit>().deleteFromCart(cartFood[index]);
            }
          },
          key: UniqueKey(),
          background:Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const FaIcon(FontAwesomeIcons.trash),
              ),
            ],
          ),
          child: Container(
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
                      onIncrementTap: () =>
                          context
                              .read<FoodCubit>()
                              .increaseQuantity(cartFood[index]),
                      onDecrementTap: () =>
                          context
                              .read<FoodCubit>()
                              .decreaseQuantity(cartFood[index]),
                      size: const Size(24, 24),
                      padding: 0,
                      label: Text(
                        cartFood[index].quantity.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Text(
                      // "\$11",
                      "\$${context.read<FoodCubit>().priceFood(cartFood[index])}",
                      style: AppTextStyle.h2Style.copyWith(color:
                      LightThemeColor.accent),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }

  Widget _bottomAppBar() {
    final List<Food> cartFood = context.watch<FoodCubit>().getCartList;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
          child: SizedBox(
              height: 250,
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? DarkThemeColor.primaryLight : Colors.white,
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
                                "\$${context.read<FoodCubit>().subtotalPrice}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Taxes",
                                style:
                                Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "\$$taxes",
                                style:
                                Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
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
                                "\$${taxes + context.read<FoodCubit>().subtotalPrice}",
                                style:
                                AppTextStyle.h2Style.copyWith(color: LightThemeColor.accent,),
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
                              onPressed: () {
                                // for (final food in cartFood) {
                                  context.read<FoodCubit>().cleanCart();
                                // }
                              },
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