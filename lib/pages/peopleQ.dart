import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'filter.dart';
import 'mask.dart';

class People extends StatelessWidget {
  People() {
    print(Percentage.percentage);
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'people_ind',
        illustration: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // add the percentage
                Percentage.percentage.add(20);
                AppData.chooseImageList.add("2people");
                findViewById(context, MaskQ());
              },
              child: Image.asset("assets/icons/2people.png", scale: 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // add the percentage
                    Percentage.percentage.add(60);
                    AppData.chooseImageList.add("5people");
                    findViewById(context, MaskQ());
                  },
                  child: Image.asset("assets/icons/5people.png", scale: 2),
                ),
                GestureDetector(
                  onTap: () {
                    // add the percentage
                    Percentage.percentage.add(90);
                    AppData.chooseImageList.add("6peoples");
                    findViewById(context, MaskQ());
                  },
                  child: Image.asset("assets/icons/6peoples.png", scale: 2),
                ),
              ],
            ),
          ],
        ),
        question: AppStrings.peopleQ,
        progress: 170,
        buttons: PrevBTN(
          onTab: () {
            // remove Filter percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, Filter());
          },
        ),
      ),
    );
  }
}