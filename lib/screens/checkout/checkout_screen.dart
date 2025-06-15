import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

import '../../bloc/blocs.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: const OrderNowNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CheckoutLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  },
                  context: context,
                  title: 'Email',
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(name: value));
                  },
                  context: context,
                  title: 'Full name',
                ),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  },
                  context: context,
                  title: 'Full Address',
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  },
                  context: context,
                  title: 'City',
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  },
                  context: context,
                  title: 'Country',
                ),
                CustomTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  },
                  context: context,
                  title: 'Zip Code',
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        child: Text(
                          'SELECT PAYMENT METHOD',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment-selection');
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment-selection');
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const OrderSummary(),
              ],
            );
          } else {
            return const Center(
              child: Text('Something went wrong...'),
            );
          }
        }),
      ),
    );
  }
}
