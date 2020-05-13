import 'package:flutter/material.dart';
import 'package:flutterapp/messages.dart';
import 'package:flutterapp/presentation/product_details_route.dart';

class LocationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Text(Messages.locationTitle)),
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
