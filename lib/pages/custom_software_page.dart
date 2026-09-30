import 'dart:convert';

import 'package:flutter/material.dart';

import '../core/seo.dart';
import '../widgets/simple_service_page.dart';

class CustomSoftwarePage extends StatelessWidget {
  const CustomSoftwarePage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Custom Software Development | HS Digital IT Solutions',
      description:
          'Custom software development services for businesses and organizations. HS Digital IT Solutions builds business management systems, dashboards, APIs and automation solutions.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/custom-software-development',
      ogTitle:
          'Custom Software Development | HS Digital IT Solutions',
      ogDescription:
          'Custom business software, management systems, dashboards and APIs.',
      ogUrl:
          'https://hsdigitalitsolutions.com/custom-software-development',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Service',
        'name': 'Custom Software Development',
        'serviceType': 'Custom Software Development',
        'provider': {
          '@type': 'ProfessionalService',
          'name': 'HS Digital IT Solutions',
          'url': 'https://hsdigitalitsolutions.com/',
        },
        'areaServed': {
          '@type': 'Country',
          'name': 'India',
        },
        'url':
            'https://hsdigitalitsolutions.com/custom-software-development',
      }),
    );

    return const SimpleServicePage(
      label: 'CUSTOM SOFTWARE DEVELOPMENT',
      title: 'Software Built Around\nyour Business.',
      description:
          'Custom business software, management systems, dashboards and automation solutions designed around your actual workflow.',
      items: [
        'Business Management Systems',
        'School Management Software',
        'Admin Dashboards',
        'REST API Development',
        'Database Applications',
        'Business Automation',
      ],
    );
  }
}