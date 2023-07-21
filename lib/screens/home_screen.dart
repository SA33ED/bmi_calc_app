import 'dart:math';

import 'package:bmi/helpers/constans.dart';

import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/widgets/custom_input.dart';
import 'package:bmi/widgets/custom_option.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double hieght = 170;
  double wieght = 60;
  double age = 21;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kSecandryColor,
        centerTitle: true,
        title: const Text(
          "BMI calculator",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 35,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomOption(
                        title: "FEMALE",
                        icon: Icons.female,
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        selected: isMale == false ? true : false,
                      ),
                      CustomOption(
                        title: "Male",
                        icon: Icons.male,
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        selected: isMale == true ? true : false,
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kSecandryColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: 189,
                    width: 334,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "HIEGHT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: hieght,
                            onChanged: (newHieght) {
                              setState(() => hieght = newHieght);
                            },
                            min: 5,
                            max: 250,
                            divisions: 250,
                            label: "${hieght.toInt()}",
                            activeColor: const Color(0xff6200EE),
                            inactiveColor: const Color(0xffBB86FC),
                            thumbColor: Colors.red,
                          ),
                          Text(
                            "${hieght.toInt()} cm",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomInput(
                        icon: Icons.abc,
                        title: "WIEGHT",
                        value: wieght,
                        onPressedAdd: () {
                          setState(() {
                            wieght = wieght + 1;
                          });
                        },
                        onPressedRemove: () {
                          setState(() {
                            wieght = wieght - 1;
                          });
                        },
                      ),
                      CustomInput(
                        icon: Icons.abc,
                        title: "AGE",
                        value: age,
                        onPressedAdd: () {
                          setState(() {
                            age = age + 1;
                          });
                        },
                        onPressedRemove: () {
                          setState(() {
                            age = age - 1;
                          });
                        },
                      ),
                    ],
                  )
                ]),
          ),
          GestureDetector(
            onTap: () {
              double bmiResult = calculateBMI(hieght, wieght);
              String state = calculateState(bmiResult);
              Map results = {
                "bmiResult": bmiResult.toStringAsFixed(1),
                "state": state,
              };
              Navigator.pushNamed(context, ResultScreen.id, arguments: results);
            },
            child: Container(
              alignment: Alignment.center,
              height: 84,
              width: double.infinity,
              color: const Color(0xffF10606),
              child: const Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

double calculateBMI(double hieght, double wieght) {
  double hieghtByMeter = hieght / 100;
  double bmiResult = wieght / pow(hieghtByMeter, 2);
  return bmiResult;
}

String calculateState(double bmiResult) {
  if (bmiResult < 18.5) {
    return "Underweight";
  } else if (bmiResult < 25.0) {
    return "Normal";
  } else if (bmiResult < 23.0) {
    return "Overweioght";
  } else if (bmiResult < 35.0) {
    return "Obesity class |";
  } else if (bmiResult < 40.0) {
    return "Obesity class ||";
  } else {
    return "Obesity class |||";
  }
}
