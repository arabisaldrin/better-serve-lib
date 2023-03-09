import 'attribute.dart';
import 'category.dart';
import 'variation.dart';

class Product {
  int id;
  String name;
  int basePrice;
  String imgPath;
  late int categoryId;
  bool allowAddon;

  Category category;
  Variation? variation;
  List<Attribute> attributes = List.empty(growable: true);

  Product(
      {required this.id,
      required this.name,
      required this.basePrice,
      required this.imgPath,
      required this.category,
      required this.variation,
      required this.attributes,
      this.allowAddon = true}) {
    categoryId = category.id;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'base_price': basePrice,
      'img_url': imgPath,
      'category_id': category.id,
      'allow_addon': allowAddon,
    };
  }

  Product.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            basePrice: json['base_price'] ?? 0,
            imgPath: json['img_url'],
            category: Category.fromJson(json['category']),
            variation: json["variation"] == null
                ? null
                : Variation.fromJson(json["variation"]),
            attributes: (json["attributes"] as List<dynamic>)
                .map((e) => Attribute.fromJson(e))
                .toList(),
            allowAddon: json["allow_addon"]);
}
