import 'package:flutterapp/data/network_manager.dart';
import 'package:mockito/mockito.dart';

NetworkManager getConnectionManager(bool hasConnection) {
  var noConnectionManager = MockNetworkManager();
  when(noConnectionManager.hasConnection()).thenAnswer((_) => Future.value(hasConnection));
  return noConnectionManager;
}

class MockNetworkManager extends Mock implements NetworkManager {

}