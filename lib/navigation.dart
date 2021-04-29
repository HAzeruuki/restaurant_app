import 'package:flutter/material.dart';
import 'main.dart';
import 'service_locator.dart';
import 'second.dart';
import 'third.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'orderpage.dart';

class ParentState extends StatefulWidget{
  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<ParentState>{

  List foodList = [];
  List sidedishList = [];
  List drinkList = [];

  List selectionList = [];

  void addItem(String text){

    setState(() {
      selectionList.insert(0, text);
    });

  }

  void emptyList(){
    setState(() {
      selectionList.clear();
    });
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      foodList = data["food"];
      sidedishList = data["sidedish"];
      drinkList = data["drink"];
    });
    }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Restaurant App',
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings){
        switch(routeSettings.name){
          case 'second':
            return MaterialPageRoute (builder: (context) => MySecond(readJSON: readJson(), list: sidedishList, selectionList: (String s) {addItem(s);}, selected: selectionList,));
          case 'third':
            return MaterialPageRoute (builder: (context) => MyThird(readJSON: readJson(), list: drinkList, selectionList: (String s) {addItem(s);}, selected: selectionList,));
          case 'main':
            return MaterialPageRoute(builder: (context)=> MyHome(readJSON: readJson(), list: foodList, selectionList: (String s) {addItem(s);}, selected: selectionList,));
          case 'order':
            return MaterialPageRoute (builder: (context) => MyFourth(readJSON: readJson(), selected: selectionList, removeAll: () {emptyList();},));
          default:
            return MaterialPageRoute(builder: (context)=> MyHome(readJSON: readJson(), list: foodList, selectionList: (String s) {addItem(s);}, selected: selectionList,));
        }
      },
      home: MyHome(readJSON: readJson(), list: foodList, selectionList: (String s) {addItem(s);}, selected: selectionList,),
    );
  }
}