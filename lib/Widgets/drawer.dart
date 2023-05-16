import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';
import 'package:quiz_app/app_router.dart';

import '../Screens/create_quiz.dart';
import '../Screens/not_enough_question.dart';
import '../Screens/start_quiz_screen.dart';
import 'exit_dialog.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 25.h,
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: DrawerHeader(

                decoration:const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.w,
                      backgroundColor: Colors.pink,
                      child: Text('M',style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold),),
                      //backgroundImage: AssetImage('assets/images/moh.jpg'),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Mohammed Motlaq',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'mohammed@gmail.com',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                AppRouter.popWidget();
                AppRouter.pushWidget(CreateQuiz());
              },
              child: ListTile(
                leading: Icon(Icons.edit,size: 24.w,),
                title: Text('Create Quiz',style: TextStyle(fontSize: 16.sp),),
              ),
            ),
            Consumer<QuizProvider>(
              builder: (context,quizProvider,child) {
                return TextButton(
                  onPressed: (){
                    quizProvider.score = 0;
                    quizProvider.selectedAnswer = '0';
                    AppRouter.popWidget();
                    if(quizProvider.questions.length <5){
                      AppRouter.pushWidget(NotEnoughQuestion());
                    }else{
                      AppRouter.pushWidget(StartQuizScreen());
                    }
                  },
                  child: ListTile(
                    leading: Icon(Icons.quiz,size: 24.w,),
                    title: Text('Start Quiz',style: TextStyle(fontSize: 16.sp),),
                  ),
                );
              }
            ),
            const Divider(
              thickness: 1,
            ),
            TextButton(
              onPressed: (){
                AppRouter.popWidget();
                showDialog(context: context, builder: (context){
                  return ExitDialog();
                });
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app,size: 24.w,),
                title: Text('Exit',style: TextStyle(fontSize: 16.sp),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
