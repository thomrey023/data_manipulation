import 'package:data_manipulation/utilities/constants/themes_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                color: CColors.secondaryTextLightColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide:
                  const BorderSide(color: CColors.primaryButtonLightColor)),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: CColors.primaryTextLightColor),
        ));
  }
}
