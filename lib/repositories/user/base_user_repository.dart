import '../../models/model.dart';

abstract class BaseUserRepository {
  Stream<User> getUser(String userID);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}
