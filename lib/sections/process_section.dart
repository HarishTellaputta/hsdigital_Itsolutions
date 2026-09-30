import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProcessSectionContent();
  }
}

class _ProcessSectionContent extends StatelessWidget {
  const _ProcessSectionContent();

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
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProcessHeading(),
              SizedBox(height: mobile ? 55 : 75),
              mobile
                  ? const _MobileProcessTimeline()
                  : const _DesktopProcessTimeline(),
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
class _ProcessHeading extends StatelessWidget {
  const _ProcessHeading();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 1,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12),
            const Text(
              'OUR DEVELOPMENT PROCESS',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Text(
          'From idea to launch —\nwith a clear process.',
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
          'Our website, mobile app and custom software development process '
          'keeps every project structured, transparent and focused on '
          'building practical digital solutions for your business.',
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
// DESKTOP TIMELINE
// ------------------------------------------------------------

class _DesktopProcessTimeline extends StatefulWidget {
  const _DesktopProcessTimeline();

  @override
  State<_DesktopProcessTimeline> createState() =>
      _DesktopProcessTimelineState();
}

class _DesktopProcessTimelineState extends State<_DesktopProcessTimeline> {
  int selectedIndex = 0;

  final List<_ProcessData> processes = const [
    _ProcessData(
      number: '01',
      title: 'Discover',
      description: 'We understand your business, goals, customers and the problem your digital product needs to solve.',
      icon: Icons.search_rounded,
    ),
    _ProcessData(
      number: '02',
      title: 'Plan',
      description: 'We define the features, structure, technology and development roadmap before writing the code.',
      icon: Icons.account_tree_rounded,
    ),
    _ProcessData(
      number: '03',
      title: 'Design',
      description: 'We create a clean user experience and interface that makes your product simple and professional.',
      icon: Icons.auto_awesome_rounded,
    ),
    _ProcessData(
      number: '04',
      title: 'Build',
      description: 'We develop the product using modern technologies with scalable architecture and maintainable code.',
      icon: Icons.code_rounded,
    ),
    _ProcessData(
      number: '05',
      title: 'Test',
      description: 'We test functionality, responsiveness and important user flows to identify and fix issues before launch.',
      icon: Icons.verified_rounded,
    ),
    _ProcessData(
      number: '06',
      title: 'Launch',
      description: 'We deploy your product, configure hosting and provide ongoing support as your business grows.',
      icon: Icons.rocket_launch_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: CustomPaint(
            painter: _ProcessLinePainter(
              itemCount: processes.length,
              activeIndex: selectedIndex,
            ),
            child: Row(
              children: List.generate(processes.length, (index) {
                return Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index <= selectedIndex
                              ? AppColors.primary
                              : AppColors.surface,
                          border: Border.all(
                            color: index <= selectedIndex
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1.5,
                          ),
                          boxShadow: index == selectedIndex
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(.25),
                                    blurRadius: 28,
                                    spreadRadius: 4,
                                  ),
                                ]
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            processes[index].number,
                            style: TextStyle(
                              color: index <= selectedIndex
                                  ? Colors.white
                                  : AppColors.textSecondary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(processes.length, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _DesktopProcessCard(
                  data: processes[index],
                  selected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// DESKTOP CARD
// ------------------------------------------------------------

class _DesktopProcessCard extends StatefulWidget {
  final _ProcessData data;
  final bool selected;
  final VoidCallback onTap;

  const _DesktopProcessCard({
    required this.data,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_DesktopProcessCard> createState() => _DesktopProcessCardState();
}

class _DesktopProcessCardState extends State<_DesktopProcessCard> {
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
          duration: const Duration(milliseconds: 220),
          height: 245,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: active
                ? AppColors.surfaceLight.withOpacity(.9)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: active
                  ? AppColors.primary.withOpacity(.55)
                  : AppColors.border,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(.08),
                      blurRadius: 35,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.primary.withOpacity(.16)
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.data.icon,
                  color: active
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 21,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                widget.data.number,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                widget.data.title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.data.description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12.5,
                    height: 1.55,
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
// MOBILE TIMELINE
// ------------------------------------------------------------

class _MobileProcessTimeline extends StatefulWidget {
  const _MobileProcessTimeline();

  @override
  State<_MobileProcessTimeline> createState() => _MobileProcessTimelineState();
}

class _MobileProcessTimelineState extends State<_MobileProcessTimeline> {
  int selectedIndex = 0;

  final List<_ProcessData> processes = const [
    _ProcessData(
      number: '01',
      title: 'Discover',
      description: 'We understand your business, goals, customers and the problem your digital product needs to solve.',
      icon: Icons.search_rounded,
    ),
    _ProcessData(
      number: '02',
      title: 'Plan',
      description: 'We define the features, structure, technology and development roadmap before writing the code.',
      icon: Icons.account_tree_rounded,
    ),
    _ProcessData(
      number: '03',
      title: 'Design',
      description: 'We create a clean user experience and interface that makes your product simple and professional.',
      icon: Icons.auto_awesome_rounded,
    ),
    _ProcessData(
      number: '04',
      title: 'Build',
      description: 'We develop the product using modern technologies with scalable architecture and maintainable code.',
      icon: Icons.code_rounded,
    ),
    _ProcessData(
      number: '05',
      title: 'Test',
      description: 'We test functionality, responsiveness and important user flows to identify and fix issues before launch.',
      icon: Icons.verified_rounded,
    ),
    _ProcessData(
      number: '06',
      title: 'Launch',
      description: 'We deploy your product, configure hosting and provide ongoing support as your business grows.',
      icon: Icons.rocket_launch_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(processes.length, (index) {
        final data = processes[index];

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 55,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == index
                              ? AppColors.primary
                              : AppColors.surface,
                          border: Border.all(
                            color: selectedIndex == index
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            data.number,
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (index != processes.length - 1)
                      Expanded(
                        child: Container(width: 1, color: AppColors.border),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: _MobileProcessCard(
                    data: data,
                    selected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// ------------------------------------------------------------
// MOBILE CARD
// ------------------------------------------------------------

class _MobileProcessCard extends StatelessWidget {
  final _ProcessData data;
  final bool selected;
  final VoidCallback onTap;

  const _MobileProcessCard({
    required this.data,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? AppColors.surfaceLight : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? AppColors.primary.withOpacity(.5)
                : AppColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              data.icon,
              color: selected
                  ? AppColors.primary
                  : AppColors.textSecondary,
              size: 22,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    data.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.55,
                    ),
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

// ------------------------------------------------------------
// PROCESS LINE PAINTER
// ------------------------------------------------------------

class _ProcessLinePainter extends CustomPainter {
  final int activeIndex;
  final int itemCount;

  _ProcessLinePainter({
    required this.activeIndex,
    required this.itemCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (itemCount <= 1) {
      return;
    }

    final centerY = size.height / 2;

    final linePaint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final activePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    // Full timeline
    canvas.drawLine(
      Offset(20, centerY),
      Offset(size.width - 20, centerY),
      linePaint,
    );

    // Calculate each step position
    final usableWidth = size.width - 40;
    final stepWidth = usableWidth / (itemCount - 1);

    // Active timeline
    if (activeIndex > 0) {
      final activeX = 20 + (stepWidth * activeIndex);

      canvas.drawLine(
        Offset(20, centerY),
        Offset(activeX, centerY),
        activePaint,
      );
    }

    // Timeline dots
    for (int i = 0; i < itemCount; i++) {
      final x = 20 + (stepWidth * i);

      final isActive = i <= activeIndex;

      final outerPaint = Paint()
        ..color = isActive
            ? AppColors.primary
            : AppColors.border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      final innerPaint = Paint()
        ..color = isActive
            ? AppColors.primary
            : AppColors.surfaceLight
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(x, centerY),
        8,
        outerPaint,
      );

      canvas.drawCircle(
        Offset(x, centerY),
        4.5,
        innerPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _ProcessLinePainter oldDelegate,
  ) {
    return oldDelegate.activeIndex != activeIndex ||
        oldDelegate.itemCount != itemCount;
  }
}

// ------------------------------------------------------------
// MODEL
// ------------------------------------------------------------

class _ProcessData {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _ProcessData({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}
