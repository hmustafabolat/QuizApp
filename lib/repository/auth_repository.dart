import 'package:bilgi_yarismasi/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class AuthRepository {
  final AuthService _service = Get.find();

  Future<UserModel?> signIn(UserModel userModel) async {
    return await _service.signIn(userModel);
  }

  Future<UserModel?> signUp(UserModel userModel) async {
    return await _service.signUp(userModel);
  }

  Future<UserModel?> signOut() async {
    return await _service.signOut();
  }

  currentUser() async {
    return await _service.currentUser();
  }
}
