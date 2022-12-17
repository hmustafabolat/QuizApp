import 'package:bilgi_yarismasi/view/score_page.dart';
import 'package:bilgi_yarismasi/main.dart';
import 'package:bilgi_yarismasi/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../config/icon_const.dart';
import '../model/question_model.dart';
import '../config/test_data.dart';

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> answer = [];
  QuestionData test_1 = QuestionData();
  int score = 0;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  @override
  void initState() {
    super.initState();
    test_1.questionBank.shuffle();
  }

  buttonFunction(bool choiseButton) {
    bool falseAnswer = test_1.getQuestionAnswer();
    setState(() {
      if (falseAnswer == choiseButton) {
        answer.add(kTrueAnswer);
        correctAnswer++;
        score = score + 5;
      } else {
        answer.add(kFalseAnswer);
        wrongAnswer++;
      }

      test_1.nextQuestion();

      if (answer.length == test_1.questionBank.length) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Bravo Geçtiniz"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Sıralamanı Gör"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(243, 94, 23, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        answer = [];
                        test_1.quizReset();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LastPage(
                            score: score,
                            correctAnswer: correctAnswer,
                            wrongAnswer: wrongAnswer,
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            });
      }
    });
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        ProgressBar(
          dialogButton: ElevatedButton(
            onPressed: () {
              setState(() {
                answer = [];
                test_1.quizReset();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LastPage(
                    score: score,
                    correctAnswer: correctAnswer,
                    wrongAnswer: wrongAnswer,
                  ),
                ),
              );
            },
            child: Text("Son Sayfaya Git"),
          ),
        ),
        const Expanded(child: SizedBox()),
        _buildQuestionCard(),
        const Expanded(child: SizedBox()),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _buildQuestionCard() {
    return Center(
      child: Container(
        width: 0.8.sw,
        height: 0.65.sh,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).w, color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100).r,
              child: Center(
                child: Container(
                  height: 0.1.sh,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      test_1.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Prompt"),
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              //Wrap: Taşmaları önlemek amacıyla kullanılır. Taşacak olan widget'ı bir alt satıra indirir.
              spacing: 3,
              runSpacing: 3,
              children: answer,
            ),
            Column(
              children: [
                Text(
                  "Score",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontFamily: "Prompt"),
                ),
                Text(
                  "$score",
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.black,
                      fontFamily: "Prompt"),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7).r,
                        child: Padding(
                          padding: EdgeInsets.all(12).w,
                          child: ElevatedButton(
                            onPressed: () {
                              buttonFunction(true);
                            },
                            child: Icon(Icons.thumb_up),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6).r,
                        child: Padding(
                          padding: EdgeInsets.all(12).w,
                          child: ElevatedButton(
                            onPressed: () {
                              buttonFunction(false);
                            },
                            child: Icon(Icons.thumb_down),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(243, 94, 23, 1),
            title: Text(
              "Sorular",
              style: TextStyle(fontFamily: "Prompt"),
            ),
            centerTitle: true,
          ),
          backgroundColor: Color.fromRGBO(243, 94, 23, 1),
          body: _buildBody()),
    );
  }
}
