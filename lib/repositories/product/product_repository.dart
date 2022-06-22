import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/model.dart';
import '../repositories.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
          (products) => products.docs
              .map((values) => Product.fromSnapshot(values))
              .toList(),
        );
  }
}
