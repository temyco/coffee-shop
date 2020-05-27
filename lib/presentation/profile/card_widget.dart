import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_dimens.dart';
import 'package:flutterapp/resources/app_text_styles.dart';
import 'package:flutterapp/widgets/ripple_widget.dart';

class CardWidget extends StatelessWidget {
  final String cardTitle;
  final List<Widget> children = List();

  CardWidget(this.cardTitle, List<Widget> rows) {
    children.add(CardRowHeader(cardTitle));

    for (int index = 0; index < rows.length; index++) {
      Widget row = rows[index];
      children.add(row);
      if (index != rows.length - 1) {
        children.add(Divider(
          color: AppColors.divider,
          height: ProfileDimens.cardItemDividerHeight,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            ProfileDimens.cardBorderRadius,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(
                ProfileDimens.cardShadowOffsetX,
                ProfileDimens.cardShadowOffsetY,
              ),
              blurRadius: ProfileDimens.cardShadowRadius,
              color: AppColors.cardShadow,
            )
          ]),
      margin: EdgeInsets.only(
        left: AppDimens.cardMarginHorizontal,
        right: AppDimens.cardMarginHorizontal,
        bottom: AppDimens.cardMarginVertical,
      ),
      padding: EdgeInsets.only(
        left: AppDimens.cardPaddingHorizontal,
        right: AppDimens.cardPaddingHorizontal,
        top: AppDimens.cardPaddingVertical,
        bottom: AppDimens.cardPaddingVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class CardRowHeader extends StatelessWidget {
  final String title;

  CardRowHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ProfileDimens.cardTitlePaddingHorizontal,
        right: ProfileDimens.cardTitlePaddingHorizontal,
        bottom: ProfileDimens.cardTitlePaddingBottom,
      ),
      child: Text(
        title,
        style: AppTextStyles.overlineMediumGunMetal08,
      ),
    );
  }
}

class CardRowWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onPressed;

  CardRowWidget(this.icon, this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RippleWidget(
      child: Padding(
        padding: EdgeInsets.only(
          top: ProfileDimens.cardItemPaddingVertical,
          bottom: ProfileDimens.cardItemPaddingVertical,
          right: ProfileDimens.cardItemPaddingHorizontal,
          left: ProfileDimens.cardItemPaddingHorizontal,
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: ProfileDimens.cardItemIconMarginRight,
            ),
            Text(
              title,
              style: AppTextStyles.h3RegularPrimary,
            )
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}