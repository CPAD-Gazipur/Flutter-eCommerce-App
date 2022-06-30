import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs.dart';
import '../models/model.dart';
import 'widgets.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                )),
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddWishListProduct(product));
                    var snackBar = SnackBar(
                      content: const Text('Added To Your WishList'),
                      action: SnackBarAction(
                          label: 'Wishlist',
                          onPressed: () {
                            Navigator.pushNamed(context, '/wishlist');
                          }),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ));
            }),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddProductToCart(product));
                    var snackBar = SnackBar(
                      content: const Text('Added To Cart'),
                      action: SnackBarAction(
                          label: 'CartList',
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          }),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.headline3,
                  ));
            })
          ],
        ),
      ),
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context).textTheme.headline3,
                ))
          ],
        ),
      ),
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is CheckoutLoaded) {
                if (Platform.isAndroid) {
                  switch (state.paymentMethod) {
                    case PaymentMethod.googlePay:
                      return GooglePay(
                        products: state.products!,
                        total: state.total!,
                      );
                    case PaymentMethod.creditCard:
                      return Container(
                        child: Text(
                          'Pay with Credit Card',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                      );
                    default:
                      return GooglePay(
                        products: state.products!,
                        total: state.total!,
                      );
                  }
                }
                if (Platform.isIOS) {
                  switch (state.paymentMethod) {
                    case PaymentMethod.applePay:
                      return ApplePay(
                        products: state.products!,
                        total: state.total!,
                      );
                    case PaymentMethod.creditCard:
                      return Container();
                    default:
                      return ApplePay(
                        products: state.products!,
                        total: state.total!,
                      );
                  }
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(ConfirmCheckout(checkout: state.checkout));

                        Navigator.pushNamed(context, '/payment-selection');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: Text(
                        'CHOOSE PAYMENT',
                        style: Theme.of(context).textTheme.headline3,
                      ));
                }
              } else {
                return const Center(
                  child: Text('Something went wrong...'),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

class BackToShoppingNavBar extends StatelessWidget {
  const BackToShoppingNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                'BACK TO SHOPPING',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
