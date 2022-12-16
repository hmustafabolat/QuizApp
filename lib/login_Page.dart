import 'package:bilgi_yarismasi/category_page.dart';
import 'package:bilgi_yarismasi/register_page.dart';
import 'package:bilgi_yarismasi/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        emailTextField(),
                        buildSizedBox(),
                        passwordTextField(),
                        buildSizedBox(),
                        inkWell(context),
                        buildSizedBox(),
                        buildInkWell(context),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 0.05.sh,
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
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

  InkWell inkWell(BuildContext context) {
    return InkWell(
      onTap: () {
        _authService
            .signIn(_emailController.text, _passwordController.text)
            .then((value) {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => CategoryPage()));
        });
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

  TextField passwordTextField() {
    return TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        controller: _passwordController,
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

  TextField emailTextField() {
    return TextField(
        controller: _emailController,
        style: TextStyle(
          color: Colors.black,
        ),
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
