import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/peopleQ.dart';
import 'package:salim/pages/windowQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class Filter extends StatelessWidget {
  Filter() {
    print(Percentage.percentage);
    AppData.chooseImageList.add("filter");
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'filter_ind',
        illustration: Image.asset("assets/icons/filter.png", scale: 1.5),
        question: AppStrings.filterQ,
        answer: Answers(
          yesIcon: 'yes_green',
          noIcon: 'no_yellow',
          onTabYes: () {
            // add the percentage
            Percentage.percentage.add(20);
            findViewById(context, People());
          },
          onTabOn: () {
            // add the percentage
            Percentage.percentage.add(90);
            findViewById(context, People());
          },
        ),
        progress: 145,
        buttons: PrevBTN(
          onTab: () {
            // remove windows percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, WindowQ());
          },
        ),
      ),
    );
  }
}