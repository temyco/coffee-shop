import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_group_item_view_data.dart';
import 'package:flutterapp/presentation/common/widget/horizontal_radio_group_widget.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

/// Draws overline text with 3 radio buttons.
class HorizontalChooserWidget extends StatelessWidget {

  final overlineText;
  final List<RadioGroupItemViewData> items;
  final Function(int) onButtonPressed;

  HorizontalChooserWidget(this.overlineText, this.items, this.onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: ProductDetailsDimens.defaultHorizontalMargin,
        right: ProductDetailsDimens.defaultHorizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            overlineText,
            style: AppTextStyles.overlineBoldPrimary,
          ),
          SizedBox(
            height: 9,
          ),
          HorizontalRadioGroupWidget(onButtonPressed, items),
        ],
      ),
    );
  }
}