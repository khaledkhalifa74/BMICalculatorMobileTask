import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    return Center(
        child: SfRadialGauge(axes: <RadialAxis>[
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
              label: '',
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
              value: double.parse(widget.bmi) > 50 ? 50
                  : double.parse(widget.bmi),
              enableAnimation: true,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 90,
              positionFactor: 0.9,
              widget: Text(
                'Your BMI is ${widget.bmi}',
                style: Styles.textStyle22,
              ),
            )
          ])
    ]));
  }
}
