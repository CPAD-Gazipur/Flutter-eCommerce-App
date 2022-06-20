import 'package:equatable/equatable.dart';
import 'model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    dynamic quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  final double freeDeliveryLimit = 100.0;

  double get subTotalPrice => products.fold(
      0, (previousValue, element) => previousValue + element.price);

  double deliveryFee(subTotalPrice) {
    if (subTotalPrice >= freeDeliveryLimit) {
      return 0.0;
    } else {
      return 20.0;
    }
  }

  String freeDelivery(subTotalPrice) {
    if (subTotalPrice >= freeDeliveryLimit) {
      return 'You have free delivery';
    } else {
      double missing = freeDeliveryLimit - subTotalPrice;
      return 'Add \$$missing for free delivery';
    }
  }

  double totalPrice(subTotalPrice, deliveryFee) {
    return subTotalPrice + deliveryFee(subTotalPrice);
  }

  String get subTotalPriceString => subTotalPrice.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotalPrice).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotalPrice);

  String get totalPriceString =>
      totalPrice(subTotalPrice, deliveryFee).toStringAsFixed(2);
}
