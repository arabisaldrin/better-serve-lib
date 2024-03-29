class Variation {
  int? id;
  String name;
  List<VariationOption> options;

  Variation({this.id, required this.name, required this.options});

  List<VariationOption> sort() {
    options.sort((a, b) => a.price.compareTo(b.price));
    return options;
  }

  Variation clone() => Variation(
      id: id, name: name, options: options.map((e) => e.clone()).toList());

  Variation.fromJson(dynamic json)
      : this(
            id: json["id"],
            name: json["name"],
            options: (json["options"] as List<dynamic>)
                .map((e) => VariationOption.fromJson(e))
                .toList());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "options": options.map((e) => e.toJson()).toList()
      };
}

class VariationOption {
  int? id;
  late String value;
  late int price;
  late bool selected;
  late bool isDefault;

  VariationOption(
      {this.id,
      this.value = "",
      this.price = 0,
      this.selected = false,
      this.isDefault = false});

  VariationOption clone() => VariationOption(
      id: id,
      value: value,
      price: price,
      selected: selected,
      isDefault: isDefault);

  VariationOption.fromJson(dynamic json)
      : this(
          id: json["id"],
          value: json["value"],
          price: json["price"],
          selected: json["is_selected"],
          isDefault: json["is_selected"],
        );

  Map<String, dynamic> toJson() =>
      {"id": id, "value": value, "price": price, "is_selected": selected};
}
