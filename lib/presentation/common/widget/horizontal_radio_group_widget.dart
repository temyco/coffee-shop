import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_group_item_view_data.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';

/// A widget that laying it's elements horizontally in a row and divides an available
/// space evenly between them. Accepts a list with pre-populated [RadioGroupItemViewData].
/// One item in the group is constructed of:
/// - border with [ProductDetailsDimens.horizontalRadioButtonBorderWidth] width
/// and [ProductDetailsDimens.horizontalRadioButtonBorderRadius] radius
/// - icon (if present) at the left
/// - one or two lines of text in the middle
///
/// Items in the widget may be one of two states: checked or unchecked.
/// Only one item is allowed to checked at the time.
///
/// Widgets up in the chain can receive a checked item 0-based index via [onButtonPressed] callback.
class HorizontalRadioGroupWidget extends StatefulWidget {

  final Function(int) onButtonPressed;
  final List<RadioGroupItemViewData> items;
  final int _defaultCheckedItem = 0;

  HorizontalRadioGroupWidget(this.onButtonPressed, this.items);

  @override
  State createState() {
    return _HorizontalRadioGroupWidgetState(
        _defaultCheckedItem, onButtonPressed, items);
  }
}

class _HorizontalRadioGroupWidgetState
    extends State<HorizontalRadioGroupWidget> {

  int _checkedIndex = -1;
  final Function(int) onButtonPressed;
  List<RadioGroupItemViewData> items;

  _HorizontalRadioGroupWidgetState(this._checkedIndex, this.onButtonPressed,
      this.items);

  void _onChildPressed(int index) {
    setState(() {
      _checkedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();
    for (int i = 0; i < items.length; i++) {
      children.add(Flexible(
        flex: 1,
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: ProductDetailsDimens
                    .horizontalRadioButtonVerticalPaddingTop,
                bottom: ProductDetailsDimens
                    .horizontalRadioButtonVerticalPaddingBottom),
            decoration: BoxDecoration(
              border: Border.all(
                  color: _getBorderColor(i),
                  width: ProductDetailsDimens.horizontalRadioButtonBorderWidth),
              borderRadius: BorderRadius.circular(
                  ProductDetailsDimens.horizontalRadioButtonBorderRadius),
              color: _getBackgroundColor(i),
            ),
            child: IntrinsicWidth(
              child: Row(children: <Widget>[
                items[i].iconName != null
                    ? SvgPicture.asset(items[i].iconName,
                        color: _getIconColor(i))
                    : Container(
                        height: 0,
                      ),
                Text(
                  _getText(i),
                  textAlign: TextAlign.center,
                  style: _getTextStyle(i),
                ),
              ]),
            ),
          ),
          onTap: () {
            setState(() {
              _onChildPressed(i);
            });
            onButtonPressed(i);
          },
        ),
      ));
      if (i != items.length - 1) {
        children.add(SizedBox(
          width: ProductDetailsDimens.horizontalRadioButtonSPaceBetweenChildren,
        ));
      }
    }
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }

  Color _getBorderColor(int index) =>
      _isItemChecked(index) ? items[index].checkedBorderColor : items[index]
          .uncheckedBorderColor;

  Color _getBackgroundColor(int index) =>
      _isItemChecked(index) ? items[index].checkedBackgroundColor : items[index]
          .uncheckedBackgroundColor;

  Color _getIconColor(int index) =>
      _isItemChecked(index) ? items[index].checkedIconColor : items[index]
          .uncheckedIconColor;

  TextStyle _getTextStyle(int index) =>
      _isItemChecked(index) ? items[index].checkedTextStyle : items[index]
          .uncheckedTextStyle;

  String _getText(int index) =>
      '${items[index].topText}\n${items[index].bottomText}';

  bool _isItemChecked(int index) => _checkedIndex == index;
}