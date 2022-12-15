// ignore_for_file: use_key_in_widget_constructors, file_names, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChanged,
      this.hintText,
      this.obscureText = false,
      this.inputType});
  //
  Function(String)? onChanged; // اخذ قيمه المدخله من المستخدم
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!, //تغطي لنا كلمه المرور بنجوم
      keyboardType: inputType, //المدخلات تكون ارقام
      onChanged: onChanged, // اخذ قيمه المدخله من المستخدم
      decoration: InputDecoration(
        hintText: hintText,
        //hintStyle: const TextStyle(color: Colors.white),
        //يوجد عددد كثير من البوردر عند الضفط وعند الفوكس
        // focusedBorder

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: Colors.white,

              ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: Colors.white,
              ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
