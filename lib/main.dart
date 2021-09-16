import 'package:flutter/material.dart';
import 'package:food_recipe/page/DetailPage.dart';
import 'package:food_recipe/page/homePage.dart';
import 'package:food_recipe/page/onboardingPage.dart';
import 'package:food_recipe/page/signinPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'google'),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/login': (context) => const SigninPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
