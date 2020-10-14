// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/material.dart' show AssetImage;

// import 'app_data.dart';
// import 'percentage.dart';
// import 'strings.dart';

// // create PDF
// void createPDF(
//   Size size,
//   int selected,
//   String fName,
//   String lName,
//   String h,
//   String m,
//   String address,
//   String other,
//   String imagePath,
// ) async {
//   final font = await rootBundle.load("assets/fonts/REGULAR.ttf");
//   final ttf = pw.Font.ttf(font);

//   final pw.TextStyle style = pw.TextStyle(
//     fontWeight: pw.FontWeight.bold,
//     fontSize: 20,
//     font: ttf,
//     color: PdfColor.fromInt(0xff707070),
//   );

//   pw.TextStyle _style = pw.TextStyle(
//     fontSize: 30,
//     font: ttf,
//     color: PdfColor.fromInt(0xffCD4624),
//   );

//   final pdf = pw.Document();
//   print("IMAGE PATH IS $imagePath");
//   PdfImage camara = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: imagePath == null
//         ? AssetImage('assets/icons/camara.png')
//         : FileImage(File(imagePath)),
//   );

//   PdfImage alaram = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: AssetImage('assets/alarm.png'),
//   );

//   PdfImage partners = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: AssetImage('assets/partners.png'),
//   );

//   List _li = [];
//   // load image
//   for (String image in AppData.chooseImageList)
//     _li.add(await myChooseCustomPDF(image, pdf));

//   final List<String> discretionList = [
//     AppStrings.airQ1,
//     AppStrings.airQ2,
//     AppStrings.airQ3,
//     AppStrings.airQ4,
//   ];

//   final List<String> discretionListS = [
//     "Aerosol transmission of SARS-CoV-2 \nEvidence for probable aerosol transmission of SARS-CoV-2 in a poorly ventilated restaurant CDC USA",
//     "It is Time to Address Airborne Transmission of COVID-19 \nOxford University Infectious Diseases Society of America",
//   ];

