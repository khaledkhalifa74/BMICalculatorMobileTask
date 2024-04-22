import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/custom_text_button.dart';
import 'package:bmi_task/features/BMICalculation/presentation/views/widgets/bmi_status.dart';
import 'package:bmi_task/features/Entries/presentation/views/entries_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShowBMIViewBody extends StatelessWidget {
  const ShowBMIViewBody({super.key, required this.bmi});

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
                const Spacer(),
                CustomTextButton(
                  text: 'View all',
                  textColor: kBlackColor,
                  underlineColor: kBlackColor,
                  onPressed: (){
                    Navigator.pushNamed(context, EntriesView.id);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 50,
                  showLastLabel: true,
                  labelsPosition: ElementsPosition.outside,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 10,
                      color: kBMIRedColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 10,
                      endValue: 15,
                      color: kBMIObesityColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 15,
                      endValue: 20,
                      color: kBMIYellowColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 20,
                      endValue: 30,
                      color: kBMIGreenColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 30,
                      endValue: 35,
                      color: kBMIYellowColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 35,
                      endValue: 40,
                      color: kBMIObesityColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                    GaugeRange(
                      startValue: 40,
                      endValue: 50,
                      color: kBMIDarkRedColor,
                      startWidth: 50,
                      endWidth: 50,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: double.parse(bmi) > 50 ? 50
                          : double.parse(bmi),
                      enableAnimation: true,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.9,
                      widget: Text(
                        'Your BMI is $bmi',
                        style: Styles.textStyle22,
                      ),
                    )
                  ])
            ]),
            const SizedBox(
              height: 32,
            ),
            const BMIStatus(),
          ],
        ),
      ),
    );
  }
}
