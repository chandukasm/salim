import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'home/home_question.dart';

class Intro3 extends StatelessWidget {
// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    print('ín intro 3');
    return Scaffold(
      body: PageTheme(
        indicator: 'Home_ind',
        illustration: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Image.asset("assets/attention.png"),
                SizedBox(height: 20),
                Text(
                  AppStrings.intro3Description1,
                  style: styleW,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  AppStrings.intro3Description2,
                  style: styleW,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
        question: '',
        buttons: NextBTN(
          onTab: () => findViewById(context, HomeQ()),
        ),
        buttonsAlignment: Alignment.bottomRight,
      ),
    );
  }
}
