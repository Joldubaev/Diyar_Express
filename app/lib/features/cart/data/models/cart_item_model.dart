import 'package:diyar_express/features/menu/data/models/models.dart';

class CartItemModel {
  final FoodModel? food;
  final int? quantity;

  CartItemModel({
    this.food,
    this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        food: FoodModel.fromJson(json["food"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "food": food?.toJson(),
        "quantity": quantity,
      };
}
