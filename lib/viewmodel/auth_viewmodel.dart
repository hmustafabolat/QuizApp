import 'package:bilgi_yarismasi/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  Rx<UserModel> userModel = UserModel().obs;

  @override
  onInit() async {
    super.onInit();

    await currentUser();
  }

  Future<UserModel?> signIn(UserModel user) async {
    userModel.value = (await _repository.signIn(user))!;
  }

  Future signUp(UserModel user) async {
    await _repository.signUp(user);
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
