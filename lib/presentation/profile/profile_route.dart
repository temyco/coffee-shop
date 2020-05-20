import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_theme.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';
import 'package:flutterapp/resources/app_text_sizes.dart';
import 'package:flutterapp/widgets/progress/linear_progress.dart';
import 'package:flutterapp/presentation/profile/achievement_widget.dart';
import 'package:flutterapp/widgets/text/uidisplay_widget.dart';
import 'package:flutterapp/widgets/text/uitext_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileRouteState();
  }
}

class _ProfileRouteState extends State<ProfileRoute> {
  bool isExpanded = false;

  onExpandAchievementsPressed() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(AppColors.colorBlackGray, statusBarIconBrightness: Brightness.light);
    return _getProfileWidget();
  }

  Widget _getProfileWidget() {
    if (isExpanded) {
      return _getExpandedWidget();
    } else {
      return _getDefaultWidget();
    }
  }

  Widget _getDefaultWidget() {
    return Container(
      color: AppColors.colorWhiteGray,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.profileHeader),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 38),
                _UserProfileInfoWidget(),
                SizedBox(height: 20),
                _AchievementsWidget(),
                SizedBox(height: 32),
                _ExpandAchievementsLabelWidget(
                  onExpandAchievementsPressed,
                  false,
                ),
              ],
            ),
          ),
          _JoinTheGameWidget(),
          _CardWidget(
            AppMessages.loyaltySystem.toUpperCase(),
            AppImages.giftCards,
            AppMessages.giftCards,
            AppImages.bonus,
            AppMessages.bonuses,
          ),
          _CardWidget(
            AppMessages.setting.toUpperCase(),
            AppImages.payment,
            AppMessages.paymentMethods,
            AppImages.signOut,
            AppMessages.signOut,
          ),
        ],
      ),
    );
  }

  Widget _getExpandedWidget() {
    int gridCrossAxisCount = 3;
    return Container(
      color: AppColors.colorBlackGray,
      child: Column(
        children: [
          SizedBox(height: 38),
          _UserProfileInfoWidget(),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: gridCrossAxisCount,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemCount: 24,
              itemBuilder: (context, index) => Container(
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: [
                    getGridAchievement(index, gridCrossAxisCount),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          _ExpandAchievementsLabelWidget(onExpandAchievementsPressed, true),
          SizedBox(height: 6)
        ],
      ),
    );
  }
}

Widget getGridAchievement(int index, int crossAxisCount) {
  switch (index % crossAxisCount) {
    case 0:
      return _DailyAchievement();
    case 1:
      return _RandomAchievement();
    default:
      return _BossAchievement();
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
        _UserNameAndStatisticWidget(
          'Alex Banner',
          3,
          240,
          500,
        )
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
          SvgPicture.asset(
            AppImages.bgUserAvatar,
            height: userAvatarSize,
            width: userAvatarSize,
          ),
          Image.asset(AppImages.userAvatar),
          ArcProgress(
            circleSize: userAvatarSize,
            startAngle: 45,
            endAngle: 225,
            strokeWidth: 3,
            arcColor: AppColors.colorBondiWaters,
          ),
          Align(
            child: SvgPicture.asset(AppImages.bronzeCup),
            alignment: Alignment.bottomRight,
          ),
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
  final double progressBarWidth =
      118; //width is different just to align text and gift image with linear progress

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
            UIDisplayWidget(
              text: userName,
              color: AppColors.colorLavender,
              fontSize: AppTextSizes.s17,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.26,
            ),
            SizedBox(width: 32),
            SvgPicture.asset(AppImages.edit)
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: defaultMargin,
            bottom: defaultMargin,
          ),
          child: UIDisplayWidget(
            text: stepsToFreeCoffee.toString() +
                " " +
                AppMessages.stepsToFreeCoffee,
            color: AppColors.colorWhite,
            fontSize: AppTextSizes.s10,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.08,
          ),
        ),
        _StepsToFreeCoffeeWidget(
          itemCount: 5,
          completedCount: 2,
        ),
        SizedBox(height: 12),
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          width: progressTextWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIDisplayWidget(
                text: currentExpProgress.toString() +
                    '/' +
                    totalExpProgress.toString() +
                    ' ' +
                    AppMessages.exp,
                color: AppColors.colorWhite,
                fontSize: AppTextSizes.s10,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.08,
              ),
              SvgPicture.asset(AppImages.gift)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 7.5,
            top: 8,
          ),
          //magic number just to align text with linear progress
          width: progressBarWidth,
          child: LinearProgress(
            width: progressBarWidth - defaultMargin,
            height: 6,
            currentProgress: currentExpProgress / totalExpProgress,
            background: AppColors.colorWhite,
            progress: AppColors.colorBondiWaters,
          ),
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

