import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salim/pages/intros/intro_video.dart';
import 'package:salim/utils/findView.dart';

import 'intro_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => findViewById(
        context,
        IntroVideo(),
      ),
    );
    return Intro1();
  }
}
