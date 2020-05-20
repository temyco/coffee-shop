import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_dimens.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_text_letter_spacing.dart';
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

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(AppColors.colorBlackGray,
        statusBarIconBrightness: Brightness.light);
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
                SizedBox(height: ProfileDimens.screenTopMargin),
                _UserProfileInfoWidget(),
                SizedBox(height: ProfileDimens.achievementsMarginTop),
                _AchievementsWidget(),
                SizedBox(
                    height: ProfileDimens.expandAchievementsButtonMarginTop),
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
            onGiftCardsPressed,
            AppImages.bonus,
            AppMessages.bonuses,
            onBonusesPressed,
          ),
          _CardWidget(
            AppMessages.setting.toUpperCase(),
            AppImages.payment,
            AppMessages.paymentMethods,
            onPaymentMethodsPressed,
            AppImages.signOut,
            AppMessages.signOut,
            onSignOutPressed,
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
          SizedBox(height: ProfileDimens.screenTopMargin),
          _UserProfileInfoWidget(),
          SizedBox(height: ProfileDimens.achievementsMarginTop),
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
                    getGridAchievement(
                      index,
                      gridCrossAxisCount,
                    ),
                    SizedBox(
                      height: ProfileDimens.achievementsGridHorizontalSpacing,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: ProfileDimens.collapseAchievementsButtonMarginTop,
          ),
          _ExpandAchievementsLabelWidget(
            onExpandAchievementsPressed,
            true,
          ),
          SizedBox(
            height: ProfileDimens.collapseAchievementsButtonMarginBottom,
          )
        ],
      ),
    );
  }

  onExpandAchievementsPressed() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  onGiftCardsPressed() {
    //TODO will be implemented later
  }

  onBonusesPressed() {
    //TODO will be implemented later
  }

  onPaymentMethodsPressed() {
    //TODO will be implemented later
  }

  onSignOutPressed() {
    //TODO will be implemented later
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
    return Padding(
      padding: EdgeInsets.only(
        left: ProfileDimens.avatarAndNameHolderMarginHorizontal,
        right: ProfileDimens.avatarAndNameHolderMarginHorizontal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserAvatarWidget(),
          SizedBox(
            width: ProfileDimens.avatarHolderMarginRight,
          ),
          _UserInfoWidget(
            'Alex Banner',
            3,
            240,
            500,
          ),
        ],
      ),
    );
  }
}

class _UserAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ProfileDimens.avatarSize,
      height: ProfileDimens.avatarSize,
      margin: EdgeInsets.only(
        top: ProfileDimens.avatarMarginTop,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SvgPicture.asset(
            AppImages.bgUserAvatar,
            height: ProfileDimens.avatarSize,
            width: ProfileDimens.avatarSize,
          ),
          Image.asset(AppImages.userAvatar),
          ArcProgress(
            circleSize: ProfileDimens.avatarSize,
            startAngle: 45,
            endAngle: 225,
            strokeWidth: ProfileDimens.arcProgressStrokeWidth,
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

class _UserInfoWidget extends StatelessWidget {
  final String userName;
  final int stepsToFreeCoffee;
  final int currentExpProgress;
  final int totalExpProgress;

  _UserInfoWidget(
    this.userName,
    this.stepsToFreeCoffee,
    this.currentExpProgress,
    this.totalExpProgress,
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: _UserNameAndStepsWidget(userName, stepsToFreeCoffee),
          ),
          SizedBox(
            height: ProfileDimens.userExperienceHolderMarginTop,
          ),
          Container(
            margin: EdgeInsets.only(
              left: ProfileDimens.userInfoItemsDefaultMargin,
            ),
            width: ProfileDimens.userExperienceProgressTextWidth,
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
                  letterSpacing: AppTextLetterSpacing.spN008,
                ),
                SvgPicture.asset(AppImages.gift)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ProfileDimens.userExperienceProgressMarginLeft,
              top: ProfileDimens.userExperienceProgressMarginTop,
            ),
            width: ProfileDimens.userExperienceProgressBarWidth,
            child: LinearProgress(
              width: ProfileDimens.userExperienceProgressBarWidth -
                  ProfileDimens.userInfoItemsDefaultMargin,
              height: ProfileDimens.userExperienceProgressBarHeight,
              currentProgress: currentExpProgress / totalExpProgress,
              background: AppColors.colorWhite,
              progress: AppColors.colorBondiWaters,
            ),
          )
        ],
      ),
    );
  }
}

class _UserNameAndStepsWidget extends StatelessWidget {
  final String userName;
  final int stepsToFreeCoffee;

