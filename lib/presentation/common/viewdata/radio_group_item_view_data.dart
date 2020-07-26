import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/widget/horizontal_radio_group_widget.dart';

/// ViewData that represents an item in [HorizontalRadioGroupWidget].
/// Created to be an element of radio group so it has a bunch
/// of properties that are used for checked and unchecked states.
/// Can be used without icon: [iconName] and bottom line of text: [bottomText].
class RadioGroupItemViewData {
  String iconName;
  @required String topText;
  String bottomText;
  @required Color checkedBorderColor;
  @required Color uncheckedBorderColor;
  @required Color checkedBackgroundColor;
  @required Color uncheckedBackgroundColor;
  @required Color checkedIconColor;
  @required Color uncheckedIconColor;
  @required TextStyle checkedTextStyle;
  @required TextStyle uncheckedTextStyle;

  RadioGroupItemViewData(
      this.iconName,
      this.topText,
      this.bottomText,
      this.checkedBorderColor,
      this.uncheckedBorderColor,
      this.checkedBackgroundColor,
      this.uncheckedBackgroundColor,
      this.checkedIconColor,
      this.uncheckedIconColor,
      this.checkedTextStyle,
      this.uncheckedTextStyle);
}