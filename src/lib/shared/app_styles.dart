import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mkbhd_clone/controls/shared/error_indicator.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';

class AppStyles {
  // Text Styles

  //Page Header Text Styles
  static const TextStyle PageHeaderTextStyle = TextStyle(fontFamily: "MediumFont", color: AppColors.LightTextColor, fontSize: 20);

  //Regular Light Text Styles
  static const TextStyle RegularLight16TextStyle = TextStyle(fontFamily: "RegularFont", color: AppColors.LightTextColor, fontSize: 16);

  //Other Text Styles
  static const TextStyle IndicatorTextStyle = TextStyle(fontFamily: "LightFont", color: AppColors.LightIndicatorColor, fontSize: 16, height: 1.25);
  static const TextStyle IndicatorHeaderTextStyle = TextStyle(fontFamily: "RegularFont", color: AppColors.LightIndicatorColor, fontSize: 22);

  static AppBar getPageAppBar(String headerText) => AppBar(
        toolbarHeight: 44,
        elevation: 0,
        backgroundColor: AppColors.PageBackgroundColor.withAlpha(200),
        centerTitle: true,
        title: Text(
          headerText,
          style: AppStyles.PageHeaderTextStyle,
        ),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      );
}
