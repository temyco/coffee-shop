import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/common/viewdata/checkbox_list_item_view_data.dart';
import 'package:flutterapp/presentation/common/widget/checkbox_list_item_widget.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class ExtrasChooserWidget extends StatelessWidget {
  final String title;
  final List<CheckboxListItemViewData> items;
  final Function(CheckboxListItemViewData, bool) onItemChecked;

  ExtrasChooserWidget(this.title, this.items, this.onItemChecked);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();
    children.add(Container(
      margin: const EdgeInsets.only(bottom: ProductDetailsDimens.checkboxListMarginTop),
      child: Text(title, style: AppTextStyles.overlineBoldPrimary),
    ));

    for (int i = 0; i < items.length; i++) {
      children.add(CheckboxListItemWidget(onItemChecked, items[i], false));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}