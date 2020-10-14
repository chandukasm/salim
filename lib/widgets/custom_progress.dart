import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';

class CustomProgress extends StatelessWidget {
  final double progress;

  const CustomProgress({
    Key key,
    @required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width / 1.5);
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 5,
            width: (MediaQuery.of(context).size.width / 1.5),
            decoration: BoxDecoration(
              color: AppColors.whiteGray,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 5,
              width: size - size + progress,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            left: progress - 5,
            top: -5,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
