import 'package:bmi/helpers/constans.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String id = "ResultScreen";
  @override
  Widget build(BuildContext context) {
    dynamic result = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              )
            ],
          ),
          Container(
            width: 383,
            height: 535,
            decoration: ShapeDecoration(
              color: const Color(0xFF191E38),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  result['state'],
                  style: const TextStyle(
                    color: Color(0xFF08FF79),
                    fontSize: 35,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  result['bmiResult'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'culees badan malihide is daji',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
