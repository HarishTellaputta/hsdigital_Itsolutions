import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/seo.dart';
import '../core/responsive.dart';


class MobileAppDevelopmentPage extends StatelessWidget {
  const MobileAppDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Mobile App Development in Khammam | HS Digital IT Solutions',
      description: 'Professional mobile app development in Khammam for businesses, schools, startups and organizations. HS Digital IT Solutions develops scalable Android, iOS and cross-platform mobile applications.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/mobile-app-development-khammam',
      ogTitle: 'Mobile App Development in Khammam | HS Digital IT Solutions',
      ogDescription: 'Android, iOS and cross-platform mobile app development services in Khammam.',
      ogUrl: 'https://hsdigitalitsolutions.com/mobile-app-development-khammam',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Service',
        'name': 'Mobile App Development in Khammam',
        'serviceType': 'Mobile App Development',
        'provider': {
          '@type': 'ProfessionalService',
          'name': 'HS Digital IT Solutions',
          'url': 'https://hsdigitalitsolutions.com/',
        },
        'areaServed': {'@type': 'City', 'name': 'Khammam'},
        'url':
            'https://hsdigitalitsolutions.com/mobile-app-development-khammam',
      }),
    );

    final mobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            _Hero(mobile: mobile),
            _Services(),
            _Technology(),
            _Cta(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 60,
        vertical: 18,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const Text(
            'HS DIGITAL IT SOLUTIONS',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final bool mobile;

  const _Hero({required this.mobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 24 : 80,
        vertical: mobile ? 70 : 110,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'MOBILE APP DEVELOPMENT IN KHAMMAM',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Mobile Apps Built\nfor Modern Businesses.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 38 : 58,
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'We build reliable Android, iOS and cross-platform mobile applications for businesses, schools, startups and organizations.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _Services extends StatelessWidget {
  const _Services();

  @override
  Widget build(BuildContext context) {
    final items = [
      'Business Applications',
      'School Management Apps',
      'E-commerce Apps',
      'Customer Apps',
      'Admin Applications',
      'Custom Mobile Solutions',
    ];

    return Padding(
      padding: const EdgeInsets.all(60),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: items.map((item) {
          return Container(
            width: 280,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              item,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Technology extends StatelessWidget {
  const _Technology();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      color: AppColors.surfaceLight,
      child: const Column(
        children: [
          Text(
            'TECHNOLOGY',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Flutter • Dart • Spring Boot • Java • MySQL • REST APIs',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _Cta extends StatelessWidget {
  const _Cta();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          const Text(
            'Have an app idea?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Let us turn your idea into a working mobile application.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            child: const Text('Discuss Your Project'),
          ),
        ],
      ),
    );
  }
}
