import 'package:flutter/material.dart';
import 'package:flutterapp/messages.dart';

/// Screen represents stateless static Product Details [see in Sketch](https://www.sketch.com/s/a67f7ba8-f681-4ce8-abf4-ccb72cb57eb0/a/gx178z)
/// TODO: Don't use hardcoded strings, consider to add localization later.
/// TODO: Find out real color values from design and create a color system for the project.
/// TODO: Create other project resources: dimensions, view styles, etc.
class ProductDetailsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: remove Scaffold and AppBar from here when AppBar listener is implemented
        appBar: AppBar(
          title: Center(child: Text('Product name')),
          leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.black)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.grey[300],
              onPressed: () {},
            )
          ],
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 33),
                    child: Image(
                      image: AssetImage('images/img_flat_white.png'),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 46, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Flat white',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 84, 79)),
                        ),
                        Text(
                          '\$ 12.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 84, 79)),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Special',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500]),
                        ),
                        IntrinsicHeight(
                            child: Row(
                              children: <Widget>[
                                Text('10 min',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[500])),
                                VerticalDivider(
                                  color: Colors.grey[500],
                                  thickness: 2,
                                ),
                                Image(
                                  image: AssetImage('images/ic_star.png'),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Text('4.3',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[500])))
                              ],
                            ))
                      ],
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Text(
                        'We believe coffee should be as simple complex as you want it to be. Perfect start your day',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600]))
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300], width: 2),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                padding: EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 7),
                                child: Text(
                                  'Calories\n176 cal',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300], width: 2),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                padding: EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 7),
                                child: Text(
                                    'Strong'
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey[300],
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  padding: EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 7),
                                  child: Text(
                                      'Arabica'
                                  ),
                                )
                            )
                          ],
                        )
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 67, left: 20, right: 20, bottom: 20),
                    constraints: BoxConstraints.expand(width: double.infinity, height: 54),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                            Messages.nextButtonTitle,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        color: Color.fromARGB(255, 34, 40, 49),
                        onPressed: () {})
                )
              ],
            ),
          ),
        ));
  }
}
