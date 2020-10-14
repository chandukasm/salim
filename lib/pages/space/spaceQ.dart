import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/home/go_out.dart';
import 'package:salim/pages/space/space_closed.dart';
import 'package:salim/pages/space/space_open.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class SpaceQ extends StatelessWidget {
  SpaceQ(){
    print(AppData.chooseImageList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'home_no_ind',
        illustration: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GestureDetector(
                        onTap: () {
                          AppData.chooseImageList.add("closeSpace");
                          findViewById(context, SpaceClosed());
                        },
                        child: Image.asset(
                          "assets/icons/closeSpace.png",
                          scale: 2,
                        ),
                      ),
                    ),
                    Text(AppStrings.spaceClosed, style: style),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        AppData.chooseImageList.add("openSpace");
                        findViewById(context, SpaceOpen());
                      },
                      child: Image.asset(
                        "assets/icons/openSpace.png",
                        scale: 2,
                      ),
                    ),
                    Text(AppStrings.spaceOpen, style: style),
                  ],
                ),
              ],
            ),
          ],
        ),
        question: AppStrings.spaceQ,
        progress: 45,
        buttons: PrevBTN(onTab: () => findViewById(context, GoOut())),
      ),
    );
  }
}
