import 'package:flutter/material.dart';
import 'package:salim/pages/intros/team_page.dart';
import 'package:salim/pages/menus/contact_page.dart';
import 'package:salim/pages/splash_screen.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/utils/style.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';

import 'intro_3.dart';

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'Home_ind',
        // illustration: Container(),
        illustration: Column(
          children: <Widget>[
            Text(AppStrings.intro2Description,
                style: style, textAlign: TextAlign.center),
            SizedBox(height: 10),
            Divider(thickness: 2),
            Text(
                'تم تطوير هذا التطبيق "تطوعاً" من قبل نخبة من المختصين العمانيين'),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("تعرف عليهم", style: TextStyle(color: AppColors.red)),
                SizedBox(width: 5),
                GestureDetector(
                  child: Image.asset(
                    "assets/icons/info_R.png",
                    height: 45,
                    width: 45,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TeamPage())),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "تواصل مع الفريق التطوعي",
                  style: TextStyle(color: AppColors.red),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  child: Image.asset(
                    "assets/icons/info_R.png",
                    height: 45,
                    width: 45,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ContactPage())),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
                "هذا المجهود هو بدعم من غرفة تجارة و صناعة عمان و وزارة التقنية و الاتصالات, و قامت وزارة الصحة مشكورة بمراجعة المحتوى العلمي ")
          ],
        ),

        question: '',
        buttons: NextPervBTN(
          onTabNext: () => findViewById(context, Intro3()),
          onTabPerv: () => findViewById(context, SplashScreen()),
        ),
      ),
    );
  }
}
