import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  final String? title;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? enabled;
  final int? maxLength;
  final bool? autoFocus;
  final void Function()? onTap;
  final String? validateMessage;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;
  const CustomTextFormFieldWithTitle(
      {super.key,
        this.title,
        this.controller,
        this.autoFocus,
        this.placeholder,
        this.inputType,
        this.enabled,
        this.maxLength,
        this.onTap,
        this.validateMessage,
        this.suffixIcon,
        this.width,
        this.height,
        this.validator,
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title !=null ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: Styles.textStyle14,
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        )
            : const SizedBox(),
        SizedBox(
          width: width ?? MediaQuery.of(context).size.width,
          height: height,
          child: TextFormField(
            onTap: onTap,
            controller: controller,
            enabled: enabled ?? true,
            maxLength: maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: inputType,
            autofocus: autoFocus ?? false,
            validator: validator ?? (data) {
              if (data!.isEmpty) {
                return validateMessage;
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: placeholder,
              hintStyle: Styles.textStyleHint14,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                      style: BorderStyle.solid)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      width: 1,
                      color: kSecondaryColor,
                      style: BorderStyle.solid)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      width: 1,
                      color: kSecondaryColor,
                      style: BorderStyle.solid)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                      style: BorderStyle.solid)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    width: 1,
                    color: kErrorColor,
                    style: BorderStyle.solid,
                  )),
              fillColor: kWhiteColor,
              contentPadding:
              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormFieldWithTitleAndPrefixAndSuffix extends StatelessWidget {
  final String? prefix;
  final String? suffix;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? enabled;
  final int? maxLength;
  final bool? autoFocus;
  final String? validateMessage;
  final String title;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnTap;
  final bool? suffixToggle;
  final String? Function(String?)? validator;
  const CustomTextFormFieldWithTitleAndPrefixAndSuffix(
      {super.key,
        this.prefix,
        this.suffix,
        this.controller,
        this.autoFocus,
        this.placeholder,
        this.inputType,
        this.enabled,
        this.maxLength,
        this.validateMessage,
        required this.title,
        this.suffixIcon, this.suffixOnTap, this.suffixToggle, this.validator,
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.textStyle14,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefix != null
                ? SizedBox(
              width: 40,
              child: Text(
                prefix!,
              ),
            )
                : const SizedBox(),
            prefix != null
                ? const SizedBox(
              width: 10,
            )
                : const SizedBox(),
            Expanded(
              child: TextFormField(
                controller: controller,
                enabled: enabled ?? true,
                maxLength: maxLength,
                obscureText: suffixToggle ?? false,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: inputType,
                autofocus: autoFocus ?? false,
                validator: validator ?? (data) {
                  if (data!.isEmpty) {
                    return validateMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: suffixIcon != null
                      ? IconButton(
                    onPressed: suffixOnTap,
                    icon: Icon(
                      suffixIcon,
                      color: kSecondaryColor,
                    ),
                  )
                      : const SizedBox(),
                  hintText: placeholder,
                  hintStyle: Styles.textStyleHint14,
                  counterText: "",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          width: 1,
                          color: kSecondaryColor,
                          style: BorderStyle.solid)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          width: 1,
                          color: kSecondaryColor,
                          style: BorderStyle.solid)),
                  disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          width: 1,
                          color: kSecondaryColor,
                          style: BorderStyle.solid)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          width: 1,
                          color: kErrorColor,
                          style: BorderStyle.solid)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                          style: BorderStyle.solid)),
                  fillColor: kWhiteColor,
                  contentPadding:
                  const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
              ),
            ),
            suffix != null
                ? const SizedBox(
              width: 8,
            )
                : const SizedBox(),
            suffix != null
                ? SizedBox(
              width: 30,
              child: Row(
                children: [
                  Text(
                    suffix!,
                    style: Styles.textStyle16.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}