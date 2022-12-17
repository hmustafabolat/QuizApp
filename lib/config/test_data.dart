import 'package:bilgi_yarismasi/view/score_page.dart';
import 'package:bilgi_yarismasi/main.dart';
import 'package:flutter/cupertino.dart';
import '../model/question_model.dart';

class QuestionData {
  int _questionIndex = 0;
  List<QuestionModel> questionBank = [
    QuestionModel(
        questionText:
            "Havaya atılan bir madeni paranın tura gelme ihtimali 1/2'dir.",
        questionAnswer: true),
    QuestionModel(
        questionText: "Q klavyede Q harfinin sağ yanında W harfi vardır",
        questionAnswer: true),
    QuestionModel(questionText: "-2 çift sayıdır.", questionAnswer: true),
    QuestionModel(
        questionText: "Muğla Marmara bölgesi'ndedir.", questionAnswer: false),
    QuestionModel(
        questionText: "Türkiye, Birleşmiş Milletler üyesidir.",
        questionAnswer: true),
    QuestionModel(questionText: "ABD, NATO üyesidir.", questionAnswer: true),
    QuestionModel(
        questionText: "12 Eylül darbesi 1982 yılında gerçekleşmiştir.",
        questionAnswer: false),
    QuestionModel(
        questionText: "Bursa, Marmara Bölgesi'ndedir.", questionAnswer: true),
    QuestionModel(
        questionText: "Bütün rakamların çarpımı 0'dır.", questionAnswer: true),
    QuestionModel(questionText: "Flört kelimesi 1 hecelidir.", questionAnswer: true),
    QuestionModel(
        questionText: "Noktainazar trafik polisi anlamına gelen bir kelimedir.",
        questionAnswer: false),
    QuestionModel(
        questionText: "Hakkari, güneydoğu anadolu bölgesi'ndedir.",
        questionAnswer: false),
    QuestionModel(
        questionText: "Kuzey İrlanda Birleşik Krallık'a bağlıdır.",
        questionAnswer: true),
    QuestionModel(
        questionText: "Trakya 3 heceli bir kelimedir.", questionAnswer: false),
    QuestionModel(
        questionText: "Kadınlarda 23, erkeklerde 46 kromozom bulunur.",
        questionAnswer: false),
    QuestionModel(
        questionText:
            "İtalya'da Bir Türk Sevdim romanındaki Türk'ün adı Mehmet'tir.",
        questionAnswer: true),
    QuestionModel(
        questionText: "Balonla Beş Hafta kitabında gezilen kıta Asya'dır.",
        questionAnswer: false),
    QuestionModel(
        questionText: "Uruguay'ın resmi adı Uruguay Doğu Cumhuriyeti'dir.",
        questionAnswer: true),
    QuestionModel(
        questionText:
            "Su deniz seviyesinde 100 derecenin altında buharlaşabilir.",
        questionAnswer: true),
    QuestionModel(
        questionText: "Karbonatın yapısında karbon bulunmaz",
        questionAnswer: false),
  ];

  String getQuestionText() {
    return questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return questionBank[_questionIndex].questionAnswer;
  }

  nextQuestion() {
    if (_questionIndex != questionBank.length - 1) {
      _questionIndex++;
    }
  }

  bool? quizFinished() {
    if (_questionIndex == questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void quizReset() {
    _questionIndex = 0;
  }
}