  _UserNameAndStepsWidget(
    this.userName,
    this.stepsToFreeCoffee,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: ProfileDimens.userInfoItemsDefaultMargin,
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ProfileDimens.userNameMarginTop,
              ),
              Text(
                userName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.colorLavender,
                  fontSize: AppTextSizes.s17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: AppTextLetterSpacing.spN026,
                ),
              ),
              SizedBox(
                height: ProfileDimens.userInfoItemsDefaultMargin,
              ),
              UIDisplayWidget(
                text: stepsToFreeCoffee.toString() +
                    " " +
                    AppMessages.stepsToFreeCoffee,
                color: AppColors.colorWhite,
                fontSize: AppTextSizes.s10,
                fontWeight: FontWeight.w300,
                letterSpacing: AppTextLetterSpacing.spN008,
              ),
              SizedBox(
                height: ProfileDimens.userInfoItemsDefaultMargin,
              ),
              _StepsToFreeCoffeeWidget(
                itemCount: 5,
                completedCount: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          width: ProfileDimens.editButtonMarginLeft,
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () => {
              //TODO will be implemented later
            },
            borderRadius: BorderRadius.circular(
              ProfileDimens.editButtonSelectorRadius,
            ),
            child: Container(
              padding: EdgeInsets.all(
                ProfileDimens.editButtonHolderPadding,
              ),
              child: SvgPicture.asset(
                AppImages.edit,
                height: ProfileDimens.editButtonSize,
                width: ProfileDimens.editButtonSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StepsToFreeCoffeeWidget extends StatelessWidget {
  final int itemCount;
  final int completedCount;

  _StepsToFreeCoffeeWidget({
    this.itemCount = 5,
    this.completedCount = 0,
  });

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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimens.selectorBorderRadius,
          ),
        ),
        onTap: () => onExpandPressed.call(),
        child: Container(
          padding: EdgeInsets.all(
            ProfileDimens.expandAchievementsPadding,
          ),
          child: Column(
            children: [
              UIDisplayWidget(
                text: AppMessages.achievements.toUpperCase(),
                color: AppColors.colorWhite,
                fontSize: AppTextSizes.s10,
                fontWeight: FontWeight.w500,
                letterSpacing: AppTextLetterSpacing.sp1,
              ),
              SvgPicture.asset(arrowIcon)
            ],
          ),
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
        left: ProfileDimens.joinGameButtonMarginHorizontal,
        top: ProfileDimens.joinGameButtonMarginTop,
        right: ProfileDimens.joinGameButtonMarginHorizontal,
        bottom: ProfileDimens.joinGameButtonMarginBottom,
      ),
      child: MaterialButton(
          onPressed: () => {
                //TODO will be implemented later
              },
          textColor: AppColors.colorWhite,
          color: AppColors.colorBlackGray,
          height: ProfileDimens.joinGameButtonHeight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ProfileDimens.joinGameButtonBorderRadius,
            ),
          ),
          child: UITextWidget(
            text: AppMessages.joinTheGame,
            color: AppColors.colorWhite,
            fontSize: AppTextSizes.s17,
            fontWeight: FontWeight.w700,
            letterSpacing: AppTextLetterSpacing.spN03,
          )),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final String cardTitle;
  final String firstItemIcon;
  final String firstItemTitle;
  final Function() onFirstItemPressed;
  final String secondItemIcon;
  final String secondItemTitle;
  final Function() onSecondItemPressed;

  _CardWidget(
    this.cardTitle,
    this.firstItemIcon,
    this.firstItemTitle,
    this.onFirstItemPressed,
    this.secondItemIcon,
    this.secondItemTitle,
    this.onSecondItemPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorWhite,
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
              color: AppColors.colorShadow,
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
        children: [
          Container(
            margin: EdgeInsets.only(
              left: ProfileDimens.cardTitlePaddingHorizontal,
              right: ProfileDimens.cardTitlePaddingHorizontal,
              bottom: ProfileDimens.cardTitlePaddingBottom,
            ),
            child: UIDisplayWidget(
              text: cardTitle,
              color: AppColors.colorGray,
              fontSize: AppTextSizes.s10,
              fontWeight: FontWeight.w500,
              letterSpacing: AppTextLetterSpacing.sp1,
            ),
          ),
          _CardRowWidget(
            firstItemIcon,
            firstItemTitle,
            onFirstItemPressed,
          ),
          Divider(
            color: AppColors.colorGrayLight,
            height: ProfileDimens.cardItemDividerHeight,
          ),
          _CardRowWidget(
            secondItemIcon,
            secondItemTitle,
            onSecondItemPressed,
          )
        ],
      ),
    );
  }
}

class _CardRowWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onPressed;

  _CardRowWidget(this.icon, this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimens.selectorBorderRadius),
        onTap: onPressed,
        child: Container(
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
              UIDisplayWidget(
                text: title,
                color: AppColors.colorBlackGray,
                fontSize: AppTextSizes.s17,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
