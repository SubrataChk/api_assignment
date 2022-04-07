import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icons;
  final TextEditingController controller;
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icons,
            color: Colors.green,
          ),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
