import 'package:bilgi_yarismasi/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'questionsPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double profileHeight = 100;
    final double containerHeight = 140;
    final bottom = containerHeight - profileHeight / 3;
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextWelcomeText(),
            buildStack(screenHeight, screenWidth, containerHeight, bottom,
                profileHeight),
            backgroundImage(screenHeight: screenHeight),
            SizedBox(
              height: screenHeight / 10,
            ),
            buildRowStartButton(context, screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Text buildTextWelcomeText() {
    return Text(
      "Hoşgeldiniz",
      style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontFamily: "Prompt"),
    );
  }

  Stack buildStack(double screenHeight, double screenWidth,
      double containerHeight, double bottom, double profileHeight) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildPaddingContainerInfo(screenHeight, screenWidth, containerHeight),
        buildPositionedCircleAvatar(bottom, profileHeight),
      ],
    );
  }

  Padding buildPaddingContainerInfo(
      double screenHeight, double screenWidth, double containerHeight) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenHeight / 20,
          left: screenWidth / 30,
          right: screenWidth / 30),
      child: Container(
        height: 0.15.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.isPhone ? 15.h : 25.h, bottom: 10.h),
              child:  Text(
                "HMB",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Prompt",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Kullanıcı",
                        style: TextStyle(
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "Rs.111",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth / 6,
                  ),
                  Column(
                    children: [
                      Text(
                        "Seviye",
                        style: TextStyle(
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth / 6,
                  ),
                  Column(
                    children: [
                      Text(
                        "Can",
                        style: TextStyle(
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "03",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildPositionedCircleAvatar(double bottom, double profileHeight) {
    return Positioned(
      bottom: 75.h,
      child: CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/man1.png")),
    );
  }

  Row buildRowStartButton(
      BuildContext context, double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.pink,
              ]),
              borderRadius: BorderRadius.circular(25),
              boxShadow: <BoxShadow>[
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 25),
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
                          vertical: screenWidth / 25,
                          horizontal: screenHeight / 30),
                      child: Text(
                        "Quiz Başlat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Prompt"),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight / 40),
      child: Image.asset("assets/images/bg.png"),
    );
  }
}
