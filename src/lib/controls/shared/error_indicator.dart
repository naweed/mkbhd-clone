import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkbhd_clone/controls/extensions/padding_extensions.dart';
import 'package:mkbhd_clone/controls/extensions/size_extensions.dart';
import 'package:mkbhd_clone/shared/app_assets.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorText;

  const ErrorIndicator({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) => Padding(
        padding: (64, 48).withSymetricPadding(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                height: 360,
                child: SvgPicture.asset(
                  AppAssets.ErrorImage,
                  height: 240,
                ),
              ),
              16.toVerticalSpacer(),
              const Text(
                "Uh-Oh!",
                style: AppStyles.IndicatorHeaderTextStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                errorText,
                style: AppStyles.IndicatorTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
