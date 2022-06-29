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

  const CheckoutScreen({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.headline3,
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  },
                  context: context,
                  labelText: 'Email',
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(name: value));
                  },
                  context: context,
                  labelText: 'Full name',
                ),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.headline3,
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  },
                  context: context,
                  labelText: 'Full Address',
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  },
                  context: context,
                  labelText: 'City',
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  },
                  context: context,
                  labelText: 'Country',
                ),
                _buildTextFromField(
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  },
                  context: context,
                  labelText: 'Zip Code',
                ),
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.headline3,
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

  Widget _buildTextFromField({
    Function(String)? onChanged,
    required BuildContext context,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
