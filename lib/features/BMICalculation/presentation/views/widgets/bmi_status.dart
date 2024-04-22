import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BMIStatus extends StatelessWidget {
  const BMIStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIRedColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '0 - 10 Underweight',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIObesityColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '10 - 15 Underweight',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIYellowColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '15 - 20 Underweight',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIGreenColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '20 - 30 Normal',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIYellowColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '30 - 35 Overweight',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIObesityColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '35 - 40 Overweight',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                color: kBMIDarkRedColor,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '40 - 50 Obesity',
              style: Styles.textStyle16.copyWith(
                color: kBlackColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
