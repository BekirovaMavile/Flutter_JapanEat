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
      this.cart
      );

  Food copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    int? quantity,
    bool? isFavorite,
    String? description,
    double? score,
    FoodType? type,
    int? voter,
    bool? cart
  }) {
    return Food(
      id ?? this.id,
      image ?? this.image,
      name ?? this.name,
      price ?? this.price,
      quantity ?? this.quantity,
      isFavorite ?? this.isFavorite,
      description ?? this.description,
      score ?? this.score,
      type ?? this.type,
      voter ?? this.voter,
      cart ?? this.cart,
    );
  }

}
