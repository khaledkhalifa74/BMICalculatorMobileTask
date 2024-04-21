import 'package:bmi_task/core/functions/custom_toast.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/custom_button.dart';
import 'package:bmi_task/core/widgets/custom_loading_indicator.dart';
import 'package:bmi_task/core/widgets/custom_text_field_with_title.dart';
import 'package:bmi_task/features/BMICalculation/manager/calculation_cubit/calculation_cubit.dart';
import 'package:bmi_task/features/BMICalculation/manager/calculation_cubit/calculation_state.dart';
import 'package:bmi_task/features/BMICalculation/presentation/views/show_bmi_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalculateBMIViewBody extends StatefulWidget {
  const CalculateBMIViewBody({super.key});

  @override
  State<CalculateBMIViewBody> createState() => _CalculateBMIViewBodyState();
}

class _CalculateBMIViewBodyState extends State<CalculateBMIViewBody> {
  bool isLoading = false;
  FToast fToast = FToast();
  final _calculateBMIFormKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? bmi;
  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: (BuildContext context) => CalculationCubit(),
      child: BlocConsumer<CalculationCubit, CalculationState>(
        listener: (context, state) {
          if (state is CalculationLoading) {
            isLoading = true;
          } else if (state is CalculationSuccess) {
            showCustomToast(fToast, 'Added successfully', false);
            Navigator.pushNamed(
                context, ShowBMIView.id,
                arguments: {
                  'bmi': bmi,
                });
            isLoading = false;
          } else if (state is CalculationFailure) {
            showCustomToast(fToast, state.errorMessage, true);
            isLoading = false;
          }
        },
        builder: (context, state)
        => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32
          ),
          child: Form(
            key: _calculateBMIFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Calculate your BMI',
                    style: Styles.textStyle22,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormFieldWithTitleAndPrefixAndSuffix(
                    controller: heightController,
                    inputType: TextInputType.number,
                    placeholder: '170',
                    suffix: 'CM',
                    title: 'How height are you?',
                    validateMessage: 'Please enter your height',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormFieldWithTitleAndPrefixAndSuffix(
                    controller: weightController,
                    inputType: TextInputType.number,
                    placeholder: '80',
                    suffix: 'Kg',
                    title: 'How weight are you?',
                    validateMessage: 'Please enter your weight',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormFieldWithTitleAndPrefixAndSuffix(
                    controller: ageController,
                    inputType: TextInputType.number,
                    placeholder: '23',
                    suffix: 'YRS',
                    title: 'How old are you?',
                    validateMessage: 'Please enter your age',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *.4,
                  ),
                  isLoading ? const Center(child: CustomLoadingIndicator())
                      : CustomButton(
                    text: 'Calculate',
                    itemCallBack: ()async {
                      if (_calculateBMIFormKey.currentState!.validate()) {
                        int heightValue = int.parse(heightController.text);
                        int weightValue = int.parse(weightController.text);
                        bmi = ((weightValue) ~/ (heightValue/100)).toString();
                        BlocProvider.of<CalculationCubit>(context).addEntry(
                            height: heightController.text,
                            weight: weightController.text,
                            age: ageController.text,
                            bmi: bmi.toString(),
                        );
                        isLoading = false;
                      }else{}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
