import 'package:flutter/material.dart';
import 'package:salim/pages/size/sizeQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import '../heightQ.dart';

class SizedQ20M extends StatelessWidget {
  SizedQ20M() {
    Percentage.percentage.add(20);
    AppData.chooseImageList.add("Box20M");
    print("Images ${AppData.chooseImageList}");
    print(Percentage.percentage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: '20M_ind',
        illustration: Column(
          children: <Widget>[
            Image.asset("assets/icons/Box20M.png", scale: 2.5),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                AppStrings.box20M,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        question: '',
        buttons: NextPervBTN(
          onTabNext: () => findViewById(context, HeightQ()),
          onTabPerv: () {
            // remove percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, SizedQ());
          },
        ),
      ),
    );
  }
}