import 'model/order.dart';
import 'model/variation.dart';

extension OrderExt on Order {
  bool get isPending => status == OrderStatus.pending.ordinal;
  String get statusName =>
      {0: "onhold", 1: "pending", 2: "processing", 3: "done"}[status]!;
}

extension VariationOptionExt on VariationOption {
  bool get isBlank => value.isEmpty || price == 0;
}
