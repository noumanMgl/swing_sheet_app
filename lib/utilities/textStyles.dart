import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';

TextStyle textStyleBold(Color color) {
  return TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);
}

TextStyle textStyleH2(Color color) {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: color);
}

TextStyle textStyleH3(Color color) {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
}

TextStyle textStyleLight(Color color) {
  return TextStyle(fontWeight: FontWeight.w300, color: blackColor);
}

TextStyle textStyleRegular() {
  return TextStyle(color: blackColor);
}
