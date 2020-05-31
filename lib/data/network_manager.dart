import 'package:connectivity/connectivity.dart';

///abstract class to mock it during tests
abstract class NetworkManagerAPI {
  Future<bool> hasConnection();
}

class MobileNetworkManager implements NetworkManagerAPI {
  @override
  Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}