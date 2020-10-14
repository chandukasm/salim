import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/result.dart';
import 'package:salim/pages/safe_space.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class TouchQ extends StatelessWidget {
  TouchQ() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("eay");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'mask_ind',
        illustration: Image.asset("assets/icons/touch.png", scale: 2),
        question: AppStrings.touchQ,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(1);
            findViewById(context, Result());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(0);
            findViewById(context, Result());
          },
        ),
        progress: 265,
        buttons: PrevBTN(
          onTab: () {
            // remove the percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, SafeSpace());
          },
        ),
      ),
    );
  }
}