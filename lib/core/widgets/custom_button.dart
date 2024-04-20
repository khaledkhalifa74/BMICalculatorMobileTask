import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback itemCallBack;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.itemCallBack,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed:
        itemCallBack,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}