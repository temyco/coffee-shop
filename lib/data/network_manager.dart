import 'package:connectivity/connectivity.dart';

///abstract class to mock it during tests
abstract class NetworkManager {
  Future<bool> hasConnection();
}

class MobileNetworkManager implements NetworkManager {
  @override
  Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}