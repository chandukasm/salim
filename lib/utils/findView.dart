import 'package:flutter/material.dart';

findViewById(BuildContext context, Widget view) {
  return Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => view));
}
