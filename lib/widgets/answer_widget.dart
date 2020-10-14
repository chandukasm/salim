import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';

class Answers extends StatelessWidget {
  final String yesIcon;
  final String noIcon;
  final Function onTabYes;
  final Function onTabOn;

  const Answers({
    Key key,
    @required this.yesIcon,
    @required this.noIcon,
    @required this.onTabYes,
    @required this.onTabOn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: onTabYes,
            child: Image.asset("assets/icons/$yesIcon.png", scale: 2),
          ),
          Container(
            height: 35,
            width: 5,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          GestureDetector(
            onTap: onTabOn,
            child: Image.asset("assets/icons/$noIcon.png", scale: 2),
          ),
        ],
      ),
    );
  }
}
