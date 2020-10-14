import 'package:flutter/cupertino.dart';
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

class SizedQ4M extends StatelessWidget {
  SizedQ4M() {
    Percentage.percentage.add(90);
    AppData.chooseImageList.add("Box4M");
    print("Images ${AppData.chooseImageList}");
    print(Percentage.percentage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: '4M_ind',
        illustration: Column(
          children: <Widget>[
            Image.asset("assets/icons/Box4M.png", scale: 2.5),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                AppStrings.box4M,
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