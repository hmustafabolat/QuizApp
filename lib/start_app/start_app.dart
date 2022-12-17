import 'package:bilgi_yarismasi/repository/auth_repository.dart';
import 'package:bilgi_yarismasi/service/auth_service.dart';
import 'package:get/get.dart';

import '../viewmodel/auth_viewmodel.dart';

class StartApp {
  static setupLocator() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
