import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/blocs/profile/profile_event.dart';
import 'package:flutterapp/blocs/profile/profile_state.dart';
import 'package:flutterapp/data/model/user.dart';
import 'package:flutterapp/data/repository/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  bool _isExpanded = false;
  User _user;

  ProfileBloc({
    @required this.userRepository,
  });

  @override
  ProfileState get initialState => EmptyState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    switch (event) {
      case ProfileEvent.ExpandAchievementsEvent:
        yield _handleExpandAchievementsEvent();
        break;
      case ProfileEvent.LoadProfileEvent:
        yield LoadingState();
        _user = await userRepository.getUserProfile();
        if (_user == null) {
          yield LoadingFailedState();
        } else {
          yield DisplayProfileState(_user);
        }
        break;
      case ProfileEvent.GiftPressedEvent:
        //TODO implement
        break;
      case ProfileEvent.BonusesPressedEvent:
        //TODO implement
        break;
      case ProfileEvent.PaymentMethodsPressedEvent:
        //TODO implement
        break;
      case ProfileEvent.SignOutPressedEvent:
        //TODO implement
        break;
      case ProfileEvent.RetryEvent:
        //TODO implement
        break;
      case ProfileEvent.JoinTheGameEvent:
        //TODO implement
        break;
      case ProfileEvent.EditEvent:
        //TODO implement
        break;
    }
  }

  ProfileState _handleExpandAchievementsEvent() {
    if (_user == null) {
      return LoadingFailedState();
    } else if (_isExpanded) {
      _isExpanded = false;
      return DisplayProfileState(_user);
    } else {
      _isExpanded = true;
      return ExpandedAchievementsState(_user);
    }
  }
}
