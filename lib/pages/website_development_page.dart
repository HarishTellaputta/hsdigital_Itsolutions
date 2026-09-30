import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';
import '../core/seo.dart';

class WebsiteDevelopmentPage extends StatelessWidget {
  const WebsiteDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    SeoHelper.setPageSeo(
      title: 'Website Development in Khammam | HS Digital IT Solutions',
      description:
          'Professional website development in Khammam for businesses, startups, schools, restaurants and organizations. HS Digital IT Solutions builds responsive, SEO-friendly websites.',
      canonicalUrl:
          'https://hsdigitalitsolutions.com/website-development-khammam',
      ogTitle:
          'Website Development in Khammam | HS Digital IT Solutions',
      ogDescription:
          'Professional website development services in Khammam for businesses, startups, schools, restaurants and organizations.',
      ogUrl:
          'https://hsdigitalitsolutions.com/website-development-khammam',
      schemaJson: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Service',
        'name': 'Website Development in Khammam',
        'serviceType': 'Website Development',
        'provider': {
          '@type': 'ProfessionalService',
          'name': 'HS Digital IT Solutions',
          'url': 'https://hsdigitalitsolutions.com/',
        },
        'areaServed': [
          {
            '@type': 'City',
            'name': 'Khammam',
          },
          {
            '@type': 'State',
            'name': 'Telangana',
          },
          {
            '@type': 'Country',
            'name': 'India',
          },
        ],
        'description':
            'Professional website development services in Khammam for businesses, startups, schools, restaurants and organizations.',
        'url':
            'https://hsdigitalitsolutions.com/website-development-khammam',
      }),
    );

 final mobile = Responsive.isMobile(context);
    return Scaffold(
   
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _TopBar(mobile: mobile),
            _HeroSection(mobile: mobile),
            _ServicesSection(mobile: mobile),
            _WhyChooseSection(mobile: mobile),
            _ProcessSection(mobile: mobile),
            _TechnologySection(mobile: mobile),
            _FaqSection(mobile: mobile),
            _CtaSection(mobile: mobile),
            _Footer(),
          ],
        ),
      ),
    );
  
  }}

// ============================================================
// TOP BAR
// ============================================================

class _TopBar extends StatelessWidget {
  final bool mobile;

  const _TopBar({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 60,
        vertical: 18,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/hs_logo.png',
            width: 42,
            height: 42,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HS DIGITAL IT SOLUTIONS',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Build. Launch. Grow.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 9.5,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .7,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (!mobile)
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 18,
              ),
              label: const Text('Back to Home'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// HERO
// ============================================================

class _HeroSection extends StatelessWidget {
  final bool mobile;

  const _HeroSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 70 : 100,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.primary.withOpacity(.20),
              ),
            ),
            child: const Text(
              'WEBSITE DEVELOPMENT IN KHAMMAM',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Professional Website Development\nfor Businesses in Khammam.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 36 : 58,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.8,
            ),
          ),

          const SizedBox(height: 24),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 780,
            ),
            child: const Text(
              'HS Digital IT Solutions builds modern, responsive and '
              'business-focused websites for companies, startups, schools, '
              'restaurants, organizations and local businesses in Khammam, '
              'Telangana and across India.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 17,
                height: 1.75,
              ),
            ),
          ),

          const SizedBox(height: 34),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 12,
            children: [
              _PrimaryButton(
                text: 'Start Your Website',
                icon: Icons.arrow_forward_rounded,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              _SecondaryButton(
                text: 'View Our Work',
                icon: Icons.work_outline_rounded,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),

          const SizedBox(height: 55),

          _HeroStats(mobile: mobile),
        ],
      ),
    );
  }
}

// ============================================================
// HERO STATS
// ============================================================

class _HeroStats extends StatelessWidget {
  final bool mobile;

  const _HeroStats({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Icons.devices_rounded,
        'Responsive',
        'Mobile & desktop'
      ),
      (
        Icons.speed_rounded,
        'Performance',
        'Fast loading'
      ),
      (
        Icons.search_rounded,
        'SEO Ready',
        'Search friendly'
      ),
      (
        Icons.security_rounded,
        'Secure',
        'SSL ready'
      ),
    ];

