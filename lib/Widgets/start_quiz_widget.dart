import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';

import '../Models/question_model.dart';

class StartQuizWidget extends StatefulWidget {
  const StartQuizWidget({Key? key,required this.questionModel}) : super(key: key);
  final QuestionModel questionModel;
  @override
  State<StartQuizWidget> createState() => _StartQuizWidgetState();
}

class _StartQuizWidgetState extends State<StartQuizWidget> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context,quizProvider,child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 377.w,
                //height: 40.h,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: Text(
                  widget.questionModel.question,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              GestureDetector(
                onTap:(){
                  quizProvider.changeSelectedAnswer('A');
                },
                child: Container(
                  width: 377.w,
                  //height: 40.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: quizProvider.selectedAnswer == 'A' ? Colors.green.shade100 : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border:Border.all(
                          color: Colors.teal,
                          width: 2
                      )
                  ),
                  child: Text(
                    widget.questionModel.answerOne,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              GestureDetector(
                onTap:(){
                  quizProvider.changeSelectedAnswer('B');
                },
                child: Container(
                  width: 377.w,
                  //height: 40.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: quizProvider.selectedAnswer == 'B' ? Colors.green.shade100 : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border:Border.all(
                          color: Colors.teal,
                          width: 2
                      )
                  ),
                  child: Text(
                    widget.questionModel.answerTwo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              GestureDetector(
                onTap:(){
                  quizProvider.changeSelectedAnswer('C');
                },
                child: Container(
                  width: 377.w,
                  //height: 40.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: quizProvider.selectedAnswer == 'C' ? Colors.green.shade100 : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border:Border.all(
                          color: Colors.teal,
                          width: 2
                      )
                  ),
                  child: Text(
                    widget.questionModel.answerThree,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              GestureDetector(
                onTap:(){
                  quizProvider.changeSelectedAnswer('D');
                },
                child: Container(
                  width: 377.w,
                  //height: 40.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: quizProvider.selectedAnswer == 'D' ? Colors.green.shade100 : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border:Border.all(
                          color: Colors.teal,
                          width: 2
                      )
                  ),
                  child: Text(
                    widget.questionModel.answerFour,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
            ],
          ),
        );
      }
    );
  }
}
