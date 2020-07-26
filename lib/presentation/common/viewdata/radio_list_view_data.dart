import 'package:flutter/material.dart';

class RadioListViewData {
  @required String text;
  @required TextStyle checkedTextStyle;
  @required TextStyle uncheckedTextStyle;
  @required String checkedIconName;
  @required String uncheckedIconName;
  @required Color checkedIconColor;
  @required Color uncheckedIconColor;

  RadioListViewData(
      this.text,
      this.checkedTextStyle,
      this.uncheckedTextStyle,
      this.checkedIconName,
      this.uncheckedIconName,
      this.checkedIconColor,
      this.uncheckedIconColor);
}