import 'dart:convert';

import 'package:flutter/material.dart';

import '../core/seo.dart';
import '../widgets/simple_service_page.dart';

class DigitalMarketingPage extends StatelessWidget {
  const DigitalMarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Digital Marketing in Khammam | HS Digital IT Solutions',
      description:
          'Digital marketing services in Khammam including SEO, social media marketing, Google Business optimization and online growth strategies.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/digital-marketing-khammam',
      ogTitle:
          'Digital Marketing in Khammam | HS Digital IT Solutions',
      ogDescription:
          'SEO, social media and digital marketing services for businesses.',
      ogUrl:
          'https://hsdigitalitsolutions.com/digital-marketing-khammam',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Service',
        'name': 'Digital Marketing in Khammam',
        'serviceType': 'Digital Marketing',
        'provider': {
          '@type': 'ProfessionalService',
          'name': 'HS Digital IT Solutions',
          'url': 'https://hsdigitalitsolutions.com/',
        },
        'areaServed': {
          '@type': 'City',
          'name': 'Khammam',
        },
        'url':
            'https://hsdigitalitsolutions.com/digital-marketing-khammam',
      }),
    );

    return const SimpleServicePage(
      label: 'DIGITAL MARKETING IN KHAMMAM',
      title: 'Build Your Online\nPresence.',
      description:
          'Digital marketing solutions that help businesses improve their online visibility and connect with customers.',
      items: [
        'Search Engine Optimization',
        'Google Business Profile',
        'Social Media Marketing',
        'Local SEO',
        'Website SEO',
        'Online Growth Strategy',
      ],
    );
  }
}