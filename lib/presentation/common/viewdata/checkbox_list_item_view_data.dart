import 'package:flutter/material.dart';

class CheckboxListItemViewData {
  @required String title;
  String price;
  @required TextStyle checkedTextStyle;
  @required TextStyle uncheckedTextStyle;
  @required String checkedIconName;
  @required String uncheckedIconName;
  @required Color checkedIconColor;
  @required Color uncheckedIconColor;

  CheckboxListItemViewData(
      this.title,
      this.price,
      this.checkedTextStyle,
      this.uncheckedTextStyle,
      this.checkedIconName,
      this.uncheckedIconName,
      this.checkedIconColor,
      this.uncheckedIconColor);
}