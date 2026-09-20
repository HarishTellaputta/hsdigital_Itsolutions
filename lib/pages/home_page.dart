import 'package:flutter/material.dart';

import '../sections/navbar_section.dart';
import '../sections/hero_section.dart';
import '../sections/services_section.dart';
import '../sections/about_section.dart';
import '../sections/industries_section.dart';
import '../sections/portfolio_section.dart';
import '../sections/process_section.dart';
import '../sections/technology_section.dart';
import '../sections/hosting_section.dart';
import '../sections/marketing_section.dart';
import '../sections/faq_section.dart';
import '../sections/contact_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarSection(),
            HeroSection(),
            ServicesSection(),
            AboutSection(),
            IndustriesSection(),
            ProcessSection(),
            TechnologySection(),
            HostingSection(),
            MarketingSection(),
            FaqSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
