import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/viewdata/checkbox_list_item_view_data.dart';
import 'package:flutterapp/presentation/common/widget/row_with_text_and_icon_widget.dart';
import 'package:flutterapp/widgets/ripple_widget.dart';

class CheckboxListItemWidget extends StatefulWidget {

  final Function(CheckboxListItemViewData, bool) onItemChecked;
  final CheckboxListItemViewData item;
  final bool isChecked;

  CheckboxListItemWidget(this.onItemChecked, this.item, this.isChecked);

  @override
  State createState() {
    return _CheckboxListItemWidgetState(onItemChecked, item, isChecked);
  }
}

class _CheckboxListItemWidgetState extends State<CheckboxListItemWidget> {

  final Function(CheckboxListItemViewData, bool) onItemChecked;
  final CheckboxListItemViewData item;
  bool isChecked;

  _CheckboxListItemWidgetState(this.onItemChecked, this.item, this.isChecked);

  void _onItemClicked() {
    setState(() {
      this.isChecked = !this.isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RippleWidget(
        child: RowWithTextAndIconWidget(
            item.title,
            _getIconName(),
            _getTextStyle(),
            _getIconColor()
        ),
        onTap: () {
          setState(() {
            _onItemClicked();
          });
          onItemChecked(item, isChecked);
        });
  }

  TextStyle _getTextStyle() => isChecked
      ? item.checkedTextStyle
      : item.uncheckedTextStyle;

  String _getIconName() => isChecked
      ? item.checkedIconName
      : item.uncheckedIconName;

  Color _getIconColor() => isChecked
      ? item.checkedIconColor
      : item.uncheckedIconColor;

}