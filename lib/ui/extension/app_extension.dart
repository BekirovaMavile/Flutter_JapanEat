import 'package:flutter/material.dart';
import '../_ui.dart';

extension StringExtension on String {
  String get toCapital => this[0].toUpperCase() + substring(1, length);
}


extension WidgetExtension on Widget {
  Widget get scaleImplicitAnimation => ScaleTweenAnimationsBuilder(
    child: this,
  );
  Widget get explicitAnimation => ExplicitAnimation(child: this);
  Widget get sizeExplicitAnimation =>
      SizeExplicitAnimation(child: this);
  Widget get scaleAnimation =>
      ScaleAnimation(child: this);

  Widget fadeAnimation(double delay) {
    return FadeAnimation(delay: delay, child: this);
  }
  // Widget SimpleAnimation(double delay) {
  //   return SimpleAnimation(delay: delay);
  // }

}
