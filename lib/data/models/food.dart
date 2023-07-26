enum FoodType { all, sushi, kebab, tempura, ramen, burger }

class Food {
  int id;
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  FoodType type;
  int voter;
  bool cart;

  Food(
      this.id,
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.isFavorite,
      this.description,
      this.score,
      this.type,
      this.voter,
      this.cart,
      );
}
