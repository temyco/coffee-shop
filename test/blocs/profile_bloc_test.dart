import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/blocs/profile/profile_block.dart';
import 'package:flutterapp/blocs/profile/profile_event.dart';
import 'package:flutterapp/blocs/profile/profile_state.dart';
import 'package:flutterapp/data/model/user.dart';
import 'package:flutterapp/data/repository/user_repository.dart';

import '../mocks/network_manager_mock.dart';

void main() {

  ProfileBloc profileBloc;

  initProfileBloc(bool hasConnection) {
    UserRepository userRepository = UserRepository(getConnectionManager(hasConnection));
    profileBloc = ProfileBloc(userRepository: userRepository);
  }

  tearDown(() {
    profileBloc.close();
  });

  test('initial state', () {
    initProfileBloc(true); //doesn't matter here

    expect(profileBloc.initialState, EmptyState());
  });

  test('screen started: no connection', () {
    initProfileBloc(false);

    final expectedStates = [
      EmptyState(),
      LoadingState(),
      NoConnectionState()
    ];

    expectLater(
      profileBloc,
      emitsInOrder(expectedStates),
    );

    profileBloc.add(ProfileEvent.LoadProfileEvent);
  });

  test('screen started: data loaded successfully', () {
    initProfileBloc(true);

    final expectedStates = [
      EmptyState(),
      LoadingState(),
      ProfileLoadedState(User())
    ];

    expectLater(
      profileBloc,
      emitsInOrder(expectedStates),
    );

    profileBloc.add(ProfileEvent.LoadProfileEvent);
  });

  test('open gifts', () {
    initProfileBloc(true); //doesn't matter here

    final expectedStates = [
      EmptyState(),
      OpenGiftsState()
    ];

    profileBloc.add(ProfileEvent.GiftPressedEvent);

    expectLater(
      profileBloc,
      emitsInOrder(expectedStates),
    );
  });
}
