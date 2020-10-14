import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Opacity(
            opacity: 0.7,
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
                  SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "للتواصل مع فريق تطوير التطبيق",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(
                              "بريد الكتروني",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "salim-app@if.om",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/partners.png", scale: 2),
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
}
