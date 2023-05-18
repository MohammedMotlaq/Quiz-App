import 'dart:developer';
import 'package:path/path.dart';
import 'package:quiz_app/Models/question_model.dart';
import 'package:sqflite/sqflite.dart';

class QuizDatabase{
  static QuizDatabase quizDatabase = QuizDatabase();
  QuizDatabase(){
    initDatabase();
  }

  static const String tableName = 'quizTable';
  static const String quizID = 'id';
  static const String question = 'question';
  static const String answerOne = 'answerOne';
  static const String answerTwo = 'answerTwo';
  static const String answerThree = 'answerThree';
  static const String answerFour = 'answerFour';
  static const String correctAnswer = 'correctAnswer';

  Database? database;

  List<QuestionModel> questions = [];

  initDatabase ()async{
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase()async{
    log("on createConnectionWithDatabase");
    String databasePath = await getDatabasesPath();
    String databaseName = 'QuizDatabase';
    String fullPath = join(databasePath,databaseName);

    Database database = await openDatabase(fullPath,version: 1,onCreate: (db,i) async{
      log('in onCreate function');
      await db.execute(
        '''
          CREATE TABLE $tableName(
            $quizID INTEGER PRIMARY KEY AUTOINCREMENT,
            $question TEXT,
            $answerOne TEXT,
            $answerTwo TEXT,
            $answerThree TEXT,
            $answerFour TEXT,
            $correctAnswer TEXT
          )
        '''
      );
      log('Database Created');
    },onOpen: (db){log('Database Opened');});
    return database;
  }

  insertNewQuestion (QuestionModel questionModel)async{
    int rowIndex = await database!.insert(tableName, questionModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<QuestionModel>> selectAllQuestion()async{
    List<Map<String,Object?>> rowsAsMap = await database!.query(tableName);
    questions = rowsAsMap.map((e) => QuestionModel.fromMap(e)).toList();
    return questions;
  }

  deleteQuestion(int id){
    database!.delete(tableName,where: '$quizID=?',whereArgs: [id]);
  }

}