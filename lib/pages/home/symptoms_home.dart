import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'symptoms_page.dart';

class SymptomsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'home_no_ind',
        illustration: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 100,
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
                      """ينصح بعدم الخروج من المنزل

ارتدي اللثام الطبي الواقي في البيت
اعزل نفسك عن بقية افراد العائلة

راجع اقرب مركز صحي او اتصل
 بالخط الساخن لجائحة كوفيد 19""",
                      style: styleW,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  """الخط الساخن
 1212 / 24441999""",
                  style: styleW,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        question: '',
        buttons: PrevBTN(onTab: () => findViewById(context, Symptoms1())),
      ),
    );
  }
}
