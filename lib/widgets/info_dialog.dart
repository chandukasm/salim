import 'package:flutter/material.dart';

void information(BuildContext _context, String image) {
  showDialog(
    context: _context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset("assets/info/$image.png"),
                    // Container(child: widget),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 100,
                    width: 100,
                    // color: Colors.green,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}