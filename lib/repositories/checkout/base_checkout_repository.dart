import 'package:flutter_ecommerce_app/models/model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
