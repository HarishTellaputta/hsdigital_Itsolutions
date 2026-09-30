import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/seo.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Contact HS Digital IT Solutions | Khammam',
      description:
          'Contact HS Digital IT Solutions for website development, mobile app development, custom software, hosting and digital marketing services.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/contact',
      ogTitle:
          'Contact HS Digital IT Solutions | Khammam',
      ogDescription:
          'Get in touch for websites, mobile apps, software and digital solutions.',
      ogUrl:
          'https://hsdigitalitsolutions.com/contact',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'ContactPage',
        'name': 'Contact HS Digital IT Solutions',
        'url': 'https://hsdigitalitsolutions.com/contact',
      }),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Let’s Build Something\nUseful Together.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Contact HS Digital IT Solutions for websites, mobile applications, custom software, hosting and digital marketing.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 17,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}