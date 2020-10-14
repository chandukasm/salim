import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/home/symptoms_page.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/info_dialog.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import '../intro_3.dart';
import 'home_question_no.dart';
import 'go_out.dart';

class HomeQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'Home_ind',
        illustration: GestureDetector(
          onTap: () => information(context, "info_home"),
          child: GestureDetector(
            onTap: ()=> information(context, 'info_home'),
            child: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Image.asset("assets/icons/home.png", scale: 2.5),
            ),
          ),
        ),
        question: AppStrings.homeQ,
        answer: Answers(
          yesIcon: 'yes',
          noIcon: 'no',
          // onTabYes: () => findViewById(context, HomeYes()),
          onTabYes: () => findViewById(context, Symptoms1()),
          onTabOn: ()=> findViewById(context, HomeQNo()),
        ),
        progress: 20,
        buttons: NextPervBTN(
          gray: true,
          onTabNext: null,
          onTabPerv: () => findViewById(context, Intro3()),
        ),
      ),
    );
  }
}