import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutterapp/blocs/profile/profile_block.dart';
import 'package:flutterapp/presentation/basket_route.dart';
import 'package:flutterapp/presentation/location_route.dart';
import 'package:flutterapp/presentation/profile/profile_route.dart';
import 'package:flutterapp/presentation/shop_route.dart';
import 'package:flutterapp/resources/strings/app_localizations.dart';

import 'orders_route.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeRouteState();
  }
}

class _HomeRouteState extends State<HomeRoute> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int newIndex) {
    setState(() {
      _selectedTabIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _TabView(selectedTabIndex: _selectedTabIndex),
      bottomNavigationBar: _BottomTabsView(
        selectedTabIndex: _selectedTabIndex,
        onTapListener: _onTabSelected,
      ),
    );
  }
}

/// Creates a tab route for passed [selectedTabIndex].
/// Throws an error if [selectedTabIndex] can not be recognized.
class _TabView extends StatelessWidget {
  final int selectedTabIndex;

  _TabView({
    @required this.selectedTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedTabIndex == locationTabIndex) {
      return LocationRoute();
    } else if (selectedTabIndex == shopTabIndex) {
      return ShopRoute();
    } else if (selectedTabIndex == ordersTabIndex) {
      return OrdersRoute();
    } else if (selectedTabIndex == basketTabIndex) {
      return BasketRoute();
    } else if (selectedTabIndex == profileTabIndex) {
      return BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          userRepository: Injector.getInjector().get(),
        ),
        child: ProfileRoute(),
      );
    } else {
      throw ("Illegal argument exception: invalid selectedTabIndex.");
    }
  }
}

class _BottomTabsView extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTapListener;

  _BottomTabsView({
    @required this.selectedTabIndex,
    @required this.onTapListener,
  });

  @override
  Widget build(BuildContext context) {
    // TODO add correct icons

    return BottomNavigationBar(
      key: Key('BottomNavigationBar'),
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.teal[400],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          title: Text(AppLocalizations.of(context).locationTitle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          title: Text(AppLocalizations.of(context).shopTitle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note),
          title: Text(AppLocalizations.of(context).ordersTitle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text(AppLocalizations.of(context).basketTitle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text(AppLocalizations.of(context).profileTitle),
        ),
      ],
      currentIndex: selectedTabIndex,
      onTap: onTapListener,
    );
  }
}

const int locationTabIndex = 0;
const int shopTabIndex = 1;
const int ordersTabIndex = 2;
const int basketTabIndex = 3;
const int profileTabIndex = 4;
