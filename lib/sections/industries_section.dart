import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class IndustriesSection extends StatefulWidget {
  const IndustriesSection({super.key});

  @override
  State<IndustriesSection> createState() => _IndustriesSectionState();
}

class _IndustriesSectionState extends State<IndustriesSection> {
  int selectedIndex = 0;

  final industries = const [
    _IndustryData(
      title: 'Small Businesses',
      subtitle: 'Digital presence that helps local businesses get discovered.',
      icon: Icons.storefront_rounded,
      tag: 'BUSINESS',
    ),
    _IndustryData(
      title: 'Startups',
      subtitle: 'Technology foundations designed to grow with your idea.',
      icon: Icons.rocket_launch_rounded,
      tag: 'STARTUP',
    ),
    _IndustryData(
      title: 'Schools',
      subtitle: 'Digital platforms for modern school operations and communication.',
      icon: Icons.school_rounded,
      tag: 'EDUCATION',
    ),
    _IndustryData(
      title: 'Restaurants',
      subtitle: 'Web and digital solutions that connect restaurants with customers.',
      icon: Icons.restaurant_rounded,
      tag: 'FOOD',
    ),
    _IndustryData(
      title: 'Real Estate',
      subtitle: 'Property-focused websites and lead generation solutions.',
      icon: Icons.home_work_rounded,
      tag: 'PROPERTY',
    ),
    _IndustryData(
      title: 'Organizations',
      subtitle: 'Professional digital platforms for NGOs and organizations.',
      icon: Icons.groups_rounded,
      tag: 'ORGANIZATION',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 85 : 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const _IndustriesHeading(),
          SizedBox(height: mobile ? 50 : 70),

          if (mobile)
            Column(
              children: [
                _IndustryVisual(
                  data: industries[selectedIndex],
                ),
                const SizedBox(height: 25),
                _IndustryList(
                  industries: industries,
                  selectedIndex: selectedIndex,
                  onSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: _IndustryVisual(
                    data: industries[selectedIndex],
                  ),
                ),
                const SizedBox(width: 55),
                Expanded(
                  flex: 5,
                  child: _IndustryList(
                    industries: industries,
                    selectedIndex: selectedIndex,
                    onSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _IndustryData {
  final String title;
  final String subtitle;
  final IconData icon;
  final String tag;

  const _IndustryData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tag,
  });
}

class _IndustriesHeading extends StatelessWidget {
  const _IndustriesHeading();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Column(
      children: [
        Container(
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
          child: const Text(
            'WHO WE WORK WITH',
            style: TextStyle(
              color: AppColors.primaryBright,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 22),

        Text(
          'Technology for different\nkinds of businesses.',
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

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 680),
          child: Text(
            'Every business has different challenges. We build digital solutions around the way each business works.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}

class _IndustryVisual extends StatelessWidget {
  final _IndustryData data;

  const _IndustryVisual({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(.04, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey(data.title),
        height: Responsive.isMobile(context) ? 390 : 500,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CustomPaint(
                  painter: _IndustryGridPainter(),
                ),
              ),
            ),

            Positioned(
              top: 25,
              left: 25,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(.8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: Text(
                  data.tag,
                  style: const TextStyle(
                    color: AppColors.primaryBright,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            Center(
              child: _IndustryCoreVisual(
                data: data,
              ),
            ),

            Positioned(
              bottom: 25,
              left: 25,
              right: 25,
              child: Row(
                children: [
                  _MiniStat(
                    icon: Icons.language_rounded,
                    text: 'WEB',
                  ),
                  const SizedBox(width: 8),
                  _MiniStat(
                    icon: Icons.phone_android_rounded,
                    text: 'APP',
                  ),
                  const SizedBox(width: 8),
                  _MiniStat(
                    icon: Icons.analytics_outlined,
                    text: 'GROWTH',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndustryCoreVisual extends StatelessWidget {
  final _IndustryData data;

  const _IndustryCoreVisual({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceLight,
            border: Border.all(
              color: AppColors.primary.withOpacity(.4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(.12),
                blurRadius: 50,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            data.icon,
            size: 44,
            color: AppColors.primaryBright,
          ),
        ),

        const SizedBox(height: 28),

        Text(
          data.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 27,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: 350,
          child: Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MiniStat({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.background.withOpacity(.75),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 13,
              color: AppColors.primaryBright,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: .7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndustryList extends StatelessWidget {
  final List<_IndustryData> industries;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _IndustryList({
    required this.industries,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        industries.length,
        (index) {
          final item = industries[index];
          final selected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _IndustryItem(
              data: item,
              selected: selected,
              index: index,
              onTap: () => onSelected(index),
            ),
          );
        },
      ),
    );
  }
}

class _IndustryItem extends StatefulWidget {
  final _IndustryData data;
  final bool selected;
  final int index;
  final VoidCallback onTap;

  const _IndustryItem({
    required this.data,
    required this.selected,
    required this.index,
    required this.onTap,
  });

  @override
  State<_IndustryItem> createState() => _IndustryItemState();
}

class _IndustryItemState extends State<_IndustryItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.selected || hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: active
                ? AppColors.surfaceLight
                : AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: active
                  ? AppColors.primary.withOpacity(.35)
                  : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Text(
                '0${widget.index + 1}',
                style: TextStyle(
                  color: active
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(width: 18),

              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.primary.withOpacity(.12)
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.data.icon,
                  size: 20,
                  color: active
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: TextStyle(
                        color: active
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.data.tag,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 9,
                        letterSpacing: .8,
                      ),
                    ),
                  ],
                ),
              ),

              AnimatedRotation(
                turns: active ? -.125 : 0,
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 19,
                  color: active
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndustryGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.3)
      ..strokeWidth = .5;

    const gap = 40.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}