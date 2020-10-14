import 'package:flutter/material.dart';
import 'package:salim/pages/space/spaceQ.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'home_question.dart';

class GoOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'home_no_ind',
        illustration: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Image.asset("assets/attention.png"),
                    SizedBox(height: 15),
                    Text(
                      AppStrings.homeYesInfo,
                      style: styleW,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.homeYesConf,
                  style: styleW,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        question: '',
        buttons: NextPervBTN(
          onTabNext: () => findViewById(context, SpaceQ()),
          onTabPerv: () => findViewById(context, HomeQ()),
        ),
      ),
    );
  }
}