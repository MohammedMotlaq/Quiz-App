import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';
import 'package:quiz_app/app_router.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context,quizProvider,child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Quiz Result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 393.w,),
              Text(
                quizProvider.congrats,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              Image.asset(quizProvider.imagePath,width: 250.w,height: 250.w,),
              SizedBox(height: 20.h,),
              Text(
                'Your Score: ${quizProvider.score}/${quizProvider.questions.length}',
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.green,
                ),
              ),
              Text(
                quizProvider.subtitle,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  )
                ),
                onPressed: (){
                  AppRouter.popWidget();
                },
                child: Text(
                  'Back to home',
                  style: TextStyle(
                    fontSize: 20.sp
                  ),
                )
              )
            ],
          ),
        );
      }
    );
  }
}
