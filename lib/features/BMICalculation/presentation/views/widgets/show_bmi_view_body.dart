import 'package:bmi_task/core/functions/custom_dialog.dart';
import 'package:bmi_task/core/functions/custom_toast.dart';
import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/features/Authentication/manager/auth_cubit/auth_cubit.dart';
import 'package:bmi_task/features/Authentication/manager/auth_cubit/auth_state.dart';
import 'package:bmi_task/features/Authentication/presentation/views/login_view.dart';
import 'package:bmi_task/features/BMICalculation/presentation/views/widgets/bmi_status.dart';
import 'package:bmi_task/features/BMICalculation/presentation/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShowBMIViewBody extends StatefulWidget {
  const ShowBMIViewBody({super.key, required this.bmi});

  final String bmi;

  @override
  State<ShowBMIViewBody> createState() => _ShowBMIViewBodyState();
}

class _ShowBMIViewBodyState extends State<ShowBMIViewBody> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          isLoading = true;
        } else if (state is LogoutSuccess) {
          showCustomToast(fToast, 'Logout successfully', false);
          isLoading = false;
        } else if (state is LoginFailure) {
          showCustomToast(fToast, state.errorMessage, true);
          isLoading = false;
        }
      },
      builder: (BuildContext context, AuthState state)
      => Scaffold(
        extendBody: true,
        key: drawerKey,
        drawer: CustomDrawer(
          signOutPressed: () {
            customLogOutDialog(context, () {
              AuthCubit.get(context).logoutUser();
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginView()),(route) => false);
            });
          },
        ),
        body: Padding(
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
                    GestureDetector(
                      onTap: (){
                        drawerKey.currentState!.openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                      ),
                    ),
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
                ]),
                const SizedBox(
                  height: 32,
                ),
                const BMIStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
