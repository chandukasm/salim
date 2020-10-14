import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/space/spaceQ.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/widgets/info_dialog.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class SpaceOpen extends StatelessWidget {
  SpaceOpen(){
    print(AppData.chooseImageList);
    AppData.chooseImageList.removeLast();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'open_space_ind',
        illustration: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Image.asset(
                  "assets/icons/openSpaceCont.png",
                  scale: MediaQuery.of(context).size.height >= 670 ? 1.7 : 2,
                ),
                Positioned(
                  top: 0,
                  left: 40,
                  child: GestureDetector(
                    onTap: () => information(context, "info_space_open"),
                    child: Container(
                      color: Colors.transparent,
                      width: 100,
                      height: 100,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        question: '',
        progress: 45,
        buttons: PrevBTN(onTab: () => findViewById(context, SpaceQ())),
      ),
    );
  }
}