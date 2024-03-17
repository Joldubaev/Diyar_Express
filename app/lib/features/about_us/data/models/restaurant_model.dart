class RestaurantModel {
  String? name;
  String? address;
  String? rating;

  RestaurantModel({this.name, this.address, this.rating});

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      address: json['address'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'rating': rating,
    };
  }
}
