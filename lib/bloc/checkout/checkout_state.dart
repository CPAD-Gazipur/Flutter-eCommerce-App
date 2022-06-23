part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final Checkout checkout;

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

  CheckoutLoaded(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.subTotal,
      this.deliveryFee,
      this.total,
      this.products})
      : checkout = Checkout(
          name: name,
          email: email,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          subTotal: subTotal,
          deliveryFee: deliveryFee,
          total: total,
          products: products,
        );

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
}
