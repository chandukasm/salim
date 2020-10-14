import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/strings.dart';

class TeamPage extends StatelessWidget {
  final List<String> discretionList = [
    AppStrings.airQ1,
    AppStrings.airQ2,
    AppStrings.airQ3,
    AppStrings.airQ4,
  ];
  String s1 = """ د. سالم الوهيبي
د. آمال الابروي
د. فراس العبدواني
م. ابراهيم الحوسني
أ. محمد العرادي
أ. فراس المسافر
م. احمد الزدجالي
م. هلال الشبلي
""";

  String s2 = """  د. سالم الوهيبي
د. فراس العبدواني
أ. فراس المسافر
د. آمال الابروي
""";

  String s4 = """أ. محمد العرادي
م. حليمة الكلباني
""";

  String s5 = """م. ابراهيم الحوسني 
د. آمال الابروي
د. فراس العبدواني
""";

  String s6 = """أ. عبد الرحمن البلوشي
أ. عمار الحامدي
أ. حمود الطوقي
أ. نديم الوهيبي
""";

  String s7 = """د. حمود الهاشمي
أ. محمد الجابري
أ. ابوبكر البلوشي
د. فارس آل سعيد
م. فاطمة المحروقي
أ. مها البلوشي
م. شيماء الغيلانية
أ. سرى المسقطي
أ. سعود الحبيشيى
م. مالك المسافر
م. قيس المعشري
د. شمسه الحوسني
د. فاطمة الحكماني
كليم اليعقوبي
حسين اللواتي
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Image.asset("assets/result_BC.png", fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 30, 8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset("assets/icons/X.png", scale: 2.3),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      Spacer(),
                      Image.asset("assets/icons/info_R.png", scale: 5.5),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // ====================
                          SizedBox(height: 20),
                          header("فريق  التخطيط و الإشراف على التطبيق"),
                          SizedBox(height: 10),
                          paragraphs(context, s1),

                          //==================
                          header("فريق المحتوى العلمي"),
                          SizedBox(height: 10),
                          paragraphs(context, s2),

                          //==================
                          header("فريق برمجة المحتوى"),
                          SizedBox(height: 10),
                          paragraphs(context, "Smart Developer"),

                          //==================
                          header("تصميم التطبيق / جارفيكس و فيديو"),
                          SizedBox(height: 10),
                          paragraphs(context, "فراس المسافر"),

                          //==================
                          header("تصميم المعادلات الرياضية"),
                          SizedBox(height: 10),
                          paragraphs(context, "حمود الحمدان"),

                          //==================
                          header("نصوص و تصحيح لغوي"),
                          SizedBox(height: 10),
                          paragraphs(context, "د. سعاد اللواتي"),

                          //==================
                          header("ادارة التسويق و الحملة الاعلامية"),
                          SizedBox(height: 10),
                          paragraphs(context, s4),

                          //==================
                          header("دعم تقني و لوجيستي"),
                          SizedBox(height: 10),
                          paragraphs(context, s5),

                          //==================
                          header("فريق تجريب خصائص التطبيق"),
                          SizedBox(height: 10),
                          paragraphs(context, s6),

                          //==================
                          header("شكر خاص الى"),
                          SizedBox(height: 10),
                          paragraphs(context, s7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding paragraphs(BuildContext context, String s) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            s,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Text header(String header) {
    return Text(
      header,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: AppColors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
