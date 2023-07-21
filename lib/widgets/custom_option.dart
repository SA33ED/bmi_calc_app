// ignore_for_file: must_be_immutable

import 'package:bmi/helpers/constans.dart';
import 'package:flutter/material.dart';

class CustomOption extends StatelessWidget {
  CustomOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.selected,
  });
  IconData icon;
  String title;
  VoidCallback onTap;
  bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected == true ? const Color(0xffF10606) : kSecandryColor,
            borderRadius: BorderRadius.circular(20)),
        height: 159,
        width: 136,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
