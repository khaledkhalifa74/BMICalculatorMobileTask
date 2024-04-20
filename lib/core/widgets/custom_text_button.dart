import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? underlineColor;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textColor,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(
          color: textColor ?? kPrimaryColor,
          decoration: TextDecoration.underline,
          decorationColor: underlineColor?? kPrimaryColor,
        ),
      ),
    );
  }
}
