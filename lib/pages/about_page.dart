import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/seo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'About Us | HS Digital IT Solutions',
      description:
          'Learn about HS Digital IT Solutions, a technology company providing website development, mobile apps, custom software, hosting and digital marketing solutions.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/about',
      ogTitle: 'About HS Digital IT Solutions',
      ogDescription:
          'Technology solutions for businesses in Khammam and across India.',
      ogUrl:
          'https://hsdigitalitsolutions.com/about',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'AboutPage',
        'name': 'About HS Digital IT Solutions',
        'url': 'https://hsdigitalitsolutions.com/about',
      }),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('← Back to Home'),
              ),
              const SizedBox(height: 60),
              const Text(
                'ABOUT HS DIGITAL IT SOLUTIONS',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Technology That Makes\nBusiness Simpler.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 52,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 30),
               ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 750),
                child: Text(
                  'HS Digital IT Solutions provides website development, mobile app development, custom software, web hosting and digital marketing solutions for businesses in Khammam, Telangana and across India.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 17,
                    height: 1.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}