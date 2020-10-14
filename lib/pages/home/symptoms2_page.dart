import 'package:flutter/material.dart';
import 'package:salim/pages/home/home_question_no.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/answer_widget.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'go_out.dart';
import 'symptoms_home.dart';
import 'symptoms_page.dart';

class Symptoms2 extends StatelessWidget {
  final bool syChoose;

  const Symptoms2({Key key, @required this.syChoose}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'home_no_ind',
        illustration: Column(
          children: <Widget>[
            Text('هل لديك أي من الأعراض التالية؟', style: style),
            SizedBox(height: 40),
            Image.asset("assets/icons/symptoms2.png", scale: 2.5)
          ],
        ),
        question: '',
        answer: Answers(
          yesIcon: 'yes',
          noIcon: 'no',
          // onTabYes: () => findViewById(context, HomeYes()),
          onTabYes: () => findViewById(context, SymptomsHome()),
          onTabOn: () {
            if(syChoose)
            findViewById(context, SymptomsHome());
            else
            findViewById(context, GoOut());
          },
        ),
        progress: 24,
        buttons: PrevBTN(onTab: () => findViewById(context, Symptoms1())),
      ),
    );
  }
}
