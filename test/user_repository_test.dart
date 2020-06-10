import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/data/data_load_result.dart';
import 'package:flutterapp/data/repository/user_repository.dart';
import 'mocks/network_manager_mock.dart';

void main() {
  group('UserRepository', () {
    test('no network connection', () async {
      var userRepository = UserRepository(getConnectionManager(false));
      var result = await userRepository.getUserProfile();
      expect(result.isSuccessful(), false);
      expect(result.error, LoadingError.NO_CONNECTION);
    });

    test('validate user is not NULL', () async {
      var userRepository = UserRepository(getConnectionManager(true));
      var result = await userRepository.getUserProfile();
      expect(result.isSuccessful(), true);
      expect(result.data, isNotNull);
    });
  });
}
