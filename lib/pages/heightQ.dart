import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/size/sizeQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/theme_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'AC/ACQ.dart';

class HeightQ extends StatelessWidget {
  HeightQ() {
    print(Percentage.percentage);
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'height_ind',
        illustration: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // add the percentage
                    Percentage.percentage.add(90);
                    AppData.chooseImageList.add("3H");
                    findViewById(context, ACQ());
                  },
                  child: Image.asset(
                    "assets/icons/3H.png",
                    scale: 1.7,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // add the percentage
                    Percentage.percentage.add(60);
                    AppData.chooseImageList.add("5H");
                    findViewById(context, ACQ());
                  },
                  child: Image.asset(
                    "assets/icons/5H.png",
                    scale: 1.7,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // add the percentage
                    Percentage.percentage.add(20);
                    AppData.chooseImageList.add("8H");
                    findViewById(context, ACQ());
                  },
                  child: Image.asset(
                    "assets/icons/8H.png",
                    scale: 1.7,
                  ),
                ),
              ],
            ),
          ],
        ),
        question: AppStrings.heightQ,
        progress: 85,
        buttons: PrevBTN(
          onTab: () {
            // remove size percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, SizedQ());
          },
        ),
      ),
    );
  }
}