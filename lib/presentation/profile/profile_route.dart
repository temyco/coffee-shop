import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/blocs/profile/profile_block.dart';
import 'package:flutterapp/blocs/profile/profile_event.dart';
import 'package:flutterapp/blocs/profile/profile_state.dart';
import 'package:flutterapp/data/model/achievement.dart';
import 'package:flutterapp/data/model/user.dart';
import 'package:flutterapp/presentation/profile/card_widget.dart';
import 'package:flutterapp/resources/app_integers.dart';
import 'package:flutterapp/presentation/profile/profile_dimens.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_images.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_text_styles.dart';
import 'package:flutterapp/widgets/error_placeholder_widget.dart';
import 'package:flutterapp/widgets/progress/arc_progress.dart';
import 'package:flutterapp/widgets/progress/initial_progress_widget.dart';
import 'package:flutterapp/widgets/progress/linear_progress.dart';
import 'package:flutterapp/presentation/profile/achievement_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/widgets/ripple_widget.dart';
import 'package:flutterapp/widgets/status_bar_safe_area.dart';

class ProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBarSafeArea(
      statusBarColor: AppColors.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      child: _ProfileRouteContent(),
    );
  }
}

class _ProfileRouteContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileRouteContentState();
  }
}

class _ProfileRouteContentState extends State<_ProfileRouteContent> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileEvent.LoadProfileEvent,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is OpenGiftsState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Gifts will be opened when ready :)'),
          ));
        }
      },
      listenWhen: (previous, current) => !_rebuildWidgetStates(current),
      builder: (context, state) {
        if (state is EmptyState) {
          return Container(
            color: AppColors.paleGray,
          );
        } else if (state is LoadingState) {
          return InitialProgressWidget();
        } else if (state is ProfileLoadedState) {
          return _DefaultWidget(state.user);
        } else if (state is ExpandedAchievementsState) {
          return _ExpandedWidget(state.user);
        } else if (state is LoadingFailedState) {
          return ErrorPlaceholderWidget(
            message: AppMessages.loadingProfileFailed,
            onRetryPressed: _onRetryClicked,
          );
        } else if (state is NoConnectionState) {
          return ErrorPlaceholderWidget(
            message: AppMessages.noInternetConnection,
            onRetryPressed: _onRetryClicked,
          );
        } else {
          throw ArgumentError("Unsupported state");
        }
      },
      buildWhen: (previous, current) => _rebuildWidgetStates(current),
    );
  }

  bool _rebuildWidgetStates(ProfileState state) {
    return !(state is OpenGiftsState);
  }

  _onRetryClicked() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.RetryEvent);
  }
}

class _DefaultWidget extends StatelessWidget {
  final User _user;

  _DefaultWidget(this._user);

