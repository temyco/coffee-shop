import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/productDetails/product_details_dimens.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

/// Represents a product description details. Contains product image,
/// product name, product price and product description.
/// Layouts in a row the image and a text block (3 texts in a column).
class ProductDescriptionWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;

  const ProductDescriptionWidget(
      this.image, this.name, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          image: AssetImage(image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ProductDetailsDimens.textDescriptionMarginLeft,
            ),
            Text(
              name,
              style: AppTextStyles.h2BoldPrimary,
            ),
            SizedBox(
              height: ProductDetailsDimens.priceDescriptionMarginTop,
            ),
            Text(
              price,
              style: AppTextStyles.h2MediumSecondary,
            ),
            SizedBox(
              height: ProductDetailsDimens.textDescriptionMarginTop,
            ),
            Text(
              description,
              style: AppTextStyles.bodyRegularQuaternary,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}