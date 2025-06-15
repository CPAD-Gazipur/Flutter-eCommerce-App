import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/blocs.dart';
import 'package:flutter_ecommerce_app/models/model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:pay/pay.dart';

class PaymentSelectionScreen extends StatefulWidget {
  static const String routeName = '/payment-selection';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PaymentSelectionScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const PaymentSelectionScreen({super.key});

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  late PaymentConfiguration _paymentConfig;

  @override
  void initState() {
    super.initState();
    _initializePaymentConfig();
  }

  Future<void> _initializePaymentConfig() async {
    _paymentConfig = await PaymentConfiguration.fromAsset(
      'default_payment_profile_google_pay.json',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'PAYMENT SELECTION'),
      bottomNavigationBar: const HomeNavBar(),
      body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
        if (state is PaymentLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is PaymentLoaded) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            children: [
              Platform.isIOS
                  ? RawApplePayButton(
                      onPressed: () {
                        debugPrint('Apple Pay Click');
                        context.read<PaymentBloc>().add(
                              const SelectPaymentMethod(
                                paymentMethod: PaymentMethod.applePay,
                              ),
                            );
                        Navigator.pop(context);
                      },
                      style: ApplePayButtonStyle.black,
                      type: ApplePayButtonType.inStore,
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              Platform.isAndroid
                  ? RawGooglePayButton(
                      onPressed: () {
                        debugPrint('Google Pay Click');
                        context.read<PaymentBloc>().add(
                              const SelectPaymentMethod(
                                paymentMethod: PaymentMethod.googlePay,
                              ),
                            );
                        Navigator.pop(context);
                      },
                      theme: GooglePayButtonTheme.dark,
                      type: GooglePayButtonType.pay,
                      paymentConfiguration: _paymentConfig,
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<PaymentBloc>().add(
                        const SelectPaymentMethod(
                          paymentMethod: PaymentMethod.creditCard,
                        ),
                      );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text('Pay with CreditCard'),
              ),
            ],
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
