import 'package:bmi_task/core/functions/custom_toast.dart';
import 'package:bmi_task/core/utils/assets.dart';
import 'package:bmi_task/core/widgets/custom_button.dart';
import 'package:bmi_task/core/widgets/custom_loading_indicator.dart';
import 'package:bmi_task/core/widgets/custom_text_button.dart';
import 'package:bmi_task/core/widgets/custom_text_field_with_title.dart';
import 'package:bmi_task/features/Authentication/manager/auth_cubit/auth_cubit.dart';
import 'package:bmi_task/features/Authentication/manager/auth_cubit/auth_state.dart';
import 'package:bmi_task/features/BMICalculation/presentation/views/calculate_bmi_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  FToast fToast = FToast();
  bool isLoading = false;
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          showCustomToast(fToast, 'Account registered successfully', false);
          Navigator.pushNamed(context, CalculateBMIView.id);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showCustomToast(fToast, state.errorMessage, true);
          isLoading = false;
        }
      },
      builder: (BuildContext context, state) =>  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _registerFormKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(AssetsData.registerImage,height: 250,),
                  CustomTextFormFieldWithTitle(
                    validator: (data){
                      if (data!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if(!data.contains('@') || !data.contains('com')){
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    title: 'Enter your email',
                    placeholder: 'Email address',
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormFieldWithTitleAndPrefixAndSuffix(
                    controller: passwordController,
                    suffixToggle: AuthCubit.get(context).isPasswordShown,
                    suffixOnTap:() {
                      AuthCubit.get(context).changePasswordVisibility();
                    },
                    suffixIcon: AuthCubit.get(context).passwordVisible,
                    title: 'Enter your password',
                    placeholder: 'Password',
                    validateMessage: 'Please enter your password',
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  isLoading ? const Center(child: CustomLoadingIndicator())
                      : Column(
                    children: [
                      CustomButton(
                        text: 'Register',
                        itemCallBack: ()async {
                          if (_registerFormKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString());
                            isLoading = false;
                          }else{}
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextButton(
                        text: 'I Have an Account',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
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
