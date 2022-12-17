import 'package:bilgi_yarismasi/view/category_page.dart';
import 'package:bilgi_yarismasi/view/login_page.dart';
import 'package:bilgi_yarismasi/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    print(_viewModel.userModel.value.toJson());
    return Obx(() {
      return (_viewModel.userModel.value.id != null)
          ? CategoryPage()
          : UserLoginPage();
    });
  }
}
