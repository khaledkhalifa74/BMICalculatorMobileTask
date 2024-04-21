import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/custom_button.dart';
import 'package:bmi_task/core/widgets/custom_loading_indicator.dart';
import 'package:bmi_task/core/widgets/custom_text_field_with_title.dart';
import 'package:flutter/material.dart';
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
    return Padding(
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
                    // BlocProvider.of<AuthCubit>(context).loginUser(
                    //     email: emailController.text.toString(),
                    //     password: passwordController.text.toString());
                    isLoading = false;
                  }else{}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
