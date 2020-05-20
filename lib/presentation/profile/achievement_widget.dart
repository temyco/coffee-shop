import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_text_letter_spacing.dart';
import 'package:flutterapp/resources/app_text_sizes.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';
import 'package:flutterapp/widgets/text/uidisplay_widget.dart';
import 'package:flutterapp/widgets/text/uitext_widget.dart';

class AchievementWidget extends StatelessWidget {
  final String title;
  final String name;
  final int maxProgress;
  final int currentProgress;
  final Color progressColor;
  final Color progressBgColor;
  final String icon;

  AchievementWidget({
    this.title,
    this.name,
    this.maxProgress,
    this.currentProgress,
    this.progressColor,
    this.icon,
    this.progressBgColor = AppColors.colorShaleGray,
  });

  @override
  Widget build(BuildContext context) {
    int startAngle = -90;
    int endAngle = ((currentProgress.toDouble() / maxProgress) * 360).toInt();

    return Column(
      children: [
        UIDisplayWidget(
          text: title,
          color: AppColors.colorWhite,
          fontSize: AppTextSizes.s10,
          fontWeight: FontWeight.w500,
          letterSpacing: AppTextLetterSpacing.spN008,
        ),
        SizedBox(height: ProfileDimens.achievementProgressMarginTop),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(icon),
            ArcProgress(
              circleSize: ProfileDimens.achievementProgressSize,
              startAngle: startAngle,
              endAngle: endAngle,
              strokeWidth: ProfileDimens.arcProgressStrokeWidth,
              arcColor: progressColor,
              drawBackground: true,
              bgColor: progressBgColor,
            )
          ],
        ),
        SizedBox(height: ProfileDimens.achievementNameMarginTop),
        UIDisplayWidget(
          text: name,
          color: AppColors.colorWhite,
          fontSize: AppTextSizes.s10,
          fontWeight: FontWeight.w500,
          letterSpacing: AppTextLetterSpacing.spN008,
        ),
        SizedBox(height: ProfileDimens.achievementNameMarginBottom),
        UITextWidget(
          text: currentProgress.toString() + "/" + maxProgress.toString(),
          color: AppColors.colorBondiWaters,
          fontSize: AppTextSizes.s10,
          fontWeight: FontWeight.w700,
          letterSpacing: AppTextLetterSpacing.spN008,
        ),
      ],
    );
  }
}
