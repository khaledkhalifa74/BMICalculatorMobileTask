import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/widgets/custom_text_button.dart';
import 'package:bmi_task/features/Entries/presentation/views/entries_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,this.signOutPressed});
final void Function()? signOutPressed;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhiteColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextButton(
              text: 'View all entries',
              textColor: kBlackColor,
              underlineColor: kBlackColor,
              onPressed: () {
                Navigator.pushNamed(context, EntriesView.id);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextButton(
              text: 'Sign out',
              textColor: kBlackColor,
              underlineColor: kBlackColor,
              onPressed: signOutPressed,
            ),
          ],
        ),
      ),
    );
  }
}
