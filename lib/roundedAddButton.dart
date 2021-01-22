import 'package:flutter/material.dart';

class RoundedAddButton extends StatelessWidget {
  final String button;
  final Function actionUponPressing;
  final int addedNumber;
  final String valueKey;

  RoundedAddButton(
      this.button, this.actionUponPressing, this.addedNumber, this.valueKey);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
            child: Text(button,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.lightBlue)),
            onPressed: () => actionUponPressing(addedNumber),
            key: ValueKey(valueKey)));
  }
}
