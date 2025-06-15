import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/model.dart';

class ApplePay extends StatefulWidget {
  const ApplePay({super.key, required this.products, required this.total});

  final List<Product> products;
  final String total;

  @override
  State<ApplePay> createState() => _ApplePayState();
}

class _ApplePayState extends State<ApplePay> {
  late PaymentConfiguration _paymentConfig;

  late List<PaymentItem> _paymentItems;

  @override
  void initState() {
    super.initState();
    _initializePaymentConfig();

    _initializePaymentList();
  }

  Future<void> _initializePaymentConfig() async {
    _paymentConfig = await PaymentConfiguration.fromAsset(
      'default_payment_profile_apple_pay.json',
    );
  }

  void _initializePaymentList() {
    _paymentItems = widget.products
        .map((product) => PaymentItem(
              amount: product.price.toString(),
              label: product.name,
              type: PaymentItemType.item,
              status: PaymentItemStatus.final_price,
            ))
        .toList();

    _paymentItems.add(
      PaymentItem(
        amount: widget.total,
        label: 'Total',
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  void _onPaymentResult(Map<String, dynamic>? paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ApplePayButton(
        onPaymentResult: _onPaymentResult,
        paymentItems: _paymentItems,
        style: ApplePayButtonStyle.white,
        type: ApplePayButtonType.inStore,
        margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        paymentConfiguration: _paymentConfig,
      ),
    );
  }
}
