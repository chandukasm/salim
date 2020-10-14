import 'package:flutter/material.dart';
import 'package:salim/pages/size/sizeQ.dart';
import 'package:salim/pages/space/spaceQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/info_dialog.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class SpaceClosed extends StatelessWidget {
  SpaceClosed() {
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'close_space_ind',
        illustration: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: 380,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 350,
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
                              AppStrings.closedSpaceDis,
                              style: styleW,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -9,
                    top: -9,
                    child: GestureDetector(
                      onTap: () => information(context, "info_space_closed"),
                      child: Image.asset("assets/icons/info.png", scale: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.closedSpaceConf,
                  style: styleW,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        question: '',
        buttons: NextPervBTN(
          onTabNext: () => findViewById(context, SizedQ()),
          onTabPerv: () {
            AppData.chooseImageList.removeLast();
            findViewById(context, SpaceQ());
          },
        ),
      ),
    );
  }
}
