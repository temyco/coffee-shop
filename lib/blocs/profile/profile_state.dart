import 'package:flutterapp/data/model/user.dart';

abstract class ProfileState {

}

class LoadingState extends ProfileState {

}

class ProfileLoadedState extends ProfileState {
  final User user;

  ProfileLoadedState(this.user);
}

class EmptyState extends ProfileState {

}

class LoadingFailedState extends ProfileState {

}

class NoConnectionState extends ProfileState {

}

class ExpandedAchievementsState extends ProfileState {
  final User user;

  ExpandedAchievementsState(this.user);
}

class OpenGiftsState extends ProfileState {

}

