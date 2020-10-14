import 'package:flutter/material.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'home_question.dart';

class HomeQNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'Home_ind',
        illustration: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Text(
                AppStrings.homeQNo,
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
            SizedBox(height: 20),
            Image.asset("assets/icons/smile_face.png", scale: 2),
            SizedBox(height: 10),
            Text(AppStrings.homeQNoBeSafe, style: style)
          ],
        ),
        question: '',
        buttons: PrevBTN(
          onTab: ()=> findViewById(context, HomeQ()),
        ),
      ),
    );
  }
}