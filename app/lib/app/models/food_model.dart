import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  String? name;
  String? categoryId;
  int? price;
  String? weight;
  String? urlPhoto;

  FoodModel({
    this.name,
    this.categoryId,
    this.price,
    this.weight,
    this.urlPhoto,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        name: json["name"],
        categoryId: json["categoryId"],
        price: json["price"],
        weight: json["weight"],
        urlPhoto: json["URLPhoto"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "categoryId": categoryId,
        "price": price,
        "weight": weight,
        "URLPhoto": urlPhoto,
      };
}
