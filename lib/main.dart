
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Database/quiz_database.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';
import 'package:quiz_app/Screens/result_screen.dart';

import 'Screens/home_page.dart';
import 'app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await QuizDatabase.quizDatabase.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizProvider>(create: (context) => QuizProvider()),
      ],
      child: ScreenUtilInit(
        designSize:const Size(393, 857),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            routes: {
              '/resultScreen': (context) => ResultScreen()
            },
            navigatorKey: AppRouter.navKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            home: const HomePage(),
          );
        }
      ),
    );
  }
}

