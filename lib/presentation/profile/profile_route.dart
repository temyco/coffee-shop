import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/presentation/profile/card_widget.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_dimens.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_text_styles.dart';
import 'package:flutterapp/resources/app_theme.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';
import 'package:flutterapp/widgets/progress/linear_progress.dart';
import 'package:flutterapp/presentation/profile/achievement_widget.dart';
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
    setStatusBarColor(
      AppColors.dark,
      statusBarIconBrightness: Brightness.light,
    );

    Widget widgetToShow;

    if (isExpanded) {
      widgetToShow = _ExpandedWidget(
        onExpandAchievementsPressed,
      );
    } else {
      widgetToShow = _DefaultWidget(
        onExpandAchievementsPressed,
        onGiftCardsPressed,
        onBonusesPressed,
        onPaymentMethodsPressed,
        onSignOutPressed,
      );
    }

    return widgetToShow;
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

class _DefaultWidget extends StatelessWidget {
  final Function() onExpandAchievementsPressed;
  final Function() onGiftCardsPressed;
  final Function() onBonusesPressed;
  final Function() onPaymentMethodsPressed;
  final Function() onSignOutPressed;

  _DefaultWidget(
    this.onExpandAchievementsPressed,
    this.onGiftCardsPressed,
    this.onBonusesPressed,
    this.onPaymentMethodsPressed,
    this.onSignOutPressed,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> loyaltySystemCardRows = List();
    loyaltySystemCardRows.add(
      CardRowWidget(
        AppImages.giftCards,
        AppMessages.giftCards,
        onGiftCardsPressed,
      ),
    );
    loyaltySystemCardRows.add(
      CardRowWidget(
        AppImages.bonus,
        AppMessages.bonuses,
        onBonusesPressed,
      ),
    );

    List<Widget> settingsCardsRow = List();
    settingsCardsRow.add(
      CardRowWidget(
        AppImages.payment,
        AppMessages.paymentMethods,
        onPaymentMethodsPressed,
      ),
    );
    settingsCardsRow.add(
      CardRowWidget(
        AppImages.signOut,
        AppMessages.signOut,
        onSignOutPressed,
      ),
    );

    return Container(
      color: AppColors.paleGray,
      child: ListView(
        children: [
          _DefaultHeaderWidget(onExpandAchievementsPressed),
          _JoinTheGameWidget(),
          CardWidget(
            AppMessages.loyaltySystem.toUpperCase(),
            loyaltySystemCardRows,
          ),
          CardWidget(
            AppMessages.setting.toUpperCase(),
            settingsCardsRow,
          ),
        ],
      ),
    );
  }
}

class _ExpandedWidget extends StatelessWidget {
  final int gridCrossAxisCount = 3;
  final Function() onExpandAchievementsPressed;

  _ExpandedWidget(this.onExpandAchievementsPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
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
}

class _DefaultHeaderWidget extends StatelessWidget {
  final Function() onExpandAchievementsPressed;

  _DefaultHeaderWidget(this.onExpandAchievementsPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: ProfileDimens.expandAchievementsButtonMarginTop),
          _ExpandAchievementsLabelWidget(
            onExpandAchievementsPressed,
            false,
          ),
        ],
      ),
    );
  }
}

//it's just for testing. With real API this functional will be based on real
//Achievements list and then no needs in such method to generate test data.
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
            arcColor: AppColors.turquoiseBlue,
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
                Text(
                  currentExpProgress.toString() +
                      '/' +
                      totalExpProgress.toString() +
                      ' ' +
                      AppMessages.exp,
                  style: AppTextStyles.captionMediumPrimary,
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
              background: AppColors.white,
              progress: AppColors.turquoiseBlue,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: ProfileDimens.userInfoItemsDefaultMargin,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ProfileDimens.userNameMarginTop,
              ),
              Text(
                userName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4MediumWhite,
              ),
              SizedBox(
                height: ProfileDimens.userInfoItemsDefaultMargin,
              ),
              Text(
                stepsToFreeCoffee.toString() +
                    " " +
                    AppMessages.stepsToFreeCoffee,
                style: AppTextStyles.captionLightSecondary,
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
            child: Padding(
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
          progressColor: AppColors.orange,
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
          progressColor: AppColors.pumpkinOrange,
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
          progressColor: AppColors.turquoiseBlue,
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
        child: Padding(
          padding: EdgeInsets.all(
            ProfileDimens.expandAchievementsPadding,
          ),
          child: Column(
            children: [
              Text(
                AppMessages.achievements.toUpperCase(),
                style: AppTextStyles.overlineMediumWhite,
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
    return Padding(
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
          textColor: AppColors.white,
          color: AppColors.dark,
          height: ProfileDimens.joinGameButtonHeight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ProfileDimens.joinGameButtonBorderRadius,
            ),
          ),
          child: Text(
            AppMessages.joinTheGame,
            style: AppTextStyles.buttonBoldWhite,
          )),
    );
  }
}
