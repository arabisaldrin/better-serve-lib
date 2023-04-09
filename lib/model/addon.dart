class Addon {
  final int id;
  final String name;
  final int price;
  String imgPath;

  Addon(
      {required this.id,
      required this.name,
      required this.price,
      required this.imgPath});

  Addon.fromJson(dynamic json)
      : this(
            id: json["id"],
            name: json["name"],
            price: json["price"],
            imgPath: json["img_path"]);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img_path': imgPath,
    };
  }

  Addon clone() {
    return Addon(id: id, name: name, price: price, imgPath: imgPath);
  }
}
