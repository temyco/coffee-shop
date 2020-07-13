import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_list_view_data.dart';
import 'package:flutterapp/presentation/common/widget/radio_list_widget.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class MilkChooserWidget extends StatelessWidget {
  final String title;
  final List<RadioListViewData> items;
  final Function(int) onItemChecked;

  MilkChooserWidget(this.title, this.items, this.onItemChecked);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: AppTextStyles.overlineBoldPrimary),
        Container(
            margin:
                EdgeInsets.only(top: ProductDetailsDimens.radioListMarginTop),
            child: RadioListWidget(onItemChecked, items))
      ],
    );
  }
}
