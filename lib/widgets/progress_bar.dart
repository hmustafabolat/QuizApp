import 'dart:async';
import 'package:bilgi_yarismasi/config/test_data.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../view/score_page.dart';

class ProgressBar extends StatefulWidget {
  final Widget dialogButton;
  const ProgressBar({Key? key, required this.dialogButton}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late int totalDuration = 5;
  int currentDuration = 0;
  List<Widget> answer = [];
  int score = 0;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  QuestionData test_1 = QuestionData();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (currentDuration == totalDuration) {
        timer.cancel();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromRGBO(243, 94, 23, 1),
                title: Text(
                  "Bravo Testi Geçtiniz",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Sıralamamı Gör"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
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
                  ),
                ],
              );
            });
      } else {
        setState(() {
          currentDuration++;
        });
      }
    });
    super.initState();
    test_1.quizFinished();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StepProgressIndicator(
        totalSteps: totalDuration,
        currentStep: currentDuration,
        size: 20,
        padding: 0,
        selectedColor: Colors.white,
        unselectedColor: Colors.white,
        roundedEdges: Radius.circular(30),
        selectedGradientColor: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.white],
        ),
        unselectedGradientColor: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(243, 94, 23, 1),
            Color.fromRGBO(243, 94, 23, 1),
          ],
        ),
      ),
    );
  }
}