  @override
  Widget build(BuildContext context) {
    List<Widget> loyaltySystemCardRows = List();
    loyaltySystemCardRows.add(
      CardRowWidget(
        AppImages.giftCards,
        AppMessages.giftCards,
        () => BlocProvider.of<ProfileBloc>(context).add(
          ProfileEvent.GiftPressedEvent,
        ),
      ),
    );
    loyaltySystemCardRows.add(
      CardRowWidget(
        AppImages.bonus,
        AppMessages.bonuses,
        () => BlocProvider.of<ProfileBloc>(context).add(
          ProfileEvent.BonusesPressedEvent,
        ),
      ),
    );

    List<Widget> settingsCardsRow = List();
    settingsCardsRow.add(
      CardRowWidget(
        AppImages.payment,
        AppMessages.paymentMethods,
        () => BlocProvider.of<ProfileBloc>(context).add(
          ProfileEvent.PaymentMethodsPressedEvent,
        ),
      ),
    );
    settingsCardsRow.add(
      CardRowWidget(
        AppImages.signOut,
        AppMessages.signOut,
        () => BlocProvider.of<ProfileBloc>(context).add(
          ProfileEvent.SignOutPressedEvent,
        ),
      ),
    );

    return Container(
      color: AppColors.paleGray,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          _DefaultHeaderWidget(_user),
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
  final User _user;

  _ExpandedWidget(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: Column(
        children: [
          SizedBox(height: ProfileDimens.screenTopMargin),
          _UserProfileInfoWidget(_user),
          SizedBox(height: ProfileDimens.achievementsMarginTop),
          _AchievementGridWidget(_user.achievements),
          SizedBox(
            height: ProfileDimens.collapseAchievementsButtonMarginTop,
          ),
          _ExpandAchievementsLabelWidget(
            () => BlocProvider.of<ProfileBloc>(context).add(
              ProfileEvent.ExpandAchievementsEvent,
            ),
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
  final User _user;

  _DefaultHeaderWidget(this._user);

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
          _UserProfileInfoWidget(_user),
          SizedBox(height: ProfileDimens.achievementsMarginTop),
          _AchievementsWidget(_user.achievements),
          SizedBox(height: ProfileDimens.expandAchievementsButtonMarginTop),
          _ExpandAchievementsLabelWidget(
            () => BlocProvider.of<ProfileBloc>(context).add(
              ProfileEvent.ExpandAchievementsEvent,
            ),
            false,
          ),
        ],
      ),
    );
  }
}

class _AchievementGridWidget extends StatelessWidget {
  final List<Achievement> _achievements;

  _AchievementGridWidget(this._achievements);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: AppIntegers.profileGridColumnCount,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        itemCount: _achievements.length,
        itemBuilder: (context, index) {
          Achievement achievement = _achievements[index];
          AchievementResourcesHolder resourcesHolder =
              getAchievementResourcesHolder(achievement);

          return Container(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                AchievementWidget(
                  title: achievement.type,
                  name: achievement.name,
                  maxProgress: achievement.maxProgress,
                  currentProgress: achievement.currentProgress,
                  progressColor: resourcesHolder.progressColor,
                  icon: resourcesHolder.icon,
                ),
                SizedBox(
                  height: ProfileDimens.achievementsGridHorizontalSpacing,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _UserProfileInfoWidget extends StatelessWidget {
  final User _user;

  _UserProfileInfoWidget(this._user);

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
          _UserAvatarWidget(), //TODO display avatar and level from the User
          SizedBox(
            width: ProfileDimens.avatarHolderMarginRight,
          ),
          _UserInfoWidget(
            _user.name,
            _user.completedStepsToFreeCoffee,
            _user.requiredStepsToFreeCoffee,
            _user.currentLevelExperience,
            _user.maxLevelExperience,
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
  final int completedStepsToFreeCoffee;
  final int requiredStepsToFreeCoffee;
  final int currentExpProgress;
  final int totalExpProgress;

  _UserInfoWidget(
    this.userName,
    this.completedStepsToFreeCoffee,
    this.requiredStepsToFreeCoffee,
    this.currentExpProgress,
    this.totalExpProgress,
  );

  @override
  Widget build(BuildContext context) {
    String currentExperience = currentExpProgress.toString() +
        '/' +
        totalExpProgress.toString() +
        ' ' +
        AppMessages.exp;

    double linearProgressWidth = ProfileDimens.userExperienceProgressBarWidth -
        ProfileDimens.userInfoItemsDefaultMargin;

    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _UserNameAndStepsWidget(
            userName,
            completedStepsToFreeCoffee,
            requiredStepsToFreeCoffee,
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
                  currentExperience,
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
              width: linearProgressWidth,
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
  final int completedStepsToFreeCoffee;
  final int requiredStepsToFreeCoffee;

  _UserNameAndStepsWidget(
    this.userName,
    this.completedStepsToFreeCoffee,
    this.requiredStepsToFreeCoffee,
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ProfileDimens.userInfoItemsDefaultMargin,
          ),
          Flexible(
            fit: FlexFit.loose,
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
                  (requiredStepsToFreeCoffee - completedStepsToFreeCoffee)
                          .toString() +
                      " " +
                      AppMessages.stepsToFreeCoffee,
                  style: AppTextStyles.captionLightSecondary,
                ),
                SizedBox(
                  height: ProfileDimens.userInfoItemsDefaultMargin,
                ),
                _StepsToFreeCoffeeWidget(
                  itemCount: requiredStepsToFreeCoffee,
                  completedCount: completedStepsToFreeCoffee,
                ),
              ],
            ),
          ),
          SizedBox(
            width: ProfileDimens.editButtonMarginLeft,
          ),
          RippleWidget(
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
            borderRadius: ProfileDimens.editButtonSelectorRadius,
            onTap: () => BlocProvider.of<ProfileBloc>(context).add(
              ProfileEvent.EditEvent,
            ),
          ),
        ],
      ),
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
      mainAxisSize: MainAxisSize.min,
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
  final List<Achievement> achievements;

  _AchievementsWidget(this.achievements);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();

    if (achievements != null) {
      var countToDisplay =
          achievements.length > AppIntegers.profileGridColumnCount
              ? AppIntegers.profileGridColumnCount
              : achievements.length;

      for (int i = 0; i < countToDisplay; i++) {
        Achievement achievement = achievements[i];
        AchievementResourcesHolder resourcesHolder =
            getAchievementResourcesHolder(achievement);

        widgets.add(Expanded(
          flex: 1,
          child: AchievementWidget(
            title: achievement.type,
            name: achievement.name,
            maxProgress: achievement.maxProgress,
            currentProgress: achievement.currentProgress,
            progressColor: resourcesHolder.progressColor,
            icon: resourcesHolder.icon,
          ),
        ));
      }
    }

    return Row(
      children: widgets,
    );
  }
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

    return RippleWidget(
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
      onTap: () => onExpandPressed.call(),
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
        onPressed: () => BlocProvider.of<ProfileBloc>(context).add(
          ProfileEvent.JoinTheGameEvent,
        ),
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
        ),
      ),
    );
  }
}

AchievementResourcesHolder getAchievementResourcesHolder(
    Achievement achievement) {
  var holder = AchievementResourcesHolder();

  switch (achievement.level) {
    case AchievementLevels.beginner:
      holder.icon = AppImages.silverMedal;
      holder.progressColor = AppColors.turquoiseBlue;
      break;
    case AchievementLevels.proficient:
      holder.icon = AppImages.goldMedal;
      holder.progressColor = AppColors.orange;
      break;
    case AchievementLevels.expert:
      holder.icon = AppImages.goldCup;
      holder.progressColor = AppColors.pumpkinOrange;
      break;
  }

  return holder;
}

class AchievementResourcesHolder {
  String icon;
  Color progressColor;
}
