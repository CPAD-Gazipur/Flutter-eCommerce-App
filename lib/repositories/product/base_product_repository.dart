import 'package:flutter_ecommerce_app/models/model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
