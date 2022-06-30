import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/model.dart';

class ApplePay extends StatelessWidget {
  final List<Product> products;
  final String total;
  const ApplePay({Key? key, required this.products, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paymentItems = products
        .map(
          (product) => PaymentItem(
            amount: product.price.toString(),
            label: product.name,
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price,
          ),
        )
        .toList();

    paymentItems.add(
      PaymentItem(
        amount: total,
        label: 'Total',
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    );

    void onApplePaymentResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ApplePayButton(
        paymentConfigurationAsset: 'default_payment_profile_apple_pay.json',
        onPaymentResult: onApplePaymentResult,
        paymentItems: paymentItems,
        style: ApplePayButtonStyle.white,
        type: ApplePayButtonType.inStore,
        margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
