import 'dart:developer';

import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  // final String? labelText;
  final TextEditingController? controller;
  final EdgeInsets padding;
  final TextInputType? keyboardType;
  final int? maxLength;
  CustomTextInput({
    required this.hintText,
    this.padding = const EdgeInsets.all(12),
    this.controller, this.keyboardType, this.maxLength

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength??30,

      keyboardType: keyboardType??TextInputType.name,
      controller: controller,
      validator: (value) {
        if(value == null || value.isEmpty){
          return " Mandatory field";
        }
        return null;
      },
      decoration: InputDecoration(
counterText: "",
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        // labelText: labelText??"",
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.placeholder,
        ),

        contentPadding: padding,
      ),
    );
  }
}


