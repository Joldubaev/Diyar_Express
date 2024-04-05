import 'package:diyar_express/features/menu/data/models/models.dart';

class CartItemModel {
  final String? id;
  final FoodModel? food;
  final int? quantity;

  CartItemModel({
    this.id,
    this.food,
    this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        food: FoodModel.fromJson(json["food"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food": food?.toJson(),
        "quantity": quantity,
      };
}
