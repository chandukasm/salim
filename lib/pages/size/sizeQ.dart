import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/size/sizeQ12M.dart';
import 'package:salim/pages/size/sizeQ20M.dart';
import 'package:salim/pages/size/sizeQ4M.dart';
import 'package:salim/pages/size/sizeQ8M.dart';
import 'package:salim/pages/space/space_closed.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/info_dialog.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

class SizedQ extends StatelessWidget {
  SizedQ() {
    print(Percentage.percentage);
    print("Images ${AppData.chooseImageList}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'size_q_ind',
        illustration: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => findViewById(context, SizedQ12M()),
                        child: Image.asset("assets/icons/12M.png", scale: 3),
                      ),
                      GestureDetector(
                        onTap: () => findViewById(context, SizedQ20M()),
                        child: Image.asset("assets/icons/20M.png", scale: 3),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => 
                          findViewById(context, SizedQ4M()),
                        child: Image.asset("assets/icons/4M.png", scale: 3),
                      ),
                      GestureDetector(
                        onTap: () => 
                          findViewById(context, SizedQ8M()),
                        child: Image.asset("assets/icons/8M.png", scale: 3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //======= Question ======
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    AppStrings.sizedQ,
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  child: GestureDetector(
                    onTap: () => information(context, "info_size"),
                    child: Image.asset("assets/icons/info.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
        question: '',
        progress: 70,
        buttons: PrevBTN(
          onTab: () => findViewById(context, SpaceClosed()),
        ),
      ),
    );
  }
}
