import 'dart:ui';

import 'package:flutter/material.dart';
import 'roundedAddButton.dart';

void main() => runApp(MyTestApp());

class MyTestApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTestAppState();
  }
}

class MyTestAppState extends State<MyTestApp> {
  var buttons = ['Add 1', 'Add 2', 'Add 3'];
  var title = 'This is your current value: 0';
  var addNumber = 0;
  var taps = 0;

  void actionUponPressing(int iterateWithNumber) {
    setState(() {
      addNumber += iterateWithNumber;
      taps++;
      title = "This is your current value: " + addNumber.toString();
      if (addNumber >= 50) {
        title = "you've got above 50 points. \n Your current value is " +
            addNumber.toString() +
            "\nIt took you: " +
            taps.toString() +
            " taps";
      }
    });
  }

  void resetState() {
    setState(() {
      addNumber = 0;
      taps = 0;
      title = 'This is my test app';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Scaffold(
            appBar: AppBar(
              title: Text('This is my test app'),
            ),
            body: Center(
                child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 120),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: new BorderRadius.circular(15.0)),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    key: ValueKey("counter"),
                  )),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RoundedAddButton(
                            buttons[0], actionUponPressing, 1, "add-1"),
                        RoundedAddButton(
                            buttons[1], actionUponPressing, 2, "add-2"),
                        RoundedAddButton(
                            buttons[2], actionUponPressing, 3, "add-3")
                      ])),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: RaisedButton(
                            child: Text("Reset the counter"),
                            onPressed: resetState,
                            key: ValueKey("reset"),
                          ))))
            ]))));
  }
}
