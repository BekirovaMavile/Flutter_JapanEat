import 'package:flutter/material.dart';
import '../../data/models/food.dart';
import '../../states/food_state.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_icon.dart';
import '../widgets/counter_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key, required this.foods});
  final Food foods;
  @override
  State<FoodDetail> createState() => FoodDetailState();
}

class FoodDetailState extends State<FoodDetail> {

  late Food food = widget.foods;

  void onIncrementTap() async{
    await FoodState().onIncreaseQuantityTap(food);
    setState(() {
    });
  }

  void onDecrementTap() async{
    await FoodState().onDecreaseQuantityTap(food);
    setState(() {
    });
  }

  void onAddToCart() async {
    await FoodState().onAddToCartTap(food);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: Center(child: Image.asset(food.image, scale: 2)),
        floatingActionButton: _floatingActionButton(),
        bottomNavigationBar: _bottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.arrow_back),
      // ),
      title: Text(
        'Food Detail Screen',
        style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: LightThemeColor.accent,
      onPressed: () {},
      child: food.isFavorite
          ? const Icon(AppIcon.heart)
          : const Icon(AppIcon.outlinedHeart),
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
                height: 300,
                child: Container(
                  color: Theme.of(context).brightness == Brightness.dark ? DarkThemeColor.primaryLight : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                itemPadding: EdgeInsets.zero,
                                itemSize: 20,
                                initialRating: food.score,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                glow: false,
                                ignoreGestures: true,
                                itemBuilder: (_, __) => const FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: LightThemeColor.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  // ignore: avoid_print
                                  print('$rating');
                                },
                              ),
                              const SizedBox(width: 15),
                              Text(
                                food.score.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "(${food.voter})",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${food.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(color: LightThemeColor.accent),
                              ),
                              CounterButton(
                                onIncrementTap: onIncrementTap,
                                onDecrementTap: onDecrementTap,
                                label: Text(
                                  food.quantity.toString(),
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            food.description,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: ElevatedButton(
                                onPressed: onAddToCart,
                                child: const Text("Add to cart"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }



}