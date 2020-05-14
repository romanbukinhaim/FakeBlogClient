import 'package:flutter/material.dart';

class NothingToShowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
          child: Column(children: <Widget>[
        Icon(Icons.mood_bad, size: 80, color: Theme.of(context).primaryColor,),
        Text("Sorry, nothing to show...", style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),)
      ]),
    );
  }

}