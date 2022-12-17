import 'package:bilgi_yarismasi/view/questions_page.dart';
import 'package:bilgi_yarismasi/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 94, 23, 1),
      body: Stack(
        children: [
          ListView(
            children: [
              CircleAvatarWidget(),
              ElevatedButtonSizedBox(),
            ],
          ),
          IconButton(
            onPressed: () async {
              await _viewModel.signOut();
            },
            icon: Icon(Icons.backspace),
          )
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
            child: InkWellButton(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: InkWellButton(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: InkWellButton(),
          ),
          //SizedBox(height: 0.1.sh,),
          Expanded(
            child: InkWellButton(),
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
    final circleAvatarImage =
        "https://banner2.cleanpng.com/20180418/xqw/kisspng-avatar-computer-icons-business-business-woman-5ad736ba3f2735.7973320115240536902587.jpg";
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

class InkWellButton extends StatelessWidget {
  const InkWellButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20).h,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SoruSayfasi(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20).w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20).w)),
          child: Padding(
            padding: EdgeInsets.all(10).w,
            child: Center(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lesson",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.black),
                    ))),
          ),
        ),
      ),
    );
  }
}
