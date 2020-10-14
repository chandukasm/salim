import 'package:flutter/material.dart';
import 'package:salim/pages/menus/air_quality.dart';
import 'package:salim/pages/menus/scientific_sources.dart';
import 'package:salim/pages/splash_screen.dart';
import 'package:salim/utils/colors.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/percentage.dart';
import 'package:salim/utils/app_data.dart';
import 'package:salim/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatefulWidget {
  Result() {
    print(Percentage.percentage);
    print(AppData.chooseImageList);
  }

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final TextStyle style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.gray,
  );

  TextStyle _style = TextStyle(
    fontSize: 30,
    color: AppColors.red,
  );
  int selected = 30;
  // PickedFile _imageFile;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController h = TextEditingController();
  TextEditingController m = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController other = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // SizedBox(height: 50),
            // Center(
            //   child: Text(
            //     "التقرير المفصل",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 30,
            //       color: AppColors.red,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 30),
            // Center(
            //   child: Text(
            //     "الاسم",
            //     style: _style,
            //   ),
            // ),
            // SizedBox(height: 30),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xffE7E7E7),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(20),
            //       child: Column(
            //         children: [
            //           Container(
            //             color: Colors.white,
            //             child: Padding(
            //               padding:
            //                   const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //               child: TextField(
            //                 controller: fName,
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "الاسم الأول ( اختياري) ",
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 20),
            //           Container(
            //             color: Colors.white,
            //             child: Padding(
            //               padding:
            //                   const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //               child: TextField(
            //                 controller: lName,
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "اسم القبيلة ( اختياري) ",
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // ======================= MAP =======================
            // SizedBox(height: 50),
            // CustomDivider(),
            // SizedBox(height: 50),
            // Center(child: Text("الموقع", style: _style)),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xffE7E7E7),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(20).copyWith(bottom: 0),
            //           child: Container(
            //             color: Colors.white,
            //             child: Padding(
            //               padding:
            //                   const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //               child: TextField(
            //                 controller: h,
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "المحافظة",
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(20),
            //           child: Container(
            //             color: Colors.white,
            //             child: Padding(
            //               padding:
            //                   const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //               child: TextField(
            //                 controller: m,
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "المدينة",
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(20).copyWith(top: 0),
            //           child: Container(
            //             color: Colors.white,
            //             child: Padding(
            //               padding:
            //                   const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //               child: TextField(
            //                 controller: address,
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "العنوان",
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: 50),
            // Center(child: Text("وصف الحيز الفراغي", style: _style)),
            // SizedBox(height: 50),
            // =========================== RADIO ==============================
            // Center(
            //   child: Wrap(
            //     spacing: 20,
            //     children: [
            //       Column(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           for (int i = 0; i < 8; i++)
            //             CustomRadioButton(
            //               label: AppData.spaceChoose[i],
            //               value: i,
            //               selected: selected == i ? true : false,
            //               onChanged: (v) => setState(() => selected = v),
            //             ),
            //         ],
            //       ),
            //       Column(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           for (int i = 8; i < 16; i++)
            //             CustomRadioButton(
            //               label: AppData.spaceChoose[i],
            //               value: i,
            //               selected: selected == i ? true : false,
            //               onChanged: (v) => setState(() => selected = v),
            //             ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 50),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xffE7E7E7),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(20),
            //       child: Container(
            //         color: Colors.white,
            //         child: Padding(
            //           padding: const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //           child: TextField(
            //             controller: other,
            //             decoration: InputDecoration(
            //               border: InputBorder.none,
            //               hintText: "اخرى:",
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // ==================== TAKE IMAGE ===================
            // SizedBox(height: 50),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xffE7E7E7),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(20),
            //       child: Padding(
            //         padding: const EdgeInsets.only(right: 8.0, bottom: 0.8),
            //         child: GestureDetector(
            //           onTap: () => takeImage(),
            //           child: Column(
            //             children: [
            //               _imageFile == null
            //                   ? Image.asset("assets/icons/camara.png", scale: 2)
            //                   : Image.file(File(_imageFile.path), scale: 2),
            //               SizedBox(height: 30),
            //               Text(
            //                 "حمل صورة الحيز الفراغي ",
            //                 style: _style.copyWith(
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // =============================== RESULT ===============================
            // SizedBox(height: 50),
            // CustomDivider(),
            SizedBox(height: 50),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    children: <Widget>[
                      // Text("الاحتمال", style: _style),
                      Text("النتائج",
                          style: _style.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Text('" بحول الرحمن و رحمته "', style: style),
                      SizedBox(height: 10),
                      Text(
                        AppStrings.resultIntro,
                        style: style,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Percentage.getPercentage().toStringAsFixed(2) +
                                  "%",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(width: 20),
                            Image.asset("assets/alarm.png", scale: 2),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(AppStrings.resultInfo,
                          style: style, textAlign: TextAlign.center),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Percentage.getMinutes(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(width: 20),
                            Image.asset("assets/alarm.png", scale: 2),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          " يمكنك البقاء في هذه المساحة الفراغية لمدة أطول، شريطة تجديد الهواء بشكل مستمر و فعال.",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // ===================== CHOOSE ======================
            SizedBox(height: 50),
            CustomDivider(),
            SizedBox(height: 50),
            Center(child: Text("اختياراتي", style: _style)),

            for (String image in AppData.chooseImageList)
              MyChooseCustomWidget(image: image),

            // ============= AIR ======
            SizedBox(height: 50),
            CustomDivider(),
            SizedBox(height: 50),
            AirQualityShow(),

            // ========== Sources =======
            SizedBox(height: 50),
            CustomDivider(),
            SizedBox(height: 50),
            ScientificSourcesShow(),

            // ====== URL
            SizedBox(height: 50),
            CustomDivider(),
            SizedBox(height: 50),
            Center(
                child: Text('لمزيد من المعلومات',
                    style: _style, textAlign: TextAlign.center)),
            SizedBox(height: 20),
            FlatButton(
              child: Center(child: Text('salimapp.org')),
              onPressed: ()=> _launchURL(),
            ),

            // ======= logos
            SizedBox(height: 50),
            CustomDivider(),
            SizedBox(height: 30),
            Image.asset("assets/partners.png", scale: 2.5),
            // ======= shear ======
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       RaisedButton(
            //         color: AppColors.red,
            //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         child: Icon(Icons.share, size: 30, color: Colors.white),
            //         onPressed: () async {
            //           setState(() => loading = true);
            //           _showMyDialog();
            //           await createPDF(
            //             MediaQuery.of(context).size,
            //             selected,
            //             fName.text.trim(),
            //             lName.text.trim(),
            //             h.text.trim(),
            //             m.text.trim(),
            //             address.text.trim(),
            //             other.text.trim(),
            //             _imageFile == null ? null : _imageFile.path,
            //           );
            //           setState(() => loading = false);
            //         },
            //       ),
            //       RaisedButton(
            //         color: AppColors.red,
            //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         child: Icon(Icons.home, size: 30, color: Colors.white),
            //         onPressed: () {
            //           // clear app data
            //           AppData.chooseImageList.clear();
            //           Percentage.percentage.clear();
            //           findViewById(context, SplashScreen());
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // loading ? Center(child: CircularProgressIndicator()) : Container(height: 1),
            SizedBox(height: 30),
            Center(
              child: RaisedButton(
                color: AppColors.red,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Icon(Icons.home, size: 30, color: Colors.white),
                onPressed: () {
                  // clear app data
                  AppData.chooseImageList.clear();
                  Percentage.percentage.clear();
                  findViewById(context, SplashScreen());
                },
              ),
            ),
            Container(height: 50),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://salimapp.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // void takeImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final PickedFile file = await _picker.getImage(source: ImageSource.camera);
  //   print("THE IMAGE FILE IS ${file.path}");
  //   setState(() {
  //     _imageFile = file;
  //   });
  // }

//   Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('جاري الان تصدير الملف الخاص بك'),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
}

class MyChooseCustomWidget extends StatelessWidget {
  final String image;
  const MyChooseCustomWidget({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(
              "assets/result_img/r_$image.png",
              scale: 2.5,
            ),
          ),
          SizedBox(width: 30),
          Container(
            child: Image.asset(
              "assets/result_ind/${image}_ind.png",
              scale: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          color: Color(0xffE7E7E7),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final int value;
  final String label;
  final selected;
  final Function(int value) onChanged;

  const CustomRadioButton({
    Key key,
    @required this.label,
    @required this.value,
    @required this.onChanged,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: selected ? value : 100,
          onChanged: onChanged,
        ),
        Text(label)
      ],
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       fit: StackFit.expand,
//       children: <Widget>[
//         Image.asset("assets/result_BC.png", fit: BoxFit.cover),
//         Center(
//           child: Container(
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(color: Theme.of(context).canvasColor),
//             child: SingleChildScrollView(
//               primary: false,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     AppStrings.resultIntro,
//                     style: style,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 30),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: AppColors.red,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           Percentage.getPercentage().toStringAsFixed(2) + "%",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 35,
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Image.asset("assets/alarm.png", scale: 2),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Text(AppStrings.resultInfo, style: style),
//                   SizedBox(height: 30),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: AppColors.red,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           Percentage.getMinutes(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30,
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Image.asset("assets/alarm.png", scale: 2),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // =====================  arrows =======================
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   // delete all percentages
//                   Percentage.percentage.clear();
//                   print(Percentage.percentage);
//                   findViewById(context, SplashScreen());
//                 },
//                 child: Image.asset('assets/icons/home_icon.png', scale: 2),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // remove the Touch percentage
//                   Percentage.percentage.removeLast();
//                   findViewById(context, TouchQ());
//                 },
//                 child: Image.asset('assets/icons/perv.png', scale: 2),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
