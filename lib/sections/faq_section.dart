import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 48,
        vertical: mobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _FaqHeading(),
              SizedBox(height: mobile ? 45 : 65),
              const _FaqList(),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// HEADING
// ------------------------------------------------------------
class _FaqHeading extends StatelessWidget {
  const _FaqHeading();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 28, height: 1, color: AppColors.primary),
            const SizedBox(width: 12),
            const Text(
              'FREQUENTLY ASKED QUESTIONS',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Text(
          'Questions about our\nweb & app development services?',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: mobile ? 34 : 50,
            height: 1.08,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.3,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          'Find answers about website development, mobile app development, '
          'custom software, hosting, SEO and digital marketing services '
          'from HS Digital Solutions in Khammam, Telangana.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
// ------------------------------------------------------------
// FAQ LIST
// ------------------------------------------------------------

class _FaqList extends StatefulWidget {
  const _FaqList();

  @override
  State<_FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<_FaqList> {
  int? expandedIndex;

  final List<_FaqItem> items = const [
    _FaqItem(
      question: 'What kind of projects do you build?',
      answer:
          'We work on business websites, mobile applications, custom software, '
          'e-commerce solutions, APIs, integrations and digital infrastructure.',
    ),
    _FaqItem(
      question: 'Can you build a website specifically for my business?',
      answer:
          'Yes. We build websites based on the business, target customers, '
          'required features and the type of online presence you need.',
    ),
    _FaqItem(
      question: 'Do you also develop mobile applications?',
      answer:
          'Yes. We develop cross-platform mobile applications and can connect '
          'them with custom backends and REST APIs when required.',
    ),
    _FaqItem(
      question: 'Can you develop the backend and APIs too?',
      answer:
          'Yes. Backend development, REST APIs, authentication, databases and '
          'third-party integrations can be included depending on the project.',
    ),
    _FaqItem(
      question: 'Do you provide domain and hosting?',
      answer:
          'Yes. We can help with domain setup, DNS, hosting, SSL, deployment '
          'and the technical configuration required to make your website live.',
    ),
    _FaqItem(
      question: 'Can you maintain the website after launch?',
      answer:
          'Yes. Maintenance can include content changes, technical fixes, '
          'updates, deployment support and other ongoing requirements.',
    ),
    _FaqItem(
      question: 'Do you provide SEO and digital marketing?',
      answer:
          'We can help with website SEO foundations, Google Business presence, '
          'analytics and selected digital marketing activities based on your goals.',
    ),
    _FaqItem(
      question: 'How much does a project cost?',
      answer:
          'Every project is different. The cost depends on the scope, features, '
          'design, integrations, development effort and ongoing requirements. '
          'Contact us and we can understand your requirement before discussing the cost.',
    ),
    _FaqItem(
      question: 'How do I get started?',
      answer:
          'Simply contact us and tell us what you are trying to build. We can '
          'discuss your idea, understand the requirements and determine the next steps.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _FaqTile(
            item: item,
            expanded: expandedIndex == index,
            onTap: () {
              setState(() {
                expandedIndex = expandedIndex == index ? null : index;
              });
            },
          ),
        );
      }),
    );
  }
}

// ------------------------------------------------------------
// FAQ TILE
// ------------------------------------------------------------

class _FaqTile extends StatelessWidget {
  final _FaqItem item;
  final bool expanded;
  final VoidCallback onTap;

  const _FaqTile({
    required this.item,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: expanded ? AppColors.surfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: expanded
              ? AppColors.primary.withOpacity(.45)
              : AppColors.border,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: expanded
                          ? AppColors.primary.withOpacity(.12)
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        '?',
                        style: TextStyle(
                          color: expanded
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      item.question,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimatedRotation(
                    turns: expanded ? .5 : 0,
                    duration: const Duration(milliseconds: 220),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: expanded
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      size: 23,
                    ),
                  ),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 220),
                crossFadeState: expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(left: 49, right: 30, top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.answer,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.65,
                      ),
                    ),
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

// ------------------------------------------------------------
// MODEL
// ------------------------------------------------------------

class _FaqItem {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});
}
