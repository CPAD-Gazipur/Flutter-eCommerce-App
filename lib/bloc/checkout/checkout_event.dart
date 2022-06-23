part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final Cart? cart;

  const UpdateCheckout({
    this.name,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.subTotal,
    this.deliveryFee,
    this.total,
    this.cart,
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
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
