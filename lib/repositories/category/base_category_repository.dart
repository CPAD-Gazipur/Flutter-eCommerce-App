import '../../models/model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