//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       crossAxisAlignment: pw.CrossAxisAlignment.end,
//       build: (context) => [
//         // pw.SizedBox(height: 15),
//         textH1("ﻞﺼﻔﻤﻟﺍ ﺮﻳﺮﻘﺘﻟﺍ", ttf),
//         pw.SizedBox(height: 15),
//         pw.Center(
//           child: pw.Text(
//             "ﻢﺳﻻﺍ",
//             style: _style,
//           ),
//         ),
//         pw.SizedBox(height: 15),
//         pw.Padding(
//           padding: const pw.EdgeInsets.only(left: 10, right: 10),
//           child: pw.Container(
//             decoration: pw.BoxDecoration(
//               color: PdfColor.fromInt(0xffE7E7E7),
//               borderRadius: 5,
//             ),
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   textWithBox(fName.isEmpty ? "الاسم الأول اختياري" : fName,
//                       size, style),
//                   pw.SizedBox(height: 10),
//                   textWithBox(lName.isEmpty ? "اسم القبيلة اختياري" : lName,
//                       size, style),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // ======================== MAP =================
//         pw.SizedBox(height: 15),
//         DEVIDER(),
//         pw.SizedBox(height: 10),
//         pw.Center(
//             child: pw.Text(
//           "الموقع ",
//           style: _style,
//           textDirection: pw.TextDirection.rtl,
//         )),
//         pw.SizedBox(height: 10),
//         pw.Padding(
//           padding: const pw.EdgeInsets.only(left: 10, right: 10),
//           child: pw.Container(
//             decoration: pw.BoxDecoration(
//               color: PdfColor.fromInt(0xffE7E7E7),
//               borderRadius: 5,
//             ),
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   textWithBox(h.isEmpty ? "المحافظة اختياري" : h, size, style),
//                   pw.SizedBox(height: 10),
//                   textWithBox(m.isEmpty ? "المدينة اختياري" : m, size, style),
//                   pw.SizedBox(height: 10),
//                   textWithBox(address.isEmpty ? "العنوان اختياري" : address, size, style),
//                 ],
//               ),
//             ),
//           ),
//         ),

//         // =========================== RADIO ==============================
//         pw.SizedBox(height: 30),
//         pw.Center(
//             child: pw.Text(
//           "وصف الحيز الفراغي",
//           style: _style,
//           textDirection: pw.TextDirection.rtl,
//         )),
//         pw.SizedBox(height: 30),
//         pw.Center(
//           child: pw.Wrap(
//             spacing: 30,
//             children: [
//               pw.Column(
//                 mainAxisAlignment: pw.MainAxisAlignment.end,
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   for (int i = 0; i < 8; i++)
//                     pdfRadioButton(
//                       AppData.spaceChoose[i],
//                       selected == i ? true : false,
//                       style.copyWith(fontSize: 20),
//                     ),
//                 ],
//               ),
//               pw.Column(
//                 mainAxisAlignment: pw.MainAxisAlignment.start,
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   for (int i = 8; i < 16; i++)
//                     pdfRadioButton(
//                       AppData.spaceChoose[i],
//                       selected == i ? true : false,
//                       style.copyWith(fontSize: 20),
//                     ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         pw.SizedBox(height: 50),
//         pw.Padding(
//           padding: const pw.EdgeInsets.only(left: 10, right: 10),
//           child: pw.Container(
//             decoration: pw.BoxDecoration(
//               color: PdfColor.fromInt(0xffE7E7E7),
//               borderRadius: 5,
//             ),
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: textWithBox(other.isEmpty ? "اخرى:" : other, size, style),
//             ),
//           ),
//         ),
//         // ==================== TAKE IMAGE ===================
//         pw.SizedBox(height: 50),
//         DEVIDER(),
//         pw.SizedBox(height: 150),
//         textH1("صورة الحيز الفراغي", ttf),
//         pw.SizedBox(height: 50),
//         pw.Padding(
//           padding: const pw.EdgeInsets.only(left: 30, right: 30),
//           child: pw.Container(
//             height: 300,
//             decoration: pw.BoxDecoration(
//               color: PdfColor.fromInt(0xffE7E7E7),
//               borderRadius: 5,
//             ),
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Padding(
//                 padding: const pw.EdgeInsets.only(right: 8.0, bottom: 0.8),
//                 child: pw.Center(child: pw.Image(camara)),
//               ),
//             ),
//           ),
//         ),
//         // =============================== RESULT ===============================
//         pw.SizedBox(height: 100),
//         pw.Center(
//           child: pw.Container(
//             padding: pw.EdgeInsets.all(15),
//             decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff)),
//             child: pw.Column(
//               children: [
//                 textH1("الاحتمال", ttf),
//                 pw.SizedBox(height: 30),
//                 textH('" بحول الرحمن و رحمته "', style),
//                 pw.SizedBox(height: 30),
//                 textH(AppStrings.resultIntro, style),
//                 pw.SizedBox(height: 30),
//                 pw.Container(
//                   padding: pw.EdgeInsets.all(20),
//                   decoration: pw.BoxDecoration(
//                     color: PdfColor.fromInt(0xffCD4624),
//                     borderRadius: 15,
//                   ),
//                   child: pw.Row(
//                     mainAxisSize: pw.MainAxisSize.min,
//                     crossAxisAlignment: pw.CrossAxisAlignment.center,
//                     children: [
//                       textH(
//                         Percentage.getPercentage().toStringAsFixed(2) + "%",
//                         pw.TextStyle(
//                           font: ttf,
//                           color: PdfColor.fromInt(0xffffffff),
//                           fontWeight: pw.FontWeight.bold,
//                           fontSize: 35,
//                         ),
//                       ),
//                       pw.SizedBox(width: 20),
//                       pw.Image(alaram, width: 50, height: 50),
//                     ],
//                   ),
//                 ),
//                 pw.SizedBox(height: 30),
//                 textH(AppStrings.resultInfo, style),
//                 pw.SizedBox(height: 30),
//                 pw.Container(
//                   padding: pw.EdgeInsets.all(20),
//                   decoration: pw.BoxDecoration(
//                     color: PdfColor.fromInt(0xffCD4624),
//                     borderRadius: 15,
//                   ),
//                   child: pw.Row(
//                     mainAxisSize: pw.MainAxisSize.min,
//                     crossAxisAlignment: pw.CrossAxisAlignment.center,
//                     children: [
//                       textH(
//                         Percentage.getMinutes(),
//                         pw.TextStyle(
//                           color: PdfColor.fromInt(0xffffffff),
//                           fontWeight: pw.FontWeight.bold,
//                           fontSize: 30,
//                           font: ttf,
//                         ),
//                       ),
//                       pw.SizedBox(width: 20),
//                       pw.Image(alaram, width: 50, height: 50),
//                     ],
//                   ),
//                 ),
//                 pw.Padding(
//                   padding: const pw.EdgeInsets.all(20.0),
//                   child: textH(
//                     " يمكنك البقاء في هذه المساحة الفراغية لمدة أطول، شريطة تجديد الهواء بشكل مستمر و فعال.",
//                     style,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         // ===================== CHOOSE ======================
//         pw.SizedBox(height: 50),
//         DEVIDER(),
//         pw.SizedBox(height: 50),
//         textH1("اختياراتي", ttf),

//         for (var im in _li) im,

//         // ============= AIR ======
//         pw.SizedBox(height: 50),
//         DEVIDER(),
//         pw.SizedBox(height: 50),
//         pw.Padding(
//           padding: const pw.EdgeInsets.fromLTRB(15, 8, 30, 8),
//           child: pw.Column(
//             children: [
//               textH1("مقترحات لتحسين جودة الهواء ", ttf),
//               pw.SizedBox(height: 40),
//               for (int i = 0; i < discretionList.length; i++)
//                 pw.Padding(
//                   padding: const pw.EdgeInsets.only(bottom: 15),
//                   child: pw.Container(
//                     child: pw.Padding(
//                       padding: const pw.EdgeInsets.all(15.0),
//                       child: textH(
//                         discretionList[i],
//                         style.copyWith(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),

//         // ========== Sources =======
//         pw.SizedBox(height: 100),
//         DEVIDER(),
//         pw.SizedBox(height: 50),
//         //TODO:
//         pw.Column(
//           children: [
//             textH1("المصادر العلمية", ttf),
//             pw.SizedBox(height: 50),
//             for (int i = 0; i < discretionListS.length; i++)
//               pw.Center(
//                 child: pw.Padding(
//                   padding: const pw.EdgeInsets.only(bottom: 15),
//                   child: pw.Text(
//                     discretionListS[i],
//                     textAlign: pw.TextAlign.center,
//                     style: style.copyWith(fontSize: 16),
//                   ),
//                 ),
//               ),
//           ],
//         ),

//         // ======= logos ========
//         pw.SizedBox(height: 50),
//         DEVIDER(),
//         pw.SizedBox(height: 70),
//         pw.Center(
//           child: pw.Image(partners, width: size.width - 50),
//         ),
//         pw.Container(height: 50),
//       ],
//     ),
//   ); // Page

//   // Save the pdf
//   final String dir = (await getApplicationDocumentsDirectory()).path;
//   print(dir);
//   final String path = '$dir/test_pdf.pdf';
//   final File file = File(path);
//   await file.writeAsBytes(pdf.save());

//   await Printing.sharePdf(bytes: pdf.save(), filename: 'my-document.pdf');
// }

// pw.Padding DEVIDER() {
//   return pw.Padding(
//     padding: const pw.EdgeInsets.only(left: 30, right: 30),
//     child: pw.Container(
//       height: 10,
//       decoration: pw.BoxDecoration(
//         color: PdfColor.fromInt(0xffE7E7E7),
//         borderRadius: 5,
//       ),
//     ),
//   );
// }

// textH1(String text, pw.Font ttf) {
//   return pw.Center(
//     child: pw.Text(
//       text,
//       style: pw.TextStyle(
//         fontWeight: pw.FontWeight.bold,
//         fontSize: 30,
//         font: ttf,
//         color: PdfColor.fromInt(0xffCD4624),
//       ),
//       textDirection: pw.TextDirection.rtl,
//       textAlign: pw.TextAlign.center,
//     ),
//   );
// }

// textH(String text, pw.TextStyle style) {
//   return pw.Center(
//     child: pw.Text(
//       text,
//       style: style,
//       textDirection: pw.TextDirection.rtl,
//       textAlign: pw.TextAlign.center,
//     ),
//   );
// }

// pw.Padding textWithBox(String text, Size size, pw.TextStyle style) {
//   return pw.Padding(
//     padding: const pw.EdgeInsets.only(bottom: 10.0),
//     child: pw.Container(
//       width: size.width,
//       color: PdfColor.fromInt(0xFFFFFFFF),
//       child: pw.Padding(
//         padding: const pw.EdgeInsets.all(20),
//         child: pw.Align(
//           alignment: pw.Alignment.topRight,
//           child: pw.Text(
//             text,
//             style: style.copyWith(fontSize: 20),
//             textDirection: pw.TextDirection.rtl,
//             textAlign: pw.TextAlign.center,
//           ),
//         ),
//       ),
//     ),
//   );
// }

// pw.Text pdfRadioButton(String text, bool selected, pw.TextStyle style) {
//   return pw.Text(
//     text,
//     style: style.copyWith(
//         fontWeight: selected ? pw.FontWeight.bold : null,
//         color: selected ? PdfColor.fromInt(0xffCD4624) : null),
//     textDirection: pw.TextDirection.rtl,
//     textAlign: pw.TextAlign.center,
//   );
// }

// myChooseCustomPDF(String image, pw.Document pdf) async {
//   PdfImage imageChoose = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: AssetImage('assets/result_img/r_$image.png'),
//   );
//   PdfImage indentor = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: AssetImage('assets/result_ind/${image}_ind.png'),
//   );

//   return pw.Padding(
//     padding: const pw.EdgeInsets.only(right: 10, bottom: 30, left: 30),
//     child: pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.end,
//       crossAxisAlignment: pw.CrossAxisAlignment.end,
//       children: [
//         pw.Container(
//           width: 100,
//           height: 100,
//           child: pw.Image(indentor),
//         ),
//         pw.SizedBox(width: 50),
//         pw.Container(
//           width: 100,
//           height: 100,
//           child: pw.Image(imageChoose),
//         ),
//       ],
//     ),
//   );
// }
