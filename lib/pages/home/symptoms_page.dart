import 'package:flutter/material.dart';
import 'package:salim/pages/home/symptoms2_page.dart';
import 'package:salim/pages/space/spaceQ.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'home_question.dart';

class Symptoms1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'home_no_ind',
        illustration: Column(
          children: <Widget>[
            Text('هل لديك أي من الأعراض التالية؟', style: style),
            SizedBox(height: 40),
            Image.asset("assets/icons/symptoms1.png", scale: 2.5)
          ],
        ),
        question: '',
        answer: Answers(
          yesIcon: 'yes',
          noIcon: 'no',
          onTabYes: () => findViewById(context, Symptoms2(syChoose: true)),
          onTabOn: () => findViewById(context, Symptoms2(syChoose: false)),
        ),
        progress: 23,
        buttons: PrevBTN(onTab: () => findViewById(context, HomeQ())),
      ),
    );
  }
}
