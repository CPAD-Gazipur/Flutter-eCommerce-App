import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

import '../../bloc/blocs.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const GoToCheckoutNavBar(),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is CartLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: const RoundedRectangleBorder(),
                              elevation: 0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: state.cart
                            .productQuantity(state.cart.products)
                            .keys
                            .length,
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            product: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .elementAt(index),
                            quantity: state.cart
                                .productQuantity(state.cart.products)
                                .values
                                .elementAt(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const OrderSummary(),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      }),
    );
  }
}
