import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salim/utils/colors.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

final List<String> discretionList = [
  "Aerosol transmission of SARS-CoV-2 \nEvidence for probable aerosol transmission of SARS-CoV-2 in a poorly ventilated restaurant CDC USA",
  "It is Time to Address Airborne Transmission of COVID-19 \nOxford University Infectious Diseases Society of America",
];
final List<String> pdfList = [
  "one.pdf",
  "two.pdf",
];

class ScientificSources extends StatelessWidget {
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
                      "المصادر العلمية",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 100),
                    for (int i = 0; i < discretionList.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => OpenPDF(pdf: pdfList[i]))),
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

class ScientificSourcesShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "المصادر العلمية",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          for (int i = 0; i < discretionList.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => OpenPDF(pdf: pdfList[i]))),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      discretionList[i],
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OpenPDF extends StatefulWidget {
  final String pdf;

  const OpenPDF({Key key, this.pdf}) : super(key: key);

  @override
  _OpenPDFState createState() => _OpenPDFState();
}

class _OpenPDFState extends State<OpenPDF> {
  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      // print("=====================");
      // print(dir);
      // print("=====================");
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  String render_pdf = "";
  @override
  void initState() {
    super.initState();
    print("PDF NAME ${widget.pdf}");
    print('assets/pdfs/${widget.pdf}');
    fromAsset('assets/pdfs/${widget.pdf}', widget.pdf).then((f) {
      setState(() {
        render_pdf = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.red,
        title: Text("PDF"),
      ),
      body: render_pdf.isEmpty
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : PDFView(filePath: render_pdf),
    );
  }
}
