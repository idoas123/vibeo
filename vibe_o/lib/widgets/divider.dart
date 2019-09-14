import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black45,
              height: 36,
            ),
          ),
        ),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        Expanded(
          child: new Container(
            margin: EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black45,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
