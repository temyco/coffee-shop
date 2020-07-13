import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_list_view_data.dart';
import 'package:flutterapp/widgets/ripple_widget.dart';

class RadioListWidget extends StatefulWidget {

  final Function(int) onItemChecked;
  final List<RadioListViewData> items;

  RadioListWidget(this.onItemChecked, this.items);

  @override
  State<StatefulWidget> createState() {
    return _RadioListWidgetState(onItemChecked, items);
  }
}

class _RadioListWidgetState extends State<RadioListWidget> {

  final Function(int) onItemChecked;
  final List<RadioListViewData> items;
  int _checkedIndex = -1;

  _RadioListWidgetState(this.onItemChecked, this.items);

  void _onItemPressed(int index) {
    setState(() {
      _checkedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();
    for (int i = 0; i < items.length; i++) {
      children.add(RippleWidget(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      items[i].text,
                      style: _getTextStyle(i),
                    ),
                    SvgPicture.asset(_getIconName(i), color: _getIconColor(i)),
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
              _onItemPressed(i);
            });
            onItemChecked(i);
          }));
    }

    return Column(
      children: children,
    );
  }

  TextStyle _getTextStyle(int index) => _isItemChecked(index)
      ? items[index].checkedTextStyle
      : items[index].uncheckedTextStyle;

  String _getIconName(int index) => _isItemChecked(index)
      ? items[index].checkedIconName
      : items[index].uncheckedIconName;

  Color _getIconColor(int index) => _isItemChecked(index)
      ? items[index].checkedIconColor
      : items[index].uncheckedIconColor;

  bool _isItemChecked(int index) => _checkedIndex == index;
}