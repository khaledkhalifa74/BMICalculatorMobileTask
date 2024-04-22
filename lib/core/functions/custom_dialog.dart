import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

Future<dynamic> customLogOutDialog(BuildContext context, void Function()? onConfirmed) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Confirm',
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
      content: Text(
        'Are you sure to log out?',
        style: Styles.textStyle16.copyWith(
          color: kBlackColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: ShapeDecoration(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    )),
                child: TextButton(
                  onPressed: onConfirmed,
                  child: Text(
                    'Yes',
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                  color: kPrimaryColor,
                ),
                child: TextButton(
                  child: Text(
                   'No',
                    style: Styles.textStyle14,
                  ),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

