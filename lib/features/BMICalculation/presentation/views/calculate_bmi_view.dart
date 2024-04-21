import 'package:bmi_task/features/BMICalculation/presentation/views/widgets/calculate_bmi_view_body.dart';
import 'package:flutter/material.dart';

class CalculateBMIView extends StatelessWidget {
  const CalculateBMIView({super.key});
  static String id = "CalculateBMIView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CalculateBMIViewBody(),
    );
  }
}
