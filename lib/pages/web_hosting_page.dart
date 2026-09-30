import 'dart:convert';

import 'package:flutter/material.dart';

import '../core/seo.dart';
import '../widgets/simple_service_page.dart';

class WebHostingPage extends StatelessWidget {
  const WebHostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Web Hosting Services | HS Digital IT Solutions',
      description:
          'Reliable web hosting services for business websites and web applications with SSL, backups, performance and technical support.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/web-hosting',
      ogTitle:
          'Web Hosting Services | HS Digital IT Solutions',
      ogDescription:
          'Reliable hosting for websites and web applications.',
      ogUrl:
          'https://hsdigitalitsolutions.com/web-hosting',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Service',
        'name': 'Web Hosting Services',
        'serviceType': 'Web Hosting',
        'provider': {
          '@type': 'ProfessionalService',
          'name': 'HS Digital IT Solutions',
          'url': 'https://hsdigitalitsolutions.com/',
        },
        'areaServed': {
          '@type': 'Country',
          'name': 'India',
        },
        'url': 'https://hsdigitalitsolutions.com/web-hosting',
      }),
    );

    return const SimpleServicePage(
      label: 'WEB HOSTING',
      title: 'Hosting That Keeps\nYour Website Online.',
      description:
          'Hosting solutions for business websites and web applications with SSL, backups, performance and technical support.',
      items: [
        'Business Website Hosting',
        'Flutter Web Hosting',
        'Application Hosting',
        'SSL & Security',
        'Daily Backups',
        'Technical Support',
      ],
    );
  }
}