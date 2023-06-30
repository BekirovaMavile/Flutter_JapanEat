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

}
