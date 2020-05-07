import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Hello World')),
            Center(
                child: RaisedButton(
                    child: Text('Open product details stub'),
                    color: Colors.teal[100],
                    onPressed: () {
                      _openProductDetails(context);
                    }))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.teal[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Location'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Basket'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}

void _openProductDetails(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
}
