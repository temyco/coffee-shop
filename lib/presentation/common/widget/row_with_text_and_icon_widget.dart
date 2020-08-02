import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';

class RowWithTextAndIconWidget extends StatelessWidget {

  final String title;
  final String icon;
  final TextStyle titleTextStyle;
  final Color iconColor;

  RowWithTextAndIconWidget(this.title, this.icon, this.titleTextStyle, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: ProductDetailsDimens.rowWithTextAndIconPassingTop),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title, style: titleTextStyle,),
              SvgPicture.asset(icon, color: iconColor),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: ProductDetailsDimens.rowWithTextAndIconPassingTop),
          child: Divider(),
        )
      ],
    );
  }
}