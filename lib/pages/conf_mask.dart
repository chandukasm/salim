import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/safe_space.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'mask.dart';

class ConfMaskQ extends StatelessWidget {
  ConfMaskQ() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("conf_mask");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'mask_ind',
        illustration: Image.asset("assets/icons/conf_mask.png", scale: 2),
        question: AppStrings.confMaskQ,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(1);
            findViewById(context, SafeSpace());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(0);
            findViewById(context, SafeSpace());
          },
        ),
        progress: 215,
        buttons: PrevBTN(
          onTab: () {
            // remove the Mask percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, MaskQ());
          },
        ),
      ),
    );
  }
}