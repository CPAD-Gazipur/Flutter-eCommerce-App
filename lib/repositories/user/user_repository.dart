import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/model.dart';
import '../repositories.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Stream<User> getUser(String userID) {
    debugPrint('Getting userInfo from firebase firestore...');
    return _firebaseFirestore
        .collection('users')
        .doc(userID)
        .snapshots()
        .map((userDoc) => User.fromSnapshot(userDoc));
  }

  @override
  Future<void> updateUser(User user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => debugPrint('User data updated...'));
  }
}
