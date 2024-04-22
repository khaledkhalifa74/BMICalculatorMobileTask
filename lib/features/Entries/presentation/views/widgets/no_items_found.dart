import 'package:bmi_task/core/utils/assets.dart';
import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *.3,
          ),
          SvgPicture.asset(AssetsData.noItemsImage),
          const SizedBox(
            height: 16,
          ),
          Text(
            'No items',
            style: Styles.textStyle16
                .copyWith(color: kBlackColor),
          ),
          Text(
            'There is no items to show you right now',
            style: Styles.textStyle14,
          ),
        ],
      ),
    );
  }
}
