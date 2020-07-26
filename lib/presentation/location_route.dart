import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/presentation/productDetails/product_details_route.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/widgets/status_bar_safe_area.dart';

class LocationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBarSafeArea(
      statusBarColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Text(AppMessages.locationTitle)),

          /// Just need to open product details from somewhere.
          Center(
              child: RaisedButton(
                  child: Text('Open product details stub'),
                  color: Colors.teal[100],
                  onPressed: () {
                    _openProductDetails(context);
                  }))
        ],
      ),
    );
  }
}

void _openProductDetails(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProductDetailsRoute()));
}
