import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutterapp/data/network_manager.dart';
import 'package:flutterapp/data/repository/user_repository.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutter/services.dart';
import 'presentation/home_route.dart';
import 'resources/app_theme.dart';

void main() {
  CoffeeShopModule().initialize();
  runApp(CoffeeShop());
}

class CoffeeShop extends StatelessWidget {
  const CoffeeShop();

  @override
  Widget build(BuildContext context) {
    /// We support only portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: AppMessages.appTitle,
      theme: mainTheme,
      home: HomeRoute(),
    );
  }
}

class CoffeeShopModule {
  initialize() {
    var injector = Injector.getInjector();

    var networkManager = MobileNetworkManager();

    injector.map<UserRepository>((injector) => UserRepositoryImpl(networkManager), isSingleton: true);
  }
}
