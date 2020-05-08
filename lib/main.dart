import 'package:flutter/material.dart';

import 'presentation/home_route.dart';
import 'theme.dart';

void main() => runApp(CoffeeShop());

class CoffeeShop extends StatelessWidget {
  const CoffeeShop();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CoffeeShop",
      theme: mainTheme,
      home: HomeRoute(),
    );
  }
}
