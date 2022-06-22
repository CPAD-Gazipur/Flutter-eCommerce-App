import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipController = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFromField(
              controller: emailController,
              context: context,
              labelText: 'Email',
            ),
            _buildTextFromField(
              controller: nameController,
              context: context,
              labelText: 'Full name',
            ),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFromField(
              controller: addressController,
              context: context,
              labelText: 'Full Address',
            ),
            _buildTextFromField(
              controller: cityController,
              context: context,
              labelText: 'City',
            ),
            _buildTextFromField(
              controller: countryController,
              context: context,
              labelText: 'Country',
            ),
            _buildTextFromField(
              controller: zipController,
              context: context,
              labelText: 'Zip Code',
            ),
            Text(
              'ORDER SUMMARY',
              style: Theme.of(context).textTheme.headline3,
            ),
            const OrderSummary(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFromField({
    required TextEditingController controller,
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
              controller: controller,
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
