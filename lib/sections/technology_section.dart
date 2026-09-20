import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class TechnologySection extends StatelessWidget {
  const TechnologySection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 48,
        vertical: mobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TechnologyHeading(),
              SizedBox(height: mobile ? 50 : 70),
              mobile
                  ? const _MobileTechnologyLayout()
                  : const _DesktopTechnologyLayout(),
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

class _TechnologyHeading extends StatelessWidget {
  const _TechnologyHeading();

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
              'TECHNOLOGY',
              style: TextStyle(
                color: AppColors.primaryBright,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          'Modern technology.\nBuilt for real-world use.',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: mobile ? 34 : 52,
            height: 1.08,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.4,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'We choose technologies based on the product, business requirements '
          'and long-term maintainability — not just trends.',
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
// DESKTOP
// ------------------------------------------------------------

class _DesktopTechnologyLayout extends StatefulWidget {
  const _DesktopTechnologyLayout();

  @override
  State<_DesktopTechnologyLayout> createState() =>
      _DesktopTechnologyLayoutState();
}

class _DesktopTechnologyLayoutState extends State<_DesktopTechnologyLayout> {
  int selectedIndex = 0;

  final List<_TechnologyCategory> categories = const [
    _TechnologyCategory(
      title: 'Web',
      subtitle: 'Responsive web experiences',
      icon: Icons.language_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Flutter Web',
          detail: 'Modern web applications',
          icon: Icons.web_rounded,
        ),
        _TechnologyItem(
          name: 'React',
          detail: 'Interactive interfaces',
          icon: Icons.data_object_rounded,
        ),
        _TechnologyItem(
          name: 'HTML / CSS / JS',
          detail: 'Business websites',
          icon: Icons.code_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Mobile',
      subtitle: 'Cross-platform applications',
      icon: Icons.phone_android_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Flutter',
          detail: 'Android & iOS apps',
          icon: Icons.flutter_dash_rounded,
        ),
        _TechnologyItem(
          name: 'REST APIs',
          detail: 'Backend communication',
          icon: Icons.api_rounded,
        ),
        _TechnologyItem(
          name: 'Responsive UI',
          detail: 'Consistent experiences',
          icon: Icons.devices_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Backend',
      subtitle: 'Scalable application services',
      icon: Icons.dns_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Java',
          detail: 'Enterprise backend',
          icon: Icons.coffee_rounded,
        ),
        _TechnologyItem(
          name: 'Spring Boot',
          detail: 'RESTful services',
          icon: Icons.account_tree_rounded,
        ),
        _TechnologyItem(
          name: 'MySQL',
          detail: 'Structured data',
          icon: Icons.storage_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Cloud',
      subtitle: 'Deployment & infrastructure',
      icon: Icons.cloud_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Hosting',
          detail: 'Website deployment',
          icon: Icons.cloud_upload_rounded,
        ),
        _TechnologyItem(
          name: 'SSL',
          detail: 'Secure connections',
          icon: Icons.lock_rounded,
        ),
        _TechnologyItem(
          name: 'DNS',
          detail: 'Domain configuration',
          icon: Icons.public_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Growth',
      subtitle: 'Digital visibility & analytics',
      icon: Icons.trending_up_rounded,
      technologies: [
        _TechnologyItem(
          name: 'SEO',
          detail: 'Search visibility',
          icon: Icons.search_rounded,
        ),
        _TechnologyItem(
          name: 'Google Business',
          detail: 'Local presence',
          icon: Icons.location_on_rounded,
        ),
        _TechnologyItem(
          name: 'Analytics',
          detail: 'Performance insights',
          icon: Icons.analytics_rounded,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selected = categories[selectedIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: Column(
            children: List.generate(categories.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _TechnologyCategoryButton(
                  category: categories[index],
                  selected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(child: _TechnologyDetails(category: selected)),
      ],
    );
  }
}

// ------------------------------------------------------------
// CATEGORY BUTTON
// ------------------------------------------------------------

class _TechnologyCategoryButton extends StatefulWidget {
  final _TechnologyCategory category;
  final bool selected;
  final VoidCallback onTap;

  const _TechnologyCategoryButton({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_TechnologyCategoryButton> createState() =>
      _TechnologyCategoryButtonState();
}

class _TechnologyCategoryButtonState extends State<_TechnologyCategoryButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.selected || hovering;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: active ? AppColors.surfaceLight : AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: active
                  ? AppColors.primary.withOpacity(.45)
                  : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.primary.withOpacity(.15)
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.category.icon,
                  size: 21,
                  color: active
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.category.subtitle,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16,
                color: active
                    ? AppColors.primaryBright
                    : AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// TECHNOLOGY DETAILS
// ------------------------------------------------------------

class _TechnologyDetails extends StatelessWidget {
  final _TechnologyCategory category;

  const _TechnologyDetails({required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 420,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(0.04, 0),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: slideAnimation, child: child),
          );
        },
        child: _TechnologyDetailsCard(
          key: ValueKey(category.title),
          category: category,
        ),
      ),
    );
  }
}

class _TechnologyDetailsCard extends StatelessWidget {
  final _TechnologyCategory category;

  const _TechnologyDetailsCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.20),
                  ),
                ),
                child: Icon(
                  category.icon,
                  color: AppColors.primaryBright,
                  size: 24,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Modern technologies selected based on project requirements.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          const Text(
            'TECHNOLOGIES',
            style: TextStyle(
              color: AppColors.primaryBright,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 14),

          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: category.technologies.map((technology) {
                  return _TechnologyChip(text: technology.name);
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.primaryBright,
                  size: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Technology is selected based on project requirements.',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      height: 1.4,
                    ),
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

class _TechnologyChip extends StatelessWidget {
  final String text;

  const _TechnologyChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
// ------------------------------------------------------------
// TECHNOLOGY CARD
// ------------------------------------------------------------

class _TechnologyCard extends StatefulWidget {
  final _TechnologyItem technology;

  const _TechnologyCard({required this.technology});

  @override
  State<_TechnologyCard> createState() => _TechnologyCardState();
}

class _TechnologyCardState extends State<_TechnologyCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 175,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: hovering ? AppColors.surfaceLight : AppColors.background,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: hovering
                ? AppColors.primary.withOpacity(.45)
                : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.technology.icon,
              color: hovering
                  ? AppColors.primaryBright
                  : AppColors.textSecondary,
              size: 23,
            ),
            const SizedBox(height: 15),
            Text(
              widget.technology.name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.technology.detail,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// MOBILE
// ------------------------------------------------------------

class _MobileTechnologyLayout extends StatelessWidget {
  const _MobileTechnologyLayout();

  static const categories = [
    _TechnologyCategory(
      title: 'Web',
      subtitle: 'Responsive web experiences',
      icon: Icons.language_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Flutter Web',
          detail: 'Modern web applications',
          icon: Icons.web_rounded,
        ),
        _TechnologyItem(
          name: 'React',
          detail: 'Interactive interfaces',
          icon: Icons.data_object_rounded,
        ),
        _TechnologyItem(
          name: 'HTML / CSS / JS',
          detail: 'Business websites',
          icon: Icons.code_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Mobile',
      subtitle: 'Cross-platform applications',
      icon: Icons.phone_android_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Flutter',
          detail: 'Android & iOS apps',
          icon: Icons.flutter_dash_rounded,
        ),
        _TechnologyItem(
          name: 'REST APIs',
          detail: 'Backend communication',
          icon: Icons.api_rounded,
        ),
        _TechnologyItem(
          name: 'Responsive UI',
          detail: 'Consistent experiences',
          icon: Icons.devices_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Backend',
      subtitle: 'Scalable application services',
      icon: Icons.dns_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Java',
          detail: 'Enterprise backend',
          icon: Icons.coffee_rounded,
        ),
        _TechnologyItem(
          name: 'Spring Boot',
          detail: 'RESTful services',
          icon: Icons.account_tree_rounded,
        ),
        _TechnologyItem(
          name: 'MySQL',
          detail: 'Structured data',
          icon: Icons.storage_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Cloud',
      subtitle: 'Deployment & infrastructure',
      icon: Icons.cloud_rounded,
      technologies: [
        _TechnologyItem(
          name: 'Hosting',
          detail: 'Website deployment',
          icon: Icons.cloud_upload_rounded,
        ),
        _TechnologyItem(
          name: 'SSL',
          detail: 'Secure connections',
          icon: Icons.lock_rounded,
        ),
        _TechnologyItem(
          name: 'DNS',
          detail: 'Domain configuration',
          icon: Icons.public_rounded,
        ),
      ],
    ),
    _TechnologyCategory(
      title: 'Growth',
      subtitle: 'Digital visibility & analytics',
      icon: Icons.trending_up_rounded,
      technologies: [
        _TechnologyItem(
          name: 'SEO',
          detail: 'Search visibility',
          icon: Icons.search_rounded,
        ),
        _TechnologyItem(
          name: 'Google Business',
          detail: 'Local presence',
          icon: Icons.location_on_rounded,
        ),
        _TechnologyItem(
          name: 'Analytics',
          detail: 'Performance insights',
          icon: Icons.analytics_rounded,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories.map((category) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _MobileTechnologyCard(category: category),
        );
      }).toList(),
    );
  }
}

class _MobileTechnologyCard extends StatefulWidget {
  final _TechnologyCategory category;

  const _MobileTechnologyCard({required this.category});

  @override
  State<_MobileTechnologyCard> createState() => _MobileTechnologyCardState();
}

class _MobileTechnologyCardState extends State<_MobileTechnologyCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: expanded ? AppColors.surfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: expanded
              ? AppColors.primary.withOpacity(.45)
              : AppColors.border,
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.category.icon,
                    color: AppColors.primaryBright,
                    size: 21,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.category.title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.category.subtitle,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: expanded ? .5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                children: widget.category.technologies.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          size: 18,
                          color: AppColors.primaryBright,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          item.detail,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// MODELS
// ------------------------------------------------------------

class _TechnologyCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<_TechnologyItem> technologies;

  const _TechnologyCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.technologies,
  });
}

class _TechnologyItem {
  final String name;
  final String detail;
  final IconData icon;

  const _TechnologyItem({
    required this.name,
    required this.detail,
    required this.icon,
  });
}
