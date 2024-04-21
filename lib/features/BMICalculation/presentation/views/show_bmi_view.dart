import 'package:bmi_task/features/BMICalculation/presentation/views/widgets/show_bmi_view_body.dart';
import 'package:flutter/material.dart';

class ShowBMIView extends StatelessWidget {
  const ShowBMIView({super.key});
  static String id = "ShowBMIView";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String bmi = args['bmi'].toString();
    return Scaffold(
      body: ShowBMIViewBody(bmi: bmi),
    );
  }
}
