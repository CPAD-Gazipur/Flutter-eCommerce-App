import 'package:equatable/equatable.dart';

import 'model.dart';

class Cart extends Equatable {
  const Cart();

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

  static List<Product> products = [
    /*const Product(
      name: 'Samsung Universe 9',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/3/thumbnail.jpg',
      price: 1249,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Huawei P30',
      category: 'smartphones',
      imageUrl: 'https://dummyjson.com/image/i/products/5/thumbnail.jpg',
      price: 499,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Microsoft Surface Laptop 4',
      category: 'laptops',
      imageUrl: 'https://dummyjson.com/image/i/products/8/thumbnail.jpg',
      price: 1499,
      isRecommended: false,
      isPopular: true,
    ),*/
    const Product(
      name: 'Perfume Oil',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/11/thumbnail.jpg',
      price: 13,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Brown Perfume',
      category: 'fragrances',
      imageUrl: 'https://dummyjson.com/image/i/products/12/thumbnail.jpg',
      price: 40,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Hyaluronic Acid Serum',
      category: 'skincare',
      imageUrl: 'https://dummyjson.com/image/i/products/16/thumbnail.jpg',
      price: 19,
      isRecommended: false,
      isPopular: true,
    ),
  ];

  @override
  List<Object?> get props => [];
}