    if (mobile) {
      return Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _HeroStat(
                  icon: item.$1,
                  title: item.$2,
                  subtitle: item.$3,
                ),
              ),
            )
            .toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: _HeroStat(
                icon: item.$1,
                title: item.$2,
                subtitle: item.$3,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _HeroStat({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 19,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SERVICES
// ============================================================

class _ServicesSection extends StatelessWidget {
  final bool mobile;

  const _ServicesSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final services = [
      (
        Icons.business_rounded,
        'Business Websites',
        'Professional websites that clearly present your business, services, contact information and brand online.'
      ),
      (
        Icons.shopping_cart_outlined,
        'E-commerce Websites',
        'Online stores with product listings, categories, customer-friendly interfaces and business management features.'
      ),
      (
        Icons.school_outlined,
        'School Websites',
        'Modern websites for schools and educational organizations with announcements, information and enquiry features.'
      ),
      (
        Icons.restaurant_outlined,
        'Restaurant Websites',
        'Mobile-friendly restaurant websites with menus, contact details, locations and online enquiry options.'
      ),
      (
        Icons.dashboard_customize_outlined,
        'Custom Web Applications',
        'Web-based business applications designed around your specific workflow and operational requirements.'
      ),
      (
        Icons.rocket_launch_outlined,
        'Startup Websites',
        'Modern startup websites designed to communicate your product, services and business idea effectively.'
      ),
    ];

    return _SectionWrapper(
      background: AppColors.surfaceLight,
      child: Column(
        children: [
          const _SectionLabel(
            text: 'OUR WEBSITE SERVICES',
          ),
          const SizedBox(height: 18),
          Text(
            'Websites designed around\nyour business goals.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 34 : 50,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 18),
          const _SectionDescription(
            text:
                'From simple business websites to custom web applications, '
                'we create digital experiences that help businesses build '
                'their online presence.',
          ),
          const SizedBox(height: 45),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = mobile ? 1 : 3;
              final spacing = 18.0;
              final width = mobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - (spacing * 2)) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: services
                    .map(
                      (service) => SizedBox(
                        width: width,
                        child: _ServiceCard(
                          icon: service.$1,
                          title: service.$2,
                          description: service.$3,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() => hovered = true);
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: hovered
                ? AppColors.primary.withOpacity(.35)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: hovered
                  ? AppColors.primary.withOpacity(.08)
                  : Colors.black.withOpacity(.025),
              blurRadius: hovered ? 25 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: AppColors.primary,
                size: 22,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// WHY CHOOSE US
// ============================================================

class _WhyChooseSection extends StatelessWidget {
  final bool mobile;

  const _WhyChooseSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final points = [
      (
        Icons.phone_android_rounded,
        'Mobile Friendly',
        'Your website is designed to work smoothly across phones, tablets and desktop devices.'
      ),
      (
        Icons.speed_rounded,
        'Performance Focused',
        'We build clean interfaces with performance and usability in mind.'
      ),
      (
        Icons.search_rounded,
        'SEO Friendly',
        'We structure website content and pages with search visibility in mind.'
      ),
      (
        Icons.manage_accounts_outlined,
        'Easy to Manage',
        'Websites can be built around your business requirements and future updates.'
      ),
      (
        Icons.security_rounded,
        'Secure Setup',
        'SSL, hosting and deployment can be configured as part of your website launch.'
      ),
      (
        Icons.support_agent_rounded,
        'Ongoing Support',
        'We can provide hosting, maintenance and technical support after launch.'
      ),
    ];

    return _SectionWrapper(
      child: Column(
        children: [
          const _SectionLabel(
            text: 'WHY CHOOSE US',
          ),
          const SizedBox(height: 18),
          Text(
            'More than a website.\nA digital foundation for your business.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 34 : 48,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.4,
            ),
          ),
          const SizedBox(height: 18),
          const _SectionDescription(
            text:
                'We focus on creating practical websites that look professional, '
                'work well across devices and support your long-term business goals.',
          ),
          const SizedBox(height: 45),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = mobile ? 1 : 2;
              final spacing = 18.0;
              final width = mobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: points
                    .map(
                      (point) => SizedBox(
                        width: width,
                        child: _WhyCard(
                          icon: point.$1,
                          title: point.$2,
                          description: point.$3,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROCESS
// ============================================================

class _ProcessSection extends StatelessWidget {
  final bool mobile;

  const _ProcessSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      (
        '01',
        Icons.chat_bubble_outline_rounded,
        'Requirement',
        'We understand your business, audience, goals and website requirements.'
      ),
      (
        '02',
        Icons.design_services_outlined,
        'Design',
        'We plan the website structure, layout and user experience.'
      ),
      (
        '03',
        Icons.code_rounded,
        'Development',
        'The website is developed with the required features and responsive layouts.'
      ),
      (
        '04',
        Icons.verified_outlined,
        'Testing',
        'We test the website across devices, screens and important user flows.'
      ),
      (
        '05',
        Icons.rocket_launch_outlined,
        'Launch',
        'The website is deployed with domain, hosting and SSL configuration.'
      ),
    ];

    return _SectionWrapper(
      background: AppColors.surfaceLight,
      child: Column(
        children: [
          const _SectionLabel(
            text: 'OUR PROCESS',
          ),
          const SizedBox(height: 18),
          Text(
            'From idea to launch.\nA simple development process.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 34 : 50,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 45),
          Column(
            children: steps
                .map(
                  (step) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: _ProcessCard(
                      number: step.$1,
                      icon: step.$2,
                      title: step.$3,
                      description: step.$4,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProcessCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const _ProcessCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Text(
            number,
            style: TextStyle(
              color: AppColors.primary.withOpacity(.35),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 21,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TECHNOLOGY
// ============================================================

class _TechnologySection extends StatelessWidget {
  final bool mobile;

  const _TechnologySection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final technologies = [
      ('Flutter', Icons.phone_android_rounded),
      ('Spring Boot', Icons.settings_suggest_outlined),
      ('MySQL', Icons.storage_outlined),
      ('HTML / CSS', Icons.language_rounded),
      ('JavaScript', Icons.javascript_rounded),
      ('Cloud Hosting', Icons.cloud_outlined),
    ];

    return _SectionWrapper(
      child: Column(
        children: [
          const _SectionLabel(
            text: 'TECHNOLOGY',
          ),
          const SizedBox(height: 18),
          Text(
            'Modern technology.\nBuilt for real-world business.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 34 : 50,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 18),
          const _SectionDescription(
            text:
                'We select technologies based on the requirements, performance '
                'needs and long-term goals of each project.',
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: technologies
                .map(
                  (technology) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.border,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          technology.$2,
                          color: AppColors.primary,
                          size: 19,
                        ),
                        const SizedBox(width: 9),
                        Text(
                          technology.$1,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FAQ
// ============================================================

class _FaqSection extends StatelessWidget {
  final bool mobile;

  const _FaqSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final faqs = [
      (
        'How much does a website cost?',
        'Website cost depends on the design, number of pages, features and integrations required. We can provide a suitable quotation after understanding your requirements.'
      ),
      (
        'How long does website development take?',
        'The timeline depends on the project size and required features. A simple business website generally requires less development time than a custom web application.'
      ),
      (
        'Can you provide domain and hosting?',
        'Yes. Domain configuration, web hosting, SSL and deployment can be handled as part of the website launch.'
      ),
      (
        'Will my website work on mobile phones?',
        'Yes. We build responsive websites designed to work across mobile phones, tablets and desktop screens.'
      ),
      (
        'Can you maintain the website after launch?',
        'Yes. Hosting, maintenance, updates and technical support can be provided based on your requirements.'
      ),
    ];

    return _SectionWrapper(
      background: AppColors.surfaceLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel(
            text: 'FREQUENTLY ASKED QUESTIONS',
          ),
          const SizedBox(height: 18),
          Text(
            'Questions about website\ndevelopment in Khammam?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: mobile ? 34 : 50,
              height: 1.08,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 40),
          ...faqs.map(
            (faq) => _FaqItem(
              question: faq.$1,
              answer: faq.$2,
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() => expanded = value);
        },
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          20,
        ),
        iconColor: AppColors.primary,
        collapsedIconColor: AppColors.textSecondary,
        title: Text(
          widget.question,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.answer,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CTA
// ============================================================

class _CtaSection extends StatelessWidget {
  final bool mobile;

  const _CtaSection({
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 65 : 85,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 25 : 60,
          vertical: mobile ? 40 : 55,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Text(
              'Ready to build your business website?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: mobile ? 30 : 44,
                height: 1.1,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 16),
             ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 650,
              ),
              child: Text(
                'Talk to HS Digital IT Solutions about your website '
                'requirements and let us plan the right digital solution '
                'for your business.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 19,
              ),
              label: const Text(
                'Contact HS Digital IT Solutions',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FOOTER
// ============================================================

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: const Column(
        children: [
          Text(
            'HS DIGITAL IT SOLUTIONS',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Website development, mobile app development, '
            'custom software, hosting and digital marketing.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '© HS Digital IT Solutions',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SHARED COMPONENTS
// ============================================================

class _SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color background;

  const _SectionWrapper({
    required this.child,
    this.background = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: background,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 65 : 90,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primary.withOpacity(.20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}

class _SectionDescription extends StatelessWidget {
  final String text;

  const _SectionDescription({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 720,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          height: 1.7,
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _SecondaryButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(
          color: AppColors.border,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}