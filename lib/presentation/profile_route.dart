import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';
import 'package:flutterapp/widgets/text/protext_widget.dart';
import 'package:flutterapp/resources/app_text_sizes.dart';
import 'package:flutterapp/widgets/progress/linear_progress.dart';

class ProfileRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileRouteState();
  }
}

class _ProfileRouteState extends State<ProfileRoute> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.colorBlackGray,
        statusBarIconBrightness: Brightness.light));
    return ListView(
      children: [
        Container(
          color: AppColors.colorBlackGray,
          child: Column(
            children: [
              SizedBox(height: 38),
              _UserProfileInfoWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserProfileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UserAvatarWidget(),
        SizedBox(width: 18),
        _UserNameAndStatisticWidget('Alex Banner', 3, 240, 500)
      ],
    );
  }
}

class _UserAvatarWidget extends StatelessWidget {
  final double userAvatarSize = 98;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: userAvatarSize,
      height: userAvatarSize,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SvgPicture.asset(AppImages.bgUserAvatar,
              height: userAvatarSize, width: userAvatarSize),
          Image.asset(AppImages.userAvatar),
          ArcProgress(
              circleSize: userAvatarSize,
              startAngle: 45,
              endAngle: 225,
              strokeWidth: 3,
              color: AppColors.colorBondiWaters),
          Align(
              child: SvgPicture.asset(AppImages.bronzeCup),
              alignment: Alignment.bottomRight),
        ],
      ),
    );
  }
}

class _UserNameAndStatisticWidget extends StatelessWidget {
  final String userName;
  final int stepsToFreeCoffee;
  final int currentExpProgress;
  final int totalExpProgress;

  final double defaultMargin = 4;
  final double progressTextWidth = 124;
  final double progressBarWidth = 118; //width is different just to align text and gift image with linear progress

  _UserNameAndStatisticWidget(this.userName, this.stepsToFreeCoffee,
      this.currentExpProgress, this.totalExpProgress);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            SizedBox(width: defaultMargin),
            ProTextWidget(userName, AppColors.colorLavender, AppTextSizes.s17,
                FontWeight.w500),
            SizedBox(width: 32),
            SvgPicture.asset(AppImages.edit)
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              left: defaultMargin, top: defaultMargin, bottom: defaultMargin),
          child: ProTextWidget(
              stepsToFreeCoffee.toString() +
                  " " +
                  AppMessages.stepsToFreeCoffee,
              AppColors.colorWhite,
              AppTextSizes.s10,
              FontWeight.w300),
        ),
        _StepsToFreeCoffeeWidget(itemCount: 5, completedCount: 2),
        SizedBox(height: 12),
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          width: progressTextWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProTextWidget(
                  currentExpProgress.toString() +
                      '/' +
                      totalExpProgress.toString(),
                  AppColors.colorWhite,
                  AppTextSizes.s10,
                  FontWeight.w500),
              SvgPicture.asset(AppImages.gift)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 7.5, top: 8), //magic number just to align text with linear progress
          width: progressBarWidth,
          child: LinearProgress(
              width: progressBarWidth - defaultMargin,
              height: 6,
              currentProgress: currentExpProgress / totalExpProgress,
              background: AppColors.colorWhite,
              progress: AppColors.colorBondiWaters
          )
        )
      ],
    );
  }
}

class _StepsToFreeCoffeeWidget extends StatelessWidget {
  final int itemCount;
  final int completedCount;

  _StepsToFreeCoffeeWidget({this.itemCount = 5, this.completedCount = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(itemCount, (index) => _buildItem(index)),
    );
  }

  Widget _buildItem(int index) {
    if (index < completedCount) {
      return SvgPicture.asset(AppImages.ticketFilled);
    } else {
      return SvgPicture.asset(AppImages.ticket);
    }
  }
}
