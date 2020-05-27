import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_text_styles.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';

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
    this.progressBgColor = AppColors.charcoalGray,
  });

  @override
  Widget build(BuildContext context) {
    int startAngle = -90;
    int endAngle = ((currentProgress.toDouble() / maxProgress) * 360).toInt();

    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.captionMediumPrimary,
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
        Text(
          name,
          style: AppTextStyles.captionMediumPrimary,
        ),
        SizedBox(height: ProfileDimens.achievementNameMarginBottom),
        Text(
          currentProgress.toString() + "/" + maxProgress.toString(),
          style: AppTextStyles.captionBoldBlue,
        ),
      ],
    );
  }
}
