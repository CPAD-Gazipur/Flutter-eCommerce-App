import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/model.dart';
import '../repositories.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map(
          (category) => category.docs
              .map((values) => Category.fromSnapshot(values))
              .toList(),
        );
  }
}
