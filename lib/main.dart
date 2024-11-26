import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle_quiz_app/views/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const WelcomeView(),
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
