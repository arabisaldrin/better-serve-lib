class Category {
  int id;
  String name;
  String icon;
  int order;
  int productCount;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    this.order = 0,
    this.productCount = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'order': order,
    };
  }

  Category.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          icon: json['icon'],
          order: json['order'],
          productCount: json['product_count'] ?? 0,
        );
}
