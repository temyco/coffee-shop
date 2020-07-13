import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/presentation/common/viewdata/checkbox_list_view_data.dart';
import 'package:flutterapp/widgets/ripple_widget.dart';

class CheckboxListWidget extends StatefulWidget {

  final Function(CheckboxListViewData, bool) onItemChecked;
  final CheckboxListViewData item;
  final bool isChecked;

  CheckboxListWidget(this.onItemChecked, this.item, this.isChecked);

  @override
  State createState() {
    return _CheckboxListWidgetState(onItemChecked, item, isChecked);
  }
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {

  final Function(CheckboxListViewData, bool) onItemChecked;
  final CheckboxListViewData item;
  bool isChecked;

  _CheckboxListWidgetState(this.onItemChecked, this.item, this.isChecked);

  void _onItemPressed() {
    setState(() {
      this.isChecked = !this.isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RippleWidget(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item.title,
                    style: _getTextStyle(),
                  ),
                  SvgPicture.asset(_getIconName(), color: _getIconColor()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Divider(),
            )
          ],
        ),
        onTap: () {
          setState(() {
            _onItemPressed();
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