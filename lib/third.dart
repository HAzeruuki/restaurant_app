import 'package:flutter/material.dart';
import 'service_locator.dart';

class MyThird extends StatefulWidget {
  MyThird({Key key, @required this.list, @required this.readJSON, @required this.selectionList, @required this.selected}) :super(key: key);
  final List list;
  Future<void> readJSON;
  Null Function(String s) selectionList;
  final List selected;

  ThirdPage createState() => ThirdPage();
}

class ThirdPage extends State<MyThird> {

  _readJSON(){
    widget.readJSON;
  }
  _addItem(String s){
    widget.selectionList(s);
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
            Text(
              "Select Drinks",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 50,
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 15,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          _addItem(widget.list[index].toString());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.local_drink,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                widget.list[index].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
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
            RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.grey,
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {locator<NavigationService>().navigateTo('order');},
            ),
          ],
        ),
      ),
    );
  }
}