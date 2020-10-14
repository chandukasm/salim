import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/AC/wall_AC.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import '../heightQ.dart';
import 'Two_unit_AC.dart';
import 'central_AC.dart';
import 'fan.dart';
import 'no_air.dart';

class ACQ extends StatelessWidget {
  ACQ() {
    print(Percentage.percentage);
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'AC_ind',
        illustration: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => findViewById(context, TwoUnitAC()),
                  child: Image.asset("assets/icons/TwoUnitAC.png", scale: 1.7),
                ),
                GestureDetector(
                  onTap: () => findViewById(context, WallAC()),
                  child: Image.asset("assets/icons/wall_AC.png", scale: 1.7),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => findViewById(context, Fan()),
                  child: Image.asset("assets/icons/Fan.png", scale: 1.7),
                ),
                GestureDetector(
                  onTap: () => findViewById(context, NoAir()),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset("assets/icons/NoAir.png", scale: 1.7),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => findViewById(context, CentralAC()),
                  child: Image.asset("assets/icons/CentralAC.png", scale: 1.7),
                ),
              ],
            ),
          ],
        ),
        question: AppStrings.acQ,
        progress: 90,
        buttons: PrevBTN(
          onTab: () {
            // remove Hight percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, HeightQ());
          },
        ),
      ),
    );
  }
}