import 'package:flutter/material.dart';

import 'presentation/home_screen.dart';
import 'theme.dart';

void main() => runApp(CoffeeShop());

class CoffeeShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CoffeeShop",
      theme: mainTheme,
      home: HomeScreen(),
    );
  }
}
