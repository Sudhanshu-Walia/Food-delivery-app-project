import 'package:flutter/material.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/utils/helper.dart';

class CustomSearchBar extends StatelessWidget {
  final String title;
  CustomSearchBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Image.asset(
            Helper.getAssetName("search_filled.png", "virtual"),
          ),
          hintText: title,
          hintStyle: TextStyle(
            color: AppColor.placeholder,
            fontSize: 18,

          ),
          contentPadding: const EdgeInsets.only(
            top: 10,
          ),
        ),
      ),
    );
  }
}
