import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppSizes {
  // Width SizedBox
  static const double wSizeBox01 = 1.0;
  static const double wSizeBox02 = 2.0;
  static const double wSizeBox03 = 3.0;
  static const double wSizeBox04 = 4.0;
  static const double wSizeBox05 = 5.0;
  static const double wSizeBox06 = 6.0;
  static const double wSizeBox07 = 7.0;
  static const double wSizeBox08 = 8.0;
  static const double wSizeBox09 = 9.0;
  static const double wSizeBox10 = 10.0;
  static const double wSizeBox12 = 12.0;
  static const double wSizeBox15 = 15.0;
  static const double wSizeBox20 = 20.0;
  static const double wSizeBox25 = 25.0;
  static const double wSizeBox30 = 30.0;
  static const double wSizeBox40 = 40.0;
  static const double wSizeBox50 = 50.0;
  static const double wSizeBox60 = 60.0;
  static const double wSizeBox70 = 70.0;
  static const double wSizeBox80 = 80.0;
  static const double wSizeBox90 = 90.0;
  static const double wSizeBox100 = 100.0;
  static const double wSizeBox120 = 120.0;
  static const double wSizeBox150 = 150.0;
  static const double wSizeBox165 = 165.0;

  // Height SizedBox
  static const double hSizeBox01 = 1.0;
  static const double hSizeBox02 = 2.0;
  static const double hSizeBox03 = 3.0;
  static const double hSizeBox04 = 4.0;
  static const double hSizeBox05 = 5.0;
  static const double hSizeBox06 = 6.0;
  static const double hSizeBox07 = 7.0;
  static const double hSizeBox08 = 8.0;
  static const double hSizeBox09 = 9.0;
  static const double hSizeBox10 = 10.0;
  static const double hSizeBox12 = 12.0;
  static const double hSizeBox15 = 15.0;
  static const double hSizeBox20 = 20.0;
  static const double hSizeBox25 = 25.0;
  static const double hSizeBox30 = 30.0;
  static const double hSizeBox40 = 40.0;
  static const double hSizeBox50 = 50.0;
  static const double hSizeBox60 = 60.0;
  static const double hSizeBox70 = 70.0;
  static const double hSizeBox80 = 80.0;
  static const double hSizeBox90 = 90.0;
  static const double hSizeBox100 = 100.0;
  static const double hSizeBox120 = 120.0;
  static const double hSizeBox150 = 150.0;
  static const double hSizeBox165 = 165.0;

  // Other sizes
  static const double borderRadius = 8.0;
  static const double textFieldHeight = 50.0;
  static const double buttonHeight = 50.0;
  static const double buttonWidth = 150.0;
}


Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}