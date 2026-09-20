import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'theme/app_theme.dart';

class HSDigitalSolutionsApp extends StatelessWidget {
  const HSDigitalSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HS Digital Solutions',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}