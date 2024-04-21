import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowBMIViewBody extends StatefulWidget {
  const ShowBMIViewBody({super.key, required this.bmi});
  final String bmi;
  @override
  State<ShowBMIViewBody> createState() => _ShowBMIViewBodyState();
}

class _ShowBMIViewBodyState extends State<ShowBMIViewBody> {
  @override
  void initState() {
    if (kDebugMode) {
      print('BMI is ${widget.bmi}');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
