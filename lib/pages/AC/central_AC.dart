import 'package:flutter/material.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import '../windowQ.dart';
import 'ACQ.dart';

class CentralAC extends StatelessWidget {
  CentralAC() {
    Percentage.percentage.add(20);
    AppData.chooseImageList.add("BoxBAC");
    print(AppData.chooseImageList);
    print(Percentage.percentage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'ac_det_ind',
        illustration: Column(
          children: <Widget>[
            Image.asset("assets/icons/BoxBAC.png", scale: 2),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                AppStrings.bAC,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        question: '',
        buttons: NextPervBTN(
          onTabNext: () => findViewById(context, WindowQ()),
          onTabPerv: () {
            // remove the percentage
            Percentage.percentage.removeLast();
            AppData.chooseImageList.removeLast();
            findViewById(context, ACQ());
          },
        ),
      ),
    );
  }
}