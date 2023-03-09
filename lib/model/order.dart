library better_serve_lib;

import 'addon.dart';
import 'product.dart';
import 'coupon.dart';

class Order {
  final int id;
  final int itemCount;
  final int orderAmount;
  final int grandTotal;
  final String orderDate;
  final String orderTime;
  final List<OrderItem> items;
  final int queueNumber;
  final int paymentAmount;
  String? discountType;
  int? discountAmount;
  int? discountRate;
  Coupon? coupon;
  int status;

  bool get isPending => status == OrderStatus.pending.ordinal;

  String get statusName =>
      {0: "onhold", 1: "pending", 2: "processing", 3: "done"}[status]!;

  Order({
    required this.id,
    required this.itemCount,
    required this.orderAmount,
    required this.grandTotal,
    required this.orderDate,
    required this.orderTime,
    required this.items,
    required this.status,
    required this.queueNumber,
    required this.paymentAmount,
    this.discountType,
    this.discountAmount,
    this.discountRate,
    this.coupon,
  });

  Order.fromJson(dynamic json)
      : this(
          id: json["id"],
          itemCount: json["item_count"],
          orderAmount: json["order_amount"],
          paymentAmount: json["payment_amount"],
          grandTotal: json["grand_total"],
          orderDate: json["order_date"],
          orderTime: json["order_time"],
          items: (json["order_items"] as List<dynamic>)
              .map((e) => OrderItem.fromJson(e))
              .toList(),
          status: json["status"],
          queueNumber: json["queue_number"],
          discountType: json["discount_type"],
          discountAmount: json["discount_amount"],
          discountRate: json["discount_rate"],
          coupon: json["coupon_id"] != null
              ? Coupon.fromJson(json["coupon"])
              : null,
        );
}

class OrderItem {
  final int id;
  final int orderId;
  final String productName;
  final String productImg;
  final String? variationName;
  final String? variationValue;
  final int quantity;
  final int unitPrice;
  final int subTotal;

  Product? product;

  final List<OrderItemAttribute> attributes;
  final List<OrderItemAddon> addons;

  OrderItem(
      {required this.id,
      required this.orderId,
      required this.productName,
      required this.productImg,
      required this.quantity,
      required this.unitPrice,
      required this.subTotal,
      required this.attributes,
      required this.addons,
      this.variationName,
      this.variationValue,
      this.product});

  OrderItem.fromJson(dynamic json)
      : this(
            id: json["id"],
            orderId: json["order_id"],
            productName: json["product_name"],
            productImg: json["product_img"],
            variationName: json["variation_name"],
            variationValue: json["variation_value"],
            quantity: json["quantity"],
            unitPrice: json["unit_price"],
            subTotal: json["sub_total"],
            attributes: (json["order_item_attributes"] as List<dynamic>)
                .map((e) => OrderItemAttribute.fromJson(e))
                .toList(),
            addons: (json["order_item_addons"] as List<dynamic>)
                .map((e) => OrderItemAddon.fromJson(e))
                .toList(),
            product: Product.fromJson(json["product"]));
}

class OrderItemAttribute {
  final String name;
  final List<String> values;

  OrderItemAttribute({required this.name, required this.values});

  OrderItemAttribute.fromJson(dynamic json)
      : this(
            name: json["name"],
            values: (json["values"] as List<dynamic>)
                .map<String>((e) => e as String)
                .toList());
}

class OrderItemAddon {
  final String name;
  final int price;
  final String imgPath;
  Addon addon;

  OrderItemAddon(
      {required this.name,
      required this.price,
      required this.imgPath,
      required this.addon});

  OrderItemAddon.fromJson(dynamic json)
      : this(
            name: json["name"],
            price: json["price"],
            imgPath: json["img_path"],
            addon: Addon.fromJson(json["addon"]));
}

enum OrderStatus {
  onhold(0),
  pending(1),
  processing(2),
  done(3);

  final int ordinal;
  const OrderStatus(this.ordinal);
}
