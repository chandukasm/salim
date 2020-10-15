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

// import 'package:flutter/material.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _actualPageNumber = 1, _allPagesCount = 0;
//   bool isSampleDoc = true;
//   PdfController _pdfController;

//   @override
//   void initState() {
//     _pdfController = PdfController(
//       document: PdfDocument.openAsset('assets/sample.pdf'),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pdfController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         theme: ThemeData(primaryColor: Colors.white),
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('PdfView example'),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.navigate_before),
//                 onPressed: () {
//                   _pdfController.previousPage(
//                     curve: Curves.ease,
//                     duration: Duration(milliseconds: 100),
//                   );
//                 },
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   '$_actualPageNumber/$_allPagesCount',
//                   style: TextStyle(fontSize: 22),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.navigate_next),
//                 onPressed: () {
//                   _pdfController.nextPage(
//                     curve: Curves.ease,
//                     duration: Duration(milliseconds: 100),
//                   );
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.refresh),
//                 onPressed: () {
//                   if (isSampleDoc) {
//                     _pdfController.loadDocument(
//                         PdfDocument.openAsset('assets/dummy.pdf'));
//                   } else {
//                     _pdfController.loadDocument(
//                         PdfDocument.openAsset('assets/sample.pdf'));
//                   }
//                   isSampleDoc = !isSampleDoc;
//                 },
//               )
//             ],
//           ),
//           body: PdfView(
//             documentLoader: Center(child: CircularProgressIndicator()),
//             pageLoader: Center(child: CircularProgressIndicator()),
//             controller: _pdfController,
//             onDocumentLoaded: (document) {
//               setState(() {
//                 _actualPageNumber = 1;
//                 _allPagesCount = document.pagesCount;
//               });
//             },
//             onPageChanged: (page) {
//               setState(() {
//                 _actualPageNumber = page;
//               });
//             },
//           ),
//         ),
//       );
// }
