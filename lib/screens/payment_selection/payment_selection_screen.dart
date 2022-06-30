import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:pay/pay.dart';
import 'package:flutter/foundation.dart';

class PaymentSelectionScreen extends StatelessWidget {
  static const String routeName = '/payment-selection';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PaymentSelectionScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const PaymentSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'PAYMENT SELECTION'),
      bottomNavigationBar: const HomeNavBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        children: [
          defaultTargetPlatform == TargetPlatform.iOS
              ? RawApplePayButton(
                  onPressed: () {
                    debugPrint('App Pay Click');
                  },
                  style: ApplePayButtonStyle.black,
                  type: ApplePayButtonType.inStore,
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          RawGooglePayButton(
            onPressed: () {
              debugPrint('Google Pay Click');
            },
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
          ),
        ],
      ),
    );
  }
}
