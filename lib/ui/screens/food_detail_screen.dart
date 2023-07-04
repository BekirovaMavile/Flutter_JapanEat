import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/food_state.dart';
import '../../data/models/food.dart';
import '../../data/app_data.dart';
import '../../ui_kit/app_color.dart';
import '../../ui_kit/app_icon.dart';
import '../widgets/counter_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => FoodDetailState();
}

class FoodDetailState extends State<FoodDetail> {
  int get foodId => FoodState().selectedFood;
  Food get food => FoodState().foodById(foodId);
  late int _amount = food.quantity;
  bool isOpenCart = false;
  double _size = 10;
  Color _color = Colors.pink;

  void onIncrementTap() {
    _amount++;
    setState(() {});
  }

  void onDecrementTap() {
    if (_amount == 1) return;
    _amount--;
    setState(() {});
  }

  void onAddToCart() async{
    await FoodState().onAddToCartTap(foodId, _amount);
    await _showDialog();
    if(isOpenCart){
      isOpenCart = false;
      final BottomNavigationBar navigationBar = FoodState().tabKey.currentWidget as BottomNavigationBar;
      navigationBar.onTap?.call(1);
      Navigator.of(context).pop();
    }
  }

  void onAddDeleteFavorite() async {
    await FoodState().onDeleteAddFavorite(foodId);
    setState(() {
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Food added to cart'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text(
                    'Do you want open cart?'
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'No',
                style:TextStyle(color:LightThemeColor.accent),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Yes',
                style:TextStyle(color: LightThemeColor.accent),),
              onPressed: () {
                isOpenCart = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void startAnimation(){
    // _size = 300;
    // print("print");
    // setState(() {
    // });
    Future.delayed(const Duration(milliseconds: 100), () {
      print("print");
      _size = 300;
      _color = Colors.black;
      setState(() {
      });
    });
  }

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("lala");
    return Scaffold(
        appBar: _appBar(context),
        body: Center(
            child: AnimatedContainer(
              width: _size,
                height: _size,
                color: _color,
                duration: const Duration(seconds: 2),
                curve: Curves.bounceOut,
                child: Image.asset(
                    food.image, scale: 2),
            ),
        ),
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
      onPressed: onAddDeleteFavorite,
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
                                  _amount.toString(),
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