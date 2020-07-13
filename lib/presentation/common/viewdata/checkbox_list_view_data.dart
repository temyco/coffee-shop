import 'package:flutter/material.dart';

class CheckboxListViewData {
  @required String title;
  String price;
  @required TextStyle checkedTextStyle;
  @required TextStyle uncheckedTextStyle;
  @required String checkedIconName;
  @required String uncheckedIconName;
  @required Color checkedIconColor;
  @required Color uncheckedIconColor;

  CheckboxListViewData(
      this.title,
      this.price,
      this.checkedTextStyle,
      this.uncheckedTextStyle,
      this.checkedIconName,
      this.uncheckedIconName,
      this.checkedIconColor,
      this.uncheckedIconColor);
}