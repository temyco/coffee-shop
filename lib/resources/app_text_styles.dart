import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_text_letter_spacing.dart';
import 'package:flutterapp/resources/app_text_sizes.dart';

/// All project's text styles located on:
/// https://app.zeplin.io/project/5ebd52f3c3b62d4b25115ecd/screen/5ebe8e8738a1a0335abb2550
///
/// Note: text styles don't manage text alignment and characters capitalizing.
/// All text styles with 'overline' prefix must be capitalized in corresponding widget.
class AppTextStyles {

  /// TODO: Use AppTextFamilies constants when it's merged for fontFamily to master.

  static const TextStyle h1MediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s25,
    fontWeight: FontWeight.w500,
    color: AppColors.charcoalGray,
  );

  static const TextStyle h2BoldPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s20,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
  );

  static const TextStyle h2MediumSecondary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s20,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.spN04,
  );

  static const TextStyle h3MediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s17,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.spN023,
  );

  static const TextStyle h3MediumSecondary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s17,
    fontWeight: FontWeight.w500,
    color: AppColors.charcoalGray,
    letterSpacing: AppTextLetterSpacing.spN023,
  );

  static const TextStyle h3RegularPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s17,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static const TextStyle h4BoldPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.spN02,
  );

  static const TextStyle h4MediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w500,
    color: AppColors.charcoalGray,
    letterSpacing: AppTextLetterSpacing.spN026,
  );

  static const TextStyle h4MediumSecondary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w500,
    color: AppColors.charcoalGray,
    letterSpacing: AppTextLetterSpacing.spN026,
  );

  static const TextStyle h4MediumWhite = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w500,
    color: AppColors.paleGray,
    letterSpacing: AppTextLetterSpacing.spN026,
  );

  static const TextStyle h4RegularSecondary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoalGray,
    letterSpacing: AppTextLetterSpacing.spN026,
  );

  static const TextStyle h4RegularQuaternary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w400,
    color: AppColors.gunMetal08,
    letterSpacing: AppTextLetterSpacing.spN026,
  );

  static const TextStyle h4RegularTertiary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w400,
    color: AppColors.gunMetal,
    letterSpacing: AppTextLetterSpacing.spN02,
  );

  static const TextStyle overlineBoldPrimary = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w700,
    color: AppColors.charcoalGray,
    letterSpacing: AppTextLetterSpacing.spN017,
  );

  static const TextStyle overlineBoldQuaternary = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w700,
    color: AppColors.gunMetal08,
    letterSpacing: AppTextLetterSpacing.spN017,
  );

  static const TextStyle overlineMediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.sp15,
  );

  static const TextStyle overlineMediumRedOrange = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s15,
    fontWeight: FontWeight.w500,
    color: AppColors.redOrange,
  );

  static const TextStyle overlineMediumQuaternary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s10,
    fontWeight: FontWeight.w500,
    color: AppColors.gunMetal08,
    letterSpacing: AppTextLetterSpacing.sp1,
  );

  static const TextStyle bodyMediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );

  static const TextStyle bodyMediumSecondary = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.spN01,
  );

  static const TextStyle bodyMediumTertiary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w500,
    color: AppColors.gunMetal,
  );

  static const TextStyle bodyRegularPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoalGray,
  );

  static const TextStyle bodyRegularQuaternary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w400,
    color: AppColors.gunMetal08,
  );

  static const TextStyle bodyLightPrimary = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w300,
    color: AppColors.dark,
    letterSpacing: AppTextLetterSpacing.spN01,
  );

  static const TextStyle bodyLightOrange = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s13,
    fontWeight: FontWeight.w300,
    color: AppColors.pumpkinOrange,
    letterSpacing: AppTextLetterSpacing.spN01,
  );

  static const TextStyle captionBoldBlue = TextStyle(
    fontFamily: 'SFUIText',
    fontSize: AppTextSizes.s10,
    fontWeight: FontWeight.w700,
    color: AppColors.turquoiseBlue,
    letterSpacing: AppTextLetterSpacing.spN008,
  );

  static const TextStyle captionMediumPrimary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s10,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    letterSpacing: AppTextLetterSpacing.spN008,
  );

  static const TextStyle captionLightSecondary = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontSize: AppTextSizes.s10,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    letterSpacing: AppTextLetterSpacing.spN008,
  );
}