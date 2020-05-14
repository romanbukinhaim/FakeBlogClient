import 'package:flutter/material.dart';

class PleaseWaitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      Text(
        "loading...",
        style: TextStyle(color: Theme.of(context).primaryColor),
      )
    ]);
  }
}
