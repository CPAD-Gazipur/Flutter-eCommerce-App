import 'package:equatable/equatable.dart';

import 'model.dart';

class Checkout extends Equatable {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  const Checkout({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
    required this.products,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        address,
        city,
        country,
        zipCode,
        subTotal,
        deliveryFee,
        total,
        products,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};

    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'name': name!,
      'email': email!,
      'customerAddress': customerAddress,
      'products': products!.map((product) => product.name).toList(),
      'subTotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
