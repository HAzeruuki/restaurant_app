import 'package:flutter/material.dart';
import 'service_locator.dart';

class MyFourth extends StatefulWidget {
  MyFourth({Key key, @required this.readJSON, @required this.selected, @required this.removeAll}) :super(key: key);
  Future<void> readJSON;
  final List selected;
  Null Function() removeAll;

  FourthPage createState() => FourthPage();
}

class FourthPage extends State<MyFourth> {

  _readJSON(){
    widget.readJSON;
  }

  _onPressedHandler(){
    widget.removeAll();
    locator<NavigationService>().navigateTo('main');
  }
  @override
  Widget build(BuildContext context){
    _readJSON();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Food Ordering',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Your Order',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: widget.selected.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index){
                        return Container(
                            height: 50,
                            margin: EdgeInsets.all(5),
                            child: Text(widget.selected[index],)
                        );
                      },

                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child:             Text(
                "Your order has been confirmed!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.grey,
              child: Text(
                'Restart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                _onPressedHandler();
              },
            ),
          ],
        ),
      ),
    );
  }
}