import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/features/Authentication/presentation/views/login_view.dart';
import 'package:bmi_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BMI',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: kPrimaryColor,
          ),
          initialRoute: LoginView.id,
          routes: {
            LoginView.id: (context) => const LoginView(),
          },
        );
      }
    );
  }
}