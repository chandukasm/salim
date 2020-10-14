import 'package:flutter/material.dart';

class MyIndicator extends StatelessWidget {
  final String indicator;

  const MyIndicator({Key key, @required this.indicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: Image.asset(
          "assets/indicators/$indicator.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
