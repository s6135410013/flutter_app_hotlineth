import 'package:flutter_app_hotline/screens/home_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NotoSansThai",
      ),
      home: HomeUI(),
    ),
  );
}
