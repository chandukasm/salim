import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/peopleQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'conf_mask.dart';

class MaskQ extends StatelessWidget {
  MaskQ() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("mask");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'mask_ind',
        illustration: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset("assets/icons/mask.png", scale: 2),
        ),
        question: AppStrings.maskQ,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(1);
            findViewById(context, ConfMaskQ());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(0);
            findViewById(context, ConfMaskQ());
          },
        ),
        progress: 195,
        buttons: PrevBTN(
          onTab: () {
            // add the percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, People());
          },
        ),
      ),
    );
  }
}