import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Database/quiz_database.dart';
import 'package:quiz_app/Models/question_model.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';

class AddNewQuestion extends StatefulWidget {
  AddNewQuestion({Key? key}) : super(key: key);

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context,quizProvider,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add New Question',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
            child: SingleChildScrollView(
              child: Form(
                key: quizProvider.formState,
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    SizedBox(
                      width: 377.w,
                      //height: 60.h,
                      child: TextFormField(
                        controller: quizProvider.questionController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Required *';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.question_mark_rounded,size: 24.w,color: Colors.blueGrey,),
                          labelText: 'Question',
                          hintText: 'Enter the question',
                          hintStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20.sp
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20.sp
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blueGrey,
                            )
                          ),

                        ),
                        maxLines: 2,
                        minLines: 1,
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: Padding(
                            padding: EdgeInsets.all(5.0.w),
                            child: CircleAvatar(
                              radius: 50.w,
                              backgroundColor: Colors.amber,
                              child: Text('A',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 317.w,
                          height: 60.h,
                          child: TextFormField(
                            controller: quizProvider.answerOneController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Required *';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp
                            ),
                            decoration: InputDecoration(
                              labelText: 'First Answer',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.sp
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blueGrey,
                                  )
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: Padding(
                            padding: EdgeInsets.all(5.0.w),
                            child: CircleAvatar(
                              radius: 50.w,
                              backgroundColor: Colors.green,
                              child: Text('B',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 317.w,
                          height: 60.h,
                          child: TextFormField(
                            controller: quizProvider.answerTwoController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Required *';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp
                            ),
                            decoration: InputDecoration(
                              labelText: 'Second Answer',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.sp
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blueGrey,
                                  )
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: Padding(
                            padding: EdgeInsets.all(5.0.w),
                            child: CircleAvatar(
                              radius: 50.w,
                              backgroundColor: Colors.blueGrey,
                              child: Text('C',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 317.w,
                          height: 60.h,
                          child: TextFormField(
                            controller: quizProvider.answerThreeController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Required *';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp
                            ),
                            decoration: InputDecoration(
                              labelText: 'Third Answer',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.sp
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blueGrey,
                                  )
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: Padding(
                            padding: EdgeInsets.all(5.0.w),
                            child: CircleAvatar(
                              radius: 50.w,
                              backgroundColor: Colors.pink,
                              child: Text('D',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 317.w,
                          height: 60.h,
                          child: TextFormField(
                            controller: quizProvider.answerFourController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Required *';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp
                            ),
                            decoration: InputDecoration(
                              labelText: 'Fourth Answer',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.sp
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blueGrey,
                                  )
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      children: [
                        Text(
                          'Select The Correct Answer: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(12.r),
                            iconSize: 32.sp,
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.sp,
                            ),
                            value: quizProvider.correctAnswer,
                            items: <String>['A','B','C','D'].map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? currentAnswer){
                              setState(() {
                                quizProvider.correctAnswer = currentAnswer!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 8.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)
                        )
                      ),
                      onPressed: (){
                        if(quizProvider.formState.currentState!.validate()){
                          quizProvider.insertNewQuestion();
                        }
                      },
                      child: Text(
                        'Add Question',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
