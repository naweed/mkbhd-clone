import 'package:flutter/material.dart';

extension PaddingExtensions on num {
  EdgeInsets withAllPadding() => EdgeInsets.all(toDouble());
  EdgeInsets withLeftPadding() => EdgeInsets.only(left: toDouble());
  EdgeInsets withRightPadding() => EdgeInsets.only(right: toDouble());
  EdgeInsets withTopPadding() => EdgeInsets.only(top: toDouble());
  EdgeInsets withBottomPadding() => EdgeInsets.only(bottom: toDouble());
}

extension SymetrixPaddingExtensions on (num, num) {
  EdgeInsets withSymetricPadding() => EdgeInsets.symmetric(horizontal: $1.toDouble(), vertical: $2.toDouble());
}

extension LTRBPaddingExtensions on (num, num, num, num) {
  EdgeInsets withLTRBPadding() => EdgeInsets.fromLTRB($1.toDouble(), $2.toDouble(), $3.toDouble(), $4.toDouble());
}

extension WidgetPaddingExtensions on Widget {
  Widget withLTRBPadding(num left, num top, num right, num bottom) => Padding(padding: (left, top, right, bottom).withLTRBPadding(), child: this);
  Widget withAllPadding(num padding) => Padding(padding: padding.withAllPadding(), child: this);
}
