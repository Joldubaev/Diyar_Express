import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  String? urlPhoto;
  String? categoryId;
  int? containerCount;
  String? containerName;
  int? iDctMax;
  String? name;
  int? price;
  bool? stopList;
  String? weight;

  FoodModel({
    this.urlPhoto,
    this.categoryId,
    this.containerCount,
    this.containerName,
    this.iDctMax,
    this.name,
    this.price,
    this.stopList,
    this.weight,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        urlPhoto: json["URLPhoto"],
        categoryId: json["categoryId"],
        containerCount: json["containerCount"],
        containerName: json["containerName"],
        iDctMax: json["iDCTMax"],
        name: json["name"],
        price: json["price"],
        stopList: json["stopList"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "URLPhoto": urlPhoto,
        "categoryId": categoryId,
        "containerCount": containerCount,
        "containerName": containerName,
        "iDCTMax": iDctMax,
        "name": name,
        "price": price,
        "stopList": stopList,
        "weight": weight,
      };
}
