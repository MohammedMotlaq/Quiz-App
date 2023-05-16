import 'package:flutter/material.dart';

import '../Database/quiz_database.dart';
import '../Models/question_model.dart';

class QuizProvider extends ChangeNotifier{
  List<QuestionModel> questions =[];

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController questionController = TextEditingController();
  TextEditingController answerOneController = TextEditingController();
  TextEditingController answerTwoController = TextEditingController();
  TextEditingController answerThreeController = TextEditingController();
  TextEditingController answerFourController = TextEditingController();
  String correctAnswer = 'A';


  int score = 0 ;
  String selectedAnswer = '0';
  changeSelectedAnswer(String selected){
    selectedAnswer = selected;
    notifyListeners();
  }

  String congrats = '';
  String imagePath = '';
  String subtitle = '';

  changeResultStatus(){
    if (score >= questions.length * 0.75){
      congrats = 'Congratulations!';
      imagePath = 'assets/images/result.jpg';
      subtitle = "You're a superstar!";
    }else if(score >= questions.length * 0.50){
      congrats = 'Congratulations!';
      imagePath = 'assets/images/result.jpg';
      subtitle = "Keep up the good work!";
    }else{
      congrats = 'Oops!';
      imagePath = 'assets/images/fail.png';
      subtitle = "Sorry, better luck next time!";
    }

  }


  insertNewQuestion(){
    QuizDatabase.quizDatabase.insertNewQuestion(
        QuestionModel(
          question: questionController.text,
          answerOne: answerOneController.text,
          answerTwo: answerTwoController.text,
          answerThree: answerThreeController.text,
          answerFour: answerFourController.text,
          correctAnswer: correctAnswer,
        )
    );
    questionController.text = '';
    answerOneController.text = '';
    answerTwoController.text = '';
    answerThreeController.text = '';
    answerFourController.text = '';
    correctAnswer = 'A';

    selectAllQuestions();
  }

  selectAllQuestions()async{
    questions = await QuizDatabase.quizDatabase.selectAllQuestion();
    notifyListeners();
  }

  deleteQuestion (int id){
    QuizDatabase.quizDatabase.deleteQuestion(id);
    selectAllQuestions();
  }



}