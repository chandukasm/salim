import 'package:flutter/material.dart';
import 'package:salim/pages/home/home_question.dart';
import 'package:salim/pages/intros/team_page.dart';
import 'package:salim/pages/menus/air_quality.dart';
import 'package:salim/pages/menus/contact_page.dart';
import 'package:salim/pages/menus/scientific_sources.dart';
import 'package:salim/pages/splash_screen.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/style.dart';

import 'custom_progress.dart';
import 'indicator_widget.dart';

class PageTheme extends StatefulWidget {
  final String indicator;
  final Widget illustration;
  final String question;
  final Widget answer;
  final double progress;
  final Widget buttons;
  final Alignment buttonsAlignment;
  const PageTheme({
    Key key,
    @required this.indicator,
    @required this.illustration,
    @required this.question,
    this.answer,
    this.progress,
    @required this.buttons,
    this.buttonsAlignment = Alignment.bottomLeft,
  }) : super(key: key);

  @override
  _PageThemeState createState() => _PageThemeState();
}

class _PageThemeState extends State<PageTheme> {
  bool showMenu = false;
  List<String> menusList = [
    "الصفحة الاولى",
    "حساب الاحتماليات",
    "مقترحات صحية",
    "المصادر العلمية",
    "عن فريق التطبيق",
    "تواصل معنا",
  ];
  List<Widget> menuLinks = [
    SplashScreen(),
    HomeQ(),
    AirQuality(),
    ScientificSources(),
    TeamPage(),
    ContactPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                MyIndicator(indicator: widget.indicator),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/icons/menu.png",
                                    scale: 4),
                              ),
                              onTap: () => setState(() => showMenu = true),
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/last_logo1.png", scale: 2.6),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: SingleChildScrollView(
                  primary: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: <Widget>[
                        // images
                        widget.illustration,
                        widget.question.isEmpty
                            ? Container()
                            : SizedBox(height: 25),
                        // text
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.question,
                            style: style,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        widget.answer == null
                            ? Container()
                            : SizedBox(height: 25),
                        widget.answer == null ? Container() : widget.answer,
                        widget.progress == null
                            ? Container()
                            : SizedBox(height: 25),
                        widget.progress == null
                            ? Container()
                            : CustomProgress(progress: widget.progress),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: widget.buttonsAlignment,
                child: widget.buttons,
              ),
            ),
          ],
        ),
        // =========================== Menu ==========================
        showMenu
            ? Positioned(
                right: 0,
                top: 10,
                child: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height - 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        border: Border.all(width: 5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // ========= list icons ===========

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: GestureDetector(
                                  child: Image.asset("assets/icons/menu.png",
                                      scale: 4),
                                  onTap: () => setState(() => showMenu = false),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  children: <Widget>[
                                    for (int i = 0; i < menusList.length; i++)
                                      GestureDetector(
                                        onTap: () {
                                          if (i == 0 || i == 1) {
                                            // clear the percentage
                                            Percentage.percentage.clear();
                                            findViewById(context, menuLinks[i]);
                                          } else {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) => menuLinks[i]),
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            menusList[i],
                                            style: TextStyle(fontSize: 19),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
