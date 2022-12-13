import 'package:bilgi_yarismasi/lastPage.dart';
import 'package:bilgi_yarismasi/main.dart';
import 'package:bilgi_yarismasi/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'constants.dart';
import 'questionClass.dart';
import 'test_data.dart';

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
                title: const Text("Bravo Testi Geçtiniz"),
                actions: <Widget>[
                  ElevatedButton(
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
        width: 0.7.sw,
        height: 0.5.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).w,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink,
              Colors.purple,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40).r,
              child: Center(
                child: Container(
                  height: 0.4.sh,
                  child: Text(
                    test_1.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Prompt"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                //Wrap: Taşmaları önlemek amacıyla kullanılır. Taşacak olan widget'ı bir alt satıra indirir.
                spacing: 3,
                runSpacing: 3,
                children: answer,
              ),
            ),
            Column(
              children: [
                Text(
                  "Score",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Prompt"),
                ),
                Text(
                  "$score",
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, fontFamily: "Prompt"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
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
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Padding(
                      padding: EdgeInsets.all(12),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(28, 28, 28, 1),
          title: Text(
            "Sorular",
            style: TextStyle(fontFamily: "Prompt"),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(28, 28, 28, 1),
        body: _buildBody());
  }
}
