import 'package:flutterapp/data/model/user.dart';

abstract class ProfileState {

}

class LoadingState extends ProfileState {

}

class DisplayProfileState extends ProfileState {
  final User user;

  DisplayProfileState(this.user);
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

