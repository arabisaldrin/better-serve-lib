class Attribute {
  int? id;

  late String name;
  late List<AttributeOption> options;
  late AttributeType type;

  Attribute(
      {this.id, required this.name, required this.options, required this.type});

  Attribute clone() => Attribute(
      id: id,
      name: name,
      options: options.map((e) => e.clone()).toList(),
      type: type);

  dynamic toJson() {
    return {
      "id": id,
      "name": name,
      "is_multiple": type == AttributeType.multiple,
      "options": options.map((e) => e.toJson()).toList()
    };
  }

  Attribute.fromJson(dynamic json)
      : this(
            id: json["id"],
            name: json["name"],
            type: json["is_multiple"]
                ? AttributeType.multiple
                : AttributeType.single,
            options: (json["options"] as List<dynamic>)
                .map((e) => AttributeOption.fromJson(e))
                .toList());
}

class AttributeOption {
  int? id;
  int order = 0;

  late String value;
  late bool selected;
  late bool isDefault;

  AttributeOption(
      {this.id,
      required this.value,
      required this.selected,
      this.order = 0,
      this.isDefault = false});

  AttributeOption clone() {
    return AttributeOption(
        id: id,
        value: value,
        selected: selected,
        order: order,
        isDefault: isDefault);
  }

  dynamic toJson() {
    return {"id": id, "value": value, "is_selected": selected, "order": order};
  }

  AttributeOption.fromJson(dynamic json)
      : this(
          id: json["id"],
          value: json["value"],
          selected: json["is_selected"],
          order: json["order"],
          isDefault: json["is_selected"],
        );
}

enum AttributeType {
  single("Single"),
  multiple("Multiple");

  final String name;
  const AttributeType(this.name);
}
