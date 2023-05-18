import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/question_model.dart';
import 'delete_dialog.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel questionModel;
  const QuestionWidget({Key? key, required this.questionModel}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 321.w,
                child: Text(
                  widget.questionModel.question ,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return DeleteDialog(qID: widget.questionModel.id!,);
                  });
                },
                child: Icon(Icons.delete,size: 32.w,color: Colors.blueGrey,)
              )
            ],
          ),
          SizedBox(height: 10.h,),
          Container(
            width: 350.w,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: widget.questionModel.correctAnswer == 'A' ? Colors.green.shade400 : Colors.white,
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Text(
              widget.questionModel.answerOne ,
              style: TextStyle(
                color: widget.questionModel.correctAnswer == 'A' ? Colors.white : Colors.black,
                fontSize: 20.sp
              ),
            ),
          ),
          Container(
            width: 350.w,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: widget.questionModel.correctAnswer == 'B' ? Colors.green.shade400 : Colors.white,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Text(
              widget.questionModel.answerTwo ,
              style: TextStyle(
                  color: widget.questionModel.correctAnswer == 'B' ? Colors.white : Colors.black,
                  fontSize: 20.sp
              ),
            ),
          ),
          Container(
            width: 350.w,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: widget.questionModel.correctAnswer == 'C' ? Colors.green.shade400 : Colors.white,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Text(
              widget.questionModel.answerThree ,
              style: TextStyle(
                  color: widget.questionModel.correctAnswer == 'C' ? Colors.white : Colors.black,
                  fontSize: 20.sp
              ),
            ),
          ),
          Container(
            width: 350.w,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: widget.questionModel.correctAnswer == 'D' ? Colors.green.shade400 : Colors.white,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Text(
              widget.questionModel.answerFour ,
              style: TextStyle(
                  color: widget.questionModel.correctAnswer == 'D' ? Colors.white : Colors.black,
                  fontSize: 20.sp
              ),
            ),
          )
        ],
      ),
    );
  }
}
