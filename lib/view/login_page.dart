import 'package:bilgi_yarismasi/view/category_page.dart';
import 'package:bilgi_yarismasi/view/register_page.dart';
import 'package:bilgi_yarismasi/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _globalKey = GlobalKey<FormState>();
  String? email, password;

  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(243, 94, 23, 1),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0).r,
              child: Container(
                height: 0.6.sh,
                width: 0.8.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)).w,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(20.0).w,
                  child: Center(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _emailTextField(),
                          _passwordTextField(),
                          _signInButton(),
                          _goRegisterPageButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  InkWell _goRegisterPageButton() {
    return InkWell(
      onTap: () {
        Get.to(() => RegisterPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 0.002.sh,
            width: 0.2.sw,
            color: Colors.black,
          ),
          Text(
            "Kayıt ol",
            style: TextStyle(color: Colors.black),
          ),
          Container(
            height: 0.002.sh,
            width: 0.2.sw,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  InkWell _signInButton() {
    return InkWell(
      onTap: () async {
        if(_globalKey.currentState!.validate()){
          _globalKey.currentState!.save();

          UserModel userModel = UserModel(email: email, password: password);

          await _viewModel.signIn(userModel);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Color.fromRGBO(243, 94, 23, 1),
            border:
                Border.all(color: Color.fromRGBO(243, 94, 23, 0.1), width: 5),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            "Giriş yap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }

  TextFormField _passwordTextField() {
    return TextFormField(
        style: TextStyle(
          color: Colors.black,
        ),
        onSaved: (value){
          password = value;
        },
        cursorColor: Colors.black,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          hintText: 'Parola',
          prefixText: ' ',
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
        ));
  }

  TextFormField _emailTextField() {
    return TextFormField(
        style: TextStyle(
          color: Colors.black,
        ),
        onSaved: (value){
          email = value;
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          hintText: 'E-Mail',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.black, letterSpacing: 1),
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
        ));
  }
}
