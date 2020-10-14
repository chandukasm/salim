import 'package:flutter/material.dart';
import 'package:salim/utils/colors.dart';

class Intro1 extends StatelessWidget {
  final TextStyle _style = TextStyle(
    color: AppColors.gray,
    fontSize: 18,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  );
  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.maxFinite,
//         child: Column(
//           children: <Widget>[
//             Image.asset('assets/salim_avatar.png'),
//             Expanded(
//               flex: 2,
//               child: Center(
//                 child: SingleChildScrollView(
//                   primary: false,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text("مقياس احتمالية التعرض للإصابة", style: _style),
//                       RichText(
//                         text: TextSpan(
//                           style: _style,
//                           text: "بفايروس ",
//                           children: [
//                             TextSpan(
//                               text: 'كورونا ',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontFamily: 'Avenir',
//                                 fontSize: 18,
//                               ),
//                             ),
//                             TextSpan(text: 'المستجد')
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Image.asset("assets/partners.png", scale: 2.5)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 child: SafeArea(
//                   child: Text(
//                     AppStrings.copyright,
//                     style: TextStyle(
//                       color: AppColors.gray,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
                  Container(
                    height: 400,
                    child: Center(
                      child: GestureDetector(
                        child: Image.asset("assets/salim_logo.png"),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("مقياس احتمالية التعرض للإصابة", style: _style),
                        RichText(
                          text: TextSpan(
                            style: _style,
                            text: "بفايروس ",
                            children: [
                              TextSpan(
                                text: 'كورونا ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(text: 'المستجد')
                            ],
                          ),
                        ),
                        // SizedBox(height: 20),
                      ],
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
