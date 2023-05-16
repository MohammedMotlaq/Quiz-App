
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';

import '../Widgets/start_quiz_widget.dart';


class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({Key? key}) : super(key: key);

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {

  int index = 0;
  ScrollController scrollController = ScrollController();

  void nextItem(){
    setState(() {
      index++;
    });
    scrollController.animateTo(
        index*377.0.w,
        duration: const Duration(milliseconds:  300),
        curve: Curves.easeInOut
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context,quizProvider,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Quiz App',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 393.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Question ${index+1}',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    ' /${quizProvider.questions.length}',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                width: 377.w,
                height: 400.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizProvider.questions.length,
                  itemBuilder: (context,int index){
                    return StartQuizWidget(questionModel: quizProvider.questions[index],);
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        fixedSize: Size(120.w, 40.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)
                        )
                      ),
                      onPressed: index == quizProvider.questions.length-1
                        ? (){
                        if(quizProvider.selectedAnswer == quizProvider.questions[index].correctAnswer){
                          quizProvider.score++;
                          log(quizProvider.score.toString());
                        }
                        quizProvider.changeResultStatus();
                        Navigator.of(context).pushReplacementNamed('/resultScreen');
                        }
                        : null,
                      child: Text('Finished',style: TextStyle(fontSize: 20.sp),)
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        fixedSize: Size(120.w, 40.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)
                        )
                      ),
                      onPressed: index < quizProvider.questions.length-1
                        ? (){
                          if(quizProvider.selectedAnswer == quizProvider.questions[index].correctAnswer){
                            quizProvider.score++;
                            log(quizProvider.score.toString());
                          }

                          nextItem();
                          quizProvider.changeSelectedAnswer('0');
                        }
                        : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Next',style: TextStyle(fontSize: 20.sp),),
                          Icon(Icons.arrow_forward_ios_rounded,size: 30.w,color: Colors.white,)
                        ],
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
