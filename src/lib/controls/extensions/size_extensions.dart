import 'package:gap/gap.dart';

extension SizeExtensions on int {
  Gap toHorizontalSpacer() => Gap(toDouble());
  Gap toVerticalSpacer() => Gap(toDouble());
}
