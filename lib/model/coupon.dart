import 'discount.dart';

class Coupon {
  final int id;
  final String code;
  final Discount discount;
  final String description;

  Coupon(this.id, this.code, this.discount, [this.description = ""]);

  Coupon.fromJson(dynamic json)
      : this(
            json["id"],
            json["code"],
            Discount(
              DiscountType.fromValue(json["discount_type"]),
              json["discount_value"],
            ),
            json["description"]);
}
