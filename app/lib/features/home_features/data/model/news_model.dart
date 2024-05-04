class NewsModel {
  final String? description;
  final String? id;
  final String? name;
  final String? photoLink;

  NewsModel({
    this.description,
    this.id,
    this.name,
    this.photoLink,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        description: json["description"],
        id: json["id"],
        name: json["name"],
        photoLink: json["photoLink"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": name,
        "photoLink": photoLink,
      };
}
