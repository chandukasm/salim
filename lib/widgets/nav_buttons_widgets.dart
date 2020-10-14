import 'package:flutter/material.dart';

class NextPervBTN extends StatelessWidget {
  const NextPervBTN({
    Key key,
    @required this.onTabNext,
    @required this.onTabPerv,
    this.gray = false,
  }) : super(key: key);

  final Function onTabNext;
  final Function onTabPerv;
  final bool gray;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: onTabNext,
          child: Image.asset(
            "assets/icons/next.png",
            scale: 2,
            color: gray ? Colors.grey : null,
          ),
        ),
        GestureDetector(
          onTap: onTabPerv,
          child: Image.asset(
            "assets/icons/perv.png",
            scale: 2,
          ),
        ),
      ],
    );
  }
}

class NextBTN extends StatelessWidget {
  final Function onTab;
  const NextBTN({Key key, @required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTab,
        child: Image.asset("assets/icons/next.png", scale: 2),
      ),
    );
  }
}


class PrevBTN extends StatelessWidget {
  final Function onTab;
  const PrevBTN({Key key, @required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTab,
        child: Image.asset("assets/icons/perv.png", scale: 2),
      ),
    );
  }
}