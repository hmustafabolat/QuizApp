import 'package:bilgi_yarismasi/StartPage.dart';
import 'package:bilgi_yarismasi/questionsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
      body: ListView(
        children: [
          CircleAvatarWidget(),
          ElevatedButtonSizedBox(),
        ],
      ),
    );
  }
}

class ElevatedButtonSizedBox extends StatelessWidget {
  const ElevatedButtonSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8.sh,
      child: Column(
        children: [
          Expanded(
            child: ElevatedButtonWidget(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: ElevatedButtonWidget(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: ElevatedButtonWidget(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: ElevatedButtonWidget(),
          ),
        ],
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circleAvatarImage = "https://banner2.cleanpng.com/20180418/xqw/kisspng-avatar-computer-icons-business-business-woman-5ad736ba3f2735.7973320115240536902587.jpg";
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(circleAvatarImage),
              ),
              SizedBox(
                width: 0.03.sw,
              ),
              Text(
                "HMB",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, Colors.purple]),
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SoruSayfasi()));
          },
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lesson Name",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
