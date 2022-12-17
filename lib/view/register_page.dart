import 'package:bilgi_yarismasi/view/category_page.dart';
import 'package:bilgi_yarismasi/view/login_Page.dart';
import 'package:bilgi_yarismasi/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(243, 94, 23, 1),
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0).w,
                  child: Container(
                    height: 0.7.sh,
                    width: 5.sw,
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
                      padding: EdgeInsets.all(10).w,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                                controller: _nameController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Kullanıcı adı',
                                  prefixText: ' ',
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                )),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            TextField(
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
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                )),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            TextField(
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
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                )),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                controller: _passwordAgainController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Parola Tekrar',
                                  prefixText: ' ',
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                )),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            InkWell(
                              onTap: () {
                                _authService
                                    .createPerson(
                                        _nameController.text,
                                        _emailController.text,
                                        _passwordController.text)
                                    .then((value) {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryPage()));
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5).r,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(243, 94, 23, 1),
                                    ),
                                    color: Color.fromRGBO(243, 94, 23, 1),

                                    //color: colorPrimaryShade,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))
                                            .w),
                                child: Padding(
                                  padding: EdgeInsets.all(4).w,
                                  child: Center(
                                      child: Text(
                                    "Kayıt Ol",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30).r,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      Text(
                        "Kayıt ol",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
