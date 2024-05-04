class SaleModel {
  final String? description;
  final int? discount;
  final String? id;
  final String? name;
  final String? photoLink;

  SaleModel({
    this.description,
    this.discount,
    this.id,
    this.name,
    this.photoLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'discount': discount,
      'id': id,
      'name': name,
      'photoLink': photoLink,
    };
  }

  factory SaleModel.fromJson(Map<String, dynamic> map) {
    return SaleModel(
      description: map['description'],
      discount: map['discount']?.toInt(),
      id: map['id'],
      name: map['name'],
      photoLink: map['photoLink'],
    );
  }
}
