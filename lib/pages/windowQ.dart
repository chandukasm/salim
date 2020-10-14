import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/AC/ACQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'filter.dart';

class WindowQ extends StatelessWidget {
  WindowQ() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("Window");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'window_ind',
        illustration: Image.asset("assets/icons/Window.png", scale: 1.5),
        question: AppStrings.window,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(20);
            findViewById(context, Filter());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(90);
            findViewById(context, Filter());
          },
        ),
        progress: 120,
        buttons: PrevBTN(
          onTab: () {
            // remove AC percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, ACQ());
          },
        ),
      ),
    );
  }
}