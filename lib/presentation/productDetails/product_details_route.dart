import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/common/viewdata/checkbox_list_view_data.dart';
import 'package:flutterapp/presentation/common/viewdata/radar_chart_view_data.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_group_item_view_data.dart';
import 'package:flutterapp/presentation/common/viewdata/radio_list_view_data.dart';
import 'package:flutterapp/presentation/productDetails/coffee_taste_chart.dart';
import 'package:flutterapp/presentation/productDetails/extras_chooser_widget.dart';
import 'package:flutterapp/presentation/productDetails/horizontal_chooser_widget.dart';
import 'package:flutterapp/presentation/productDetails/milk_chooser_widget.dart';
import 'package:flutterapp/presentation/productDetails/product_description_widget.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_text_sizes.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

/// TODO: 1. Add Grab a croissant widget
/// TODO: 2. Add a view that notifies about adding smth to the basket
/// TODO: 3. Add BLOC for this screen which controls
/// TODO: 4. Add buttons View Basket and Add Again
class ProductDetailsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsRouteState();
  }
}

class _ProductDetailsRouteState extends State<ProductDetailsRoute> {

  bool _isFavoriteSelected = false;
  Color _favoriteIconColor = Colors.grey[300];

  void _onFavoritePressed() {
    setState(() {
      _isFavoriteSelected = !_isFavoriteSelected;
      _favoriteIconColor =
          _isFavoriteSelected ? Colors.pink[300] : Colors.grey[300];
    });
  }

  /// TODO: helper methods will be moved to bloc when it's implemented
  /// Helper methods start

