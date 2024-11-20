import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/textStyles.dart';

Widget commonOutlinedButton(
    {required BuildContext context,
    required String label,
    required Color color}) {
  return Container(
    height: 48,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: color,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
        child: Text(
      label,
      style: textStyleH2(whiteColor),
    )),
  );
}
