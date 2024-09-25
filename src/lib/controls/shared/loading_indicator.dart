import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mkbhd_clone/controls/extensions/padding_extensions.dart';
import 'package:mkbhd_clone/controls/extensions/size_extensions.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';

class LoadingIndicator extends StatelessWidget {
  final String loadingText;

  const LoadingIndicator({super.key, required this.loadingText});

  @override
  Widget build(BuildContext context) => Padding(
        padding: 48.withAllPadding(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpinKitFadingCube(
                color: AppColors.LightIndicatorColor,
                size: 32,
              ),
              40.toVerticalSpacer(),
              Text(
                loadingText,
                style: AppStyles.IndicatorTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
