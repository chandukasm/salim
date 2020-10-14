import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 30, top: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: AppColors.red,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
