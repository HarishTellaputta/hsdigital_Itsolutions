import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/website_development_page.dart';
import 'theme/app_theme.dart';

class HSDigitalSolutionsApp extends StatelessWidget {
  const HSDigitalSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HS Digital IT Solutions',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),

        '/website-development-khammam': (context) =>
            const WebsiteDevelopmentPage(),
      },
    );
  }
}