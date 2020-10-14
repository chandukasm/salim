import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/touch.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'conf_mask.dart';

class SafeSpace extends StatelessWidget {
  SafeSpace() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("safeSpace");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'mask_ind',
        illustration: Image.asset("assets/icons/safeSpace.png", scale: 2),
        question: AppStrings.safeSpace,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(1);
            findViewById(context, TouchQ());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(0);
            findViewById(context, TouchQ());
          },
        ),
        progress: 230,
        buttons: PrevBTN(
          onTab: () {
            // remove the Conf Mask
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, ConfMaskQ());
          },
        ),
      ),
    );
  }
}