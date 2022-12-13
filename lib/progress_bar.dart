import 'dart:async';
import 'package:bilgi_yarismasi/test_data.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressBar extends StatefulWidget {
  final Widget dialogButton;
  const ProgressBar({Key? key, required this.dialogButton}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late int totalDuration = 20;
  int currentDuration = 0;
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
                title: const Text("Bravo Testi Geçtiniz"),
                actions: <Widget>[
                  widget.dialogButton,

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
        selectedColor: Colors.purple,
        unselectedColor: Colors.pink,
        roundedEdges: Radius.circular(30),

        selectedGradientColor: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.pink],
        ),
        unselectedGradientColor: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromRGBO(28, 28, 28, 1), Color.fromRGBO(28, 28, 28, 1),],
        ),
      ),
    );
  }
}
