import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutter/services.dart';
import 'presentation/home_route.dart';
import 'resources/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(CoffeeShop());

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ua', ''),
      ],
    );
  }
}
