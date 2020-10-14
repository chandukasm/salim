import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/strings.dart';

class AirQuality extends StatelessWidget {
  final List<String> discretionList = [
    AppStrings.airQ1,
    AppStrings.airQ2,
    AppStrings.airQ3,
    AppStrings.airQ4,
  ];
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
            child: SingleChildScrollView(
              primary: false,
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
                    SizedBox(height: 20),
                    Text(
                      "مقترحات لتحسين جودة الهواء ",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    for (int i = 0; i < discretionList.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.red),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              discretionList[i],
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirQualityShow extends StatelessWidget {
  final List<String> discretionList = [
    AppStrings.airQ1,
    AppStrings.airQ2,
    AppStrings.airQ3,
    AppStrings.airQ4,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "مقترحات لتحسين جودة الهواء ",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          for (int i = 0; i < discretionList.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.red),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    discretionList[i],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
