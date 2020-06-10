import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/blocs/profile/profile_event.dart';
import 'package:flutterapp/blocs/profile/profile_state.dart';
import 'package:flutterapp/data/data_load_result.dart';
import 'package:flutterapp/data/model/user.dart';
import 'package:flutterapp/data/repository/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final UserRepositoryAPI userRepository;

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
        yield await _loadProfile();
        break;
      case ProfileEvent.GiftPressedEvent:
        yield OpenGiftsState();
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
        yield LoadingState();
        yield await _loadProfile();
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
      return ProfileLoadedState(_user);
    } else {
      _isExpanded = true;
      return ExpandedAchievementsState(_user);
    }
  }

  Future<ProfileState> _loadProfile() async {
    var dataLoadResult = await userRepository.getUserProfile();
    if(dataLoadResult.isSuccessful()) {
      _user = dataLoadResult.data;
      return ProfileLoadedState(_user);
    } else if(dataLoadResult.error == LoadingError.NO_CONNECTION) {
      return NoConnectionState();
    } else {
      return LoadingFailedState();
    }
  }
}
