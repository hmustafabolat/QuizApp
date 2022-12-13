import 'package:bilgi_yarismasi/category_page.dart';
import 'package:bilgi_yarismasi/login_Page.dart';
import 'package:bilgi_yarismasi/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'StartPage.dart';
import 'firebase_options.dart';
import 'questionsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UserLoginPage(),
        );
      },
    );
  }
}

