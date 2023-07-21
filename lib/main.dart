import 'package:bmi/screens/home_screen.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        ResultScreen.id: (context) => const ResultScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
