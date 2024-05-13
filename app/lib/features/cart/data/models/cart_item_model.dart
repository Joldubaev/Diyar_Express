import 'package:diyar_express/features/menu/data/models/models.dart';

class CartItemModel {
  final FoodModel? food;
  final int? quantity;
  final double? totalPrice;

  CartItemModel({
    this.food,
    this.quantity,
    this.totalPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        food: FoodModel.fromJson(json["food"]),
        quantity: json["quantity"],
        totalPrice: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "food": food?.toJson(),
        "quantity": quantity,
        "price": totalPrice,
      };
}
