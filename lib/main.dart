import 'package:flutter/material.dart';
import 'package:flutterapp/messages.dart';

import 'presentation/home_route.dart';
import 'theme.dart';

void main() => runApp(CoffeeShop());

class CoffeeShop extends StatelessWidget {
  const CoffeeShop();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Messages.appTitle,
      theme: mainTheme,
      home: HomeRoute(),
    );
  }
}
