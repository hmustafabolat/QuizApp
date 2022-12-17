import 'package:bilgi_yarismasi/view/category_page.dart';
import 'package:bilgi_yarismasi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'questions_page.dart';

class LastPage extends StatefulWidget {
  final int score;
  final int correctAnswer;
  final int wrongAnswer;
  const LastPage(
      {Key? key,
      required this.score,
      required this.correctAnswer,
      required this.wrongAnswer})
      : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(243, 94, 23, 1),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score",
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                    fontFamily: "FredokaOne"),
              ),
              Text(
                widget.score.toString(),
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                    fontFamily: "FredokaOne"),
              ),
              Padding(
                padding: EdgeInsets.all(20).w,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15).w,
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(10).w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Doğru Cevap",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "FredokaOne"),
                              ),
                              Text(
                                widget.correctAnswer.toString(),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "FredokaOne"),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Yanlış Cevap",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "FredokaOne"),
                              ),
                              Text(
                                widget.wrongAnswer.toString(),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "FredokaOne"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.01).r,
                child: Image.asset(
                  "assets/images/bgimage.png",
                  width: 0.4.sw,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25).w,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.57),
                              blurRadius: 25),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryPage()));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)
                                    .r,
                                child: Text(
                                  "Ana Sayfaya Dön",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: "Prompt"),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 0.05.sw,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25).w,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.57),
                              blurRadius: 25),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SoruSayfasi()));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20)
                                    .r,
                                child: Text(
                                  "Tekrar Oyna",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Prompt"),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
