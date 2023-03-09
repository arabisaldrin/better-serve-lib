class Discount {
  final DiscountType type;
  final int value;

  Discount(this.type, this.value);
}

enum DiscountType {
  fixed("Fixed"),
  rate("Rate");

  final String label;
  const DiscountType(this.label);

  static DiscountType fromValue(String name) {
    if (name == "fixed") return DiscountType.fixed;
    return DiscountType.rate;
  }
}
