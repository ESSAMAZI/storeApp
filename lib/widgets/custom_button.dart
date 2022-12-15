// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.textb});
  VoidCallback? onTap;
  String? textb; //اسم الزر
  @override
  Widget build(BuildContext context) {
    return //تصميم زر بوتن
        GestureDetector(
      onTap: onTap,
      child: Container(
        // لون وبوردر
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          textb!,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
  //CustomButton({this.hintText});
}
