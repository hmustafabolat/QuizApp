import 'package:bilgi_yarismasi/lastPage.dart';
import 'package:bilgi_yarismasi/main.dart';
import 'package:flutter/cupertino.dart';
import 'questionClass.dart';

class QuestionData {
  int _questionIndex = 0;
  List<Question> questionBank = [
    Question(
        questionText:
            "Havaya atılan bir madeni paranın tura gelme ihtimali 1/2'dir.",
        questionAnswer: true),
    Question(
        questionText: "Q klavyede Q harfinin sağ yanında W harfi vardır",
        questionAnswer: true),
    Question(questionText: "-2 çift sayıdır.", questionAnswer: true),
    Question(
        questionText: "Muğla Marmara bölgesi'ndedir.", questionAnswer: false),
    Question(
        questionText: "Türkiye, Birleşmiş Milletler üyesidir.",
        questionAnswer: true),
    Question(questionText: "ABD, NATO üyesidir.", questionAnswer: true),
    Question(
        questionText: "12 Eylül darbesi 1982 yılında gerçekleşmiştir.",
        questionAnswer: false),
    Question(
        questionText: "Bursa, Marmara Bölgesi'ndedir.", questionAnswer: true),
    Question(
        questionText: "Bütün rakamların çarpımı 0'dır.", questionAnswer: true),
    Question(questionText: "Flört kelimesi 1 hecelidir.", questionAnswer: true),
    Question(
        questionText: "Noktainazar trafik polisi anlamına gelen bir kelimedir.",
        questionAnswer: false),
    Question(
        questionText: "Hakkari, güneydoğu anadolu bölgesi'ndedir.",
        questionAnswer: false),
    Question(
        questionText: "Kuzey İrlanda Birleşik Krallık'a bağlıdır.",
        questionAnswer: true),
    Question(
        questionText: "Trakya 3 heceli bir kelimedir.", questionAnswer: false),
    Question(
        questionText: "Kadınlarda 23, erkeklerde 46 kromozom bulunur.",
        questionAnswer: false),
    Question(
        questionText:
            "İtalya'da Bir Türk Sevdim romanındaki Türk'ün adı Mehmet'tir.",
        questionAnswer: true),
    Question(
        questionText: "Balonla Beş Hafta kitabında gezilen kıta Asya'dır.",
        questionAnswer: false),
    Question(
        questionText: "Uruguay'ın resmi adı Uruguay Doğu Cumhuriyeti'dir.",
        questionAnswer: true),
    Question(
        questionText:
            "Su deniz seviyesinde 100 derecenin altında buharlaşabilir.",
        questionAnswer: true),
    Question(
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