class _AchievementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DailyAchievement(),
          flex: 1,
        ),
        Expanded(
          child: _RandomAchievement(),
          flex: 1,
        ),
        Expanded(
          child: _BossAchievement(),
          flex: 1,
        ),
      ],
    );
  }
}

class _DailyAchievement extends AchievementWidget {
  _DailyAchievement()
      : super(
          title: AppMessages.daily,
          name: AppMessages.destroyedCroissants,
          maxProgress: 20,
          currentProgress: 7,
          progressColor: AppColors.colorOrange,
          icon: AppImages.goldMedal,
        );
}

class _RandomAchievement extends AchievementWidget {
  _RandomAchievement()
      : super(
          title: AppMessages.random,
          name: AppMessages.drankLattes,
          maxProgress: 10,
          currentProgress: 3,
          progressColor: AppColors.colorTangerine,
          icon: AppImages.goldCup,
        );
}

class _BossAchievement extends AchievementWidget {
  _BossAchievement()
      : super(
          title: AppMessages.boss,
          name: AppMessages.drankAmericanos,
          maxProgress: 3,
          currentProgress: 2,
          progressColor: AppColors.colorBondiWaters,
          icon: AppImages.silverMedal,
        );
}

class _ExpandAchievementsLabelWidget extends StatelessWidget {
  final Function() onExpandPressed;
  final bool isExpanded;

  _ExpandAchievementsLabelWidget(this.onExpandPressed, this.isExpanded);

  @override
  Widget build(BuildContext context) {
    String arrowIcon;
    if (isExpanded) {
      arrowIcon = AppImages.arrowUp;
    } else {
      arrowIcon = AppImages.arrowDown;
    }
    return GestureDetector(
      onTap: () => onExpandPressed.call(),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            UIDisplayWidget(
              text: AppMessages.achievements.toUpperCase(),
              color: AppColors.colorWhite,
              fontSize: AppTextSizes.s10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
            SvgPicture.asset(arrowIcon)
          ],
        ),
      ),
    );
  }
}

class _JoinTheGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 46,
        top: 16,
        right: 46,
        bottom: 20,
      ),
      child: MaterialButton(
          onPressed: () => {
                //TODO will be implemented later
              },
          textColor: AppColors.colorWhite,
          color: AppColors.colorBlackGray,
          height: 44,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: UITextWidget(
            text: AppMessages.joinTheGame,
            color: AppColors.colorWhite,
            fontSize: AppTextSizes.s17,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          )),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final String cardTitle;
  final String firstItemIcon;
  final String firstItemTitle;
  final String secondItemIcon;
  final String secondItemTitle;

  _CardWidget(
    this.cardTitle,
    this.firstItemIcon,
    this.firstItemTitle,
    this.secondItemIcon,
    this.secondItemTitle,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: AppColors.colorShadow,
            )
          ]),
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 10,
      ),
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 4,
              right: 4,
              bottom: 10,
            ),
            child: UIDisplayWidget(
              text: cardTitle,
              color: AppColors.colorGray,
              fontSize: AppTextSizes.s10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          _CardRowWidget(
            firstItemIcon,
            firstItemTitle,
          ),
          Divider(
            color: AppColors.colorGrayLight,
            height: 1,
          ),
          _CardRowWidget(
            secondItemIcon,
            secondItemTitle,
          )
        ],
      ),
    );
  }
}

class _CardRowWidget extends StatelessWidget {
  final String icon;
  final String title;

  _CardRowWidget(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 4,
        left: 4,
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 15),
          UIDisplayWidget(
            text: title,
            color: AppColors.colorBlackGray,
            fontSize: AppTextSizes.s17,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
