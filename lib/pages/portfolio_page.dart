import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/seo.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Portfolio | HS Digital IT Solutions',
      description:
          'Explore websites, mobile applications and custom software projects developed by HS Digital IT Solutions.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/portfolio',
      ogTitle: 'Portfolio | HS Digital IT Solutions',
      ogDescription:
          'Websites, mobile apps and custom software projects.',
      ogUrl:
          'https://hsdigitalitsolutions.com/portfolio',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'CollectionPage',
        'name': 'HS Digital IT Solutions Portfolio',
        'url': 'https://hsdigitalitsolutions.com/portfolio',
      }),
    );

    final projects = [
      'School Management System',
      'Mobile Applications',
      'Business Websites',
      'Custom Dashboards',
      'E-commerce Solutions',
      'Local Business Websites',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _PortfolioHeader(),
            const SizedBox(height: 70),
            const Text(
              'OUR WORK',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Digital Projects Built\nfor Real Businesses.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 52,
                fontWeight: FontWeight.w800,
                height: 1.05,
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: projects.map((project) {
                return Container(
                  width: 300,
                  height: 180,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      project,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _PortfolioHeader extends StatelessWidget {
  const _PortfolioHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Text(
            'HS DIGITAL IT SOLUTIONS',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home'),
          ),
        ],
      ),
    );
  }
}