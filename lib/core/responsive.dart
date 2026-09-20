import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return width >= 768 && width < 1100;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }
}