  List<RadioGroupItemViewData> _getSizeItems() {
    List<RadioGroupItemViewData> items = List();
    items.add(RadioGroupItemViewData(
        null,
        'Small',
        '250ml',
        AppColors.charcoalGray,
        AppColors.pinkishGray,
        AppColors.dark,
        AppColors.white,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    items.add(RadioGroupItemViewData(
        AppImages.iconCupMedium,
        'Medium',
        '350ml',
        AppColors.charcoalGray,
        AppColors.pinkishGray,
        AppColors.dark,
        AppColors.white,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    items.add(RadioGroupItemViewData(
        AppImages.iconCupBig,
        'Big',
        '450ml',
        AppColors.charcoalGray,
        AppColors.pinkishGray,
        AppColors.dark,
        AppColors.white,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    return items;
  }

  List<RadioGroupItemViewData> _getBeansItems() {
    List<RadioGroupItemViewData> items = List();
    items.add(RadioGroupItemViewData(
        null,
        'Robusta',
        'Revival',
        AppColors.charcoalGray,
        AppColors.pinkishGray,
        AppColors.dark,
        AppColors.white,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    items.add(RadioGroupItemViewData(
        null,
        'Arabica Blue',
        'Volcano',
        AppColors.charcoalGray,
        AppColors.pinkishGray,
        AppColors.dark,
        AppColors.white,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    items.add(RadioGroupItemViewData(
        null,
        'Swiss Rebel',
        'Decaf',
        AppColors.charcoalGray,
        AppColors.whiteTwo,
        AppColors.dark,
        AppColors.whiteTwo,
        AppColors.paleGray,
        AppColors.charcoalGray,
        AppTextStyles.h4MediumWhite,
        AppTextStyles.h4MediumPrimary));
    return items;
  }

  RadarChartViewData _getRadarChartViewData() {
    return RadarChartViewData(
        [[3, 4, 4, 3, 4], [1, 2, 2, 4, 4]],
        ['Balence', 'Aroma', 'Cream', 'Acidity', 'Body'],
      AppColors.gunMetal08,
      AppTextSizes.s10,
      AppColors.gunMetal08,
      AppColors.dark,
      AppColors.warmGrey
    );
  }

  List<RadioListViewData> _getMilkChoices() {
    return [
      RadioListViewData(
          "Whole Milk",
          AppTextStyles.bodyRegularOrange,
          AppTextStyles.bodyRegularPrimary,
          AppImages.iconRadioCircleSelected,
          AppImages.iconRadioCircleUnselected,
          AppColors.pumpkinOrange,
          AppColors.charcoalGray),
      RadioListViewData(
          "Semi Skimmed",
          AppTextStyles.bodyRegularOrange,
          AppTextStyles.bodyRegularPrimary,
          AppImages.iconRadioCircleSelected,
          AppImages.iconRadioCircleUnselected,
          AppColors.pumpkinOrange,
          AppColors.charcoalGray)
    ];
  }

  List<CheckboxListViewData> _getExtrasChoices() {
    return [
      CheckboxListViewData(
          'Vanilla Syrop',
          '+ \$ 0.5',
          AppTextStyles.bodyRegularOrange,
          AppTextStyles.bodyRegularPrimary,
          AppImages.iconCheckboxChecked,
          AppImages.iconCheckboxUnchecked,
          AppColors.pumpkinOrange,
          AppColors.charcoalGray),
      CheckboxListViewData(
          'Caramel Syrop',
          '+ \$ 0.5',
          AppTextStyles.bodyRegularOrange,
          AppTextStyles.bodyRegularPrimary,
          AppImages.iconCheckboxChecked,
          AppImages.iconCheckboxUnchecked,
          AppColors.pumpkinOrange,
          AppColors.charcoalGray)
    ];
  }

  /// Helper methods end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          AppMessages.productDetailsTitle,
          style: AppTextStyles.h3MediumPrimary,
        )),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            color: _favoriteIconColor,
            onPressed: () {
              setState(() {
                _onFavoritePressed();
              });
            },
          ),
          /// TODO: show/hide this button depending on flag in bloc when it's implemented
          IconButton(icon: SvgPicture.asset(AppImages.iconBasket))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductDescriptionWidget(
                AppImages.imgFlatWhite,
                AppMessages.productName,
                AppMessages.productPrice,
                AppMessages.productDescription),
            HorizontalChooserWidget(AppMessages.sizeOverline, _getSizeItems(), onSizeRadioButtonPressed),
            Padding(
              padding: const EdgeInsets.only(top: ProductDetailsDimens.beansWidgetMarginTop),
              child: HorizontalChooserWidget(AppMessages.chooseBeansOverline, _getBeansItems(), onBeansRadioButtonPressed),
            ),
            Center(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  margin: EdgeInsets.only(
                      top: ProductDetailsDimens.chartWidgetMarginTop,
                      left: ProductDetailsDimens.chartWidgetMarginHorizontal,
                      right: ProductDetailsDimens.chartWidgetMarginHorizontal),
                  child: CoffeeTasteChart(_getRadarChartViewData()),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: ProductDetailsDimens.milkChooserMarginHorizontal,
                    right: ProductDetailsDimens.milkChooserMarginHorizontal),
                child: MilkChooserWidget(AppMessages.chooseMilkOverline, _getMilkChoices(), onMilkRadioButtonPressed)),
            Container(
                margin: EdgeInsets.only(
                    top: ProductDetailsDimens.extrasWidgetMarginTop,
                    left: ProductDetailsDimens.extrasWidgetMarginHorizontal,
                    right: ProductDetailsDimens.extrasWidgetMarginHorizontal),
                child: ExtrasChooserWidget(
                  AppMessages.chooseExtrasOverline,
                  _getExtrasChoices(),
                  onExtrasItemChecked,
                )),
            Container(
                margin: const EdgeInsets.only(
                    top: ProductDetailsDimens.addToBasketButtonMarginTop,
                    left: ProductDetailsDimens.addToBasketButtonMarginHorizontal,
                    right: ProductDetailsDimens.addToBasketButtonMarginHorizontal,
                    bottom: ProductDetailsDimens.addToBasketButtonMarginBottom),
                constraints: BoxConstraints.expand(
                    width: double.infinity,
                    height: ProductDetailsDimens.addToBasketButtonHeight),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            ProductDetailsDimens
                                .addToBasketButtonBorderRadius))),
                    child: Text(AppMessages.addToBasketButtonTitle,
                        style: AppTextStyles.buttonBoldWhite),
                    color: AppColors.dark,
                    onPressed: () {}))
          ],
        ),
      ),
    );
  }

  onSizeRadioButtonPressed(int index) {
    developer.log('onSizeRadioButtonPressed index $index');
  }

  onBeansRadioButtonPressed(int index) {
    developer.log('onBeansRadioButtonPressed index $index');
  }

  onMilkRadioButtonPressed(int index) {
    developer.log('onMilkRadioButtonPressed index $index');
  }

  onExtrasItemChecked(CheckboxListViewData item, bool isChecked) {
    developer.log('${item.title} is checked = $isChecked');
  }

}
