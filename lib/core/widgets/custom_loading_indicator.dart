import 'package:bmi_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.width, this.height});
final double? width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const CircularProgressIndicator(
       color: kPrimaryColor, // Change color
      ),
    );
  }
}
