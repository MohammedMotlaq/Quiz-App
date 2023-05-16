import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Database/quiz_database.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';
import 'package:quiz_app/app_router.dart';

class DeleteDialog extends StatefulWidget {
  final int qID;
  const DeleteDialog({Key? key,required this.qID}) : super(key: key);

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Delete Question',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
      content: Text(
        'Are you sure you want to delete this question?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            AppRouter.popWidget();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 18.sp
            ),
          )
        ),
        Consumer<QuizProvider>(
          builder: (context,quizProvider,child) {
            return TextButton(
                onPressed: (){
                  quizProvider.deleteQuestion(widget.qID);
                  AppRouter.popWidget();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18.sp
                  ),
                )
            );
          }
        )
      ],
    );
  }
}
