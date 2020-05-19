import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/resources/app_colors.dart';
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

  AchievementWidget(
      {this.title,
      this.name,
      this.maxProgress,
      this.currentProgress,
      this.progressColor,
      this.icon,
      this.progressBgColor = AppColors.colorShaleGray});

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
          letterSpacing: -0.08,
        ),
        SizedBox(height: 10),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(icon),
            ArcProgress(
              circleSize: 46,
              startAngle: startAngle,
              endAngle: endAngle,
              strokeWidth: 3,
              arcColor: progressColor,
              drawBackground: true,
              bgColor: progressBgColor,
            )
          ],
        ),
        SizedBox(height: 6),
        UIDisplayWidget(
          text: name,
          color: AppColors.colorWhite,
          fontSize: AppTextSizes.s10,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.08,
        ),
        SizedBox(height: 2),
        UITextWidget(
          text: currentProgress.toString() + "/" + maxProgress.toString(),
          color: AppColors.colorBondiWaters,
          fontSize: AppTextSizes.s10,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.08,
        ),
      ],
    );
  }
}
