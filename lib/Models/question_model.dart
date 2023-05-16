import 'package:quiz_app/Database/quiz_database.dart';

class QuestionModel{

  int? id;
  late String question;
  late String answerOne;
  late String answerTwo;
  late String answerThree;
  late String answerFour;
  late String correctAnswer;

  QuestionModel({
    required this.question,
    required this.answerOne,
    required this.answerTwo,
    required this.answerThree,
    required this.answerFour,
    required this.correctAnswer,
  });

  QuestionModel.fromMap(Map<String,dynamic> map){
    id = map[QuizDatabase.quizID];
    question = map[QuizDatabase.question];
    answerOne = map[QuizDatabase.answerOne];
    answerTwo = map[QuizDatabase.answerTwo];
    answerThree = map[QuizDatabase.answerThree];
    answerFour = map[QuizDatabase.answerFour];
    correctAnswer = map[QuizDatabase.correctAnswer];
  }

  Map<String, dynamic> toMap(){
    return {
      QuizDatabase.quizID: id,
      QuizDatabase.question: question,
      QuizDatabase.answerOne: answerOne,
      QuizDatabase.answerTwo: answerTwo,
      QuizDatabase.answerThree: answerThree,
      QuizDatabase.answerFour: answerFour,
      QuizDatabase.correctAnswer: correctAnswer,
    };
  }



}