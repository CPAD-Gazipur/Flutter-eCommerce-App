import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/blocs.dart';
import 'package:flutter_ecommerce_app/models/model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:pay/pay.dart';

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
                      style: GooglePayButtonStyle.black,
                      type: GooglePayButtonType.pay,
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
                style: ElevatedButton.styleFrom(primary: Colors.black),
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
