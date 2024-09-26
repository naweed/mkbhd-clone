import 'package:flutter/material.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';

class AppStyles {
  // Text Styles

  //Medium Light Text Styles
  static const TextStyle MediumLight22TextStyle = TextStyle(fontFamily: "MediumFont", color: AppColors.LightTextColor, fontSize: 22);

  //Regular Light Text Styles
  static const TextStyle RegularLight16TextStyle = TextStyle(fontFamily: "RegularFont", color: AppColors.LightTextColor, fontSize: 16);

  //Other Text Styles
  static const TextStyle IndicatorTextStyle = TextStyle(fontFamily: "LightFont", color: AppColors.LightIndicatorColor, fontSize: 16, height: 1.25);
  static const TextStyle IndicatorHeaderTextStyle = TextStyle(fontFamily: "RegularFont", color: AppColors.LightIndicatorColor, fontSize: 22);
}
