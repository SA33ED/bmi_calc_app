// ignore_for_file: must_be_immutable

import 'package:bmi/helpers/constans.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onPressedAdd,
    required this.onPressedRemove,
  });
  IconData icon;
  String title;
  double value;
  VoidCallback onPressedAdd;
  VoidCallback onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kSecandryColor, borderRadius: BorderRadius.circular(20)),
      height: 159,
      width: 136,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: onPressedRemove,
                color: Colors.white,
                iconSize: 35.0,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: onPressedAdd,
                color: Colors.white,
                iconSize: 35.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
