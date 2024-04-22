import 'package:bmi_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    this.deleteOnPressed,
  });

  final String height;
  final String weight;
  final String age;
  final String bmi;
  final void Function()? deleteOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Height : '),
                  Text(height),
                ],
              ),
              Row(
                children: [
                  const Text('Age : '),
                  Text(age),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Weight : '),
                  Text(weight),
                ],
              ),
              Row(
                children: [
                  const Text('BMI : '),
                  Text(
                    bmi,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: deleteOnPressed,
            icon: const Icon(
              Icons.delete_forever,
              color: kHintColor,
            ),
          )
        ],
      ),
    );
  }
}
