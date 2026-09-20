import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class MarketingSection extends StatelessWidget {
  const MarketingSection({super.key});

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
              const _MarketingHeading(),
              SizedBox(height: mobile ? 50 : 70),
              mobile
                  ? const _MobileMarketingLayout()
                  : const _DesktopMarketingLayout(),
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

class _MarketingHeading extends StatelessWidget {
  const _MarketingHeading();

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
              'DIGITAL GROWTH',
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
          'Build your presence.\nGrow your visibility.',
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
          'A great website is only the beginning. We help businesses improve '
          'their digital presence and make it easier for customers to find them.',
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

class _DesktopMarketingLayout extends StatelessWidget {
  const _DesktopMarketingLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 5, child: _GrowthDashboard()),
        SizedBox(width: 35),
        Expanded(flex: 4, child: _GrowthServices()),
      ],
    );
  }
}

// ------------------------------------------------------------
// GROWTH DASHBOARD
// ------------------------------------------------------------

class _GrowthDashboard extends StatefulWidget {
  const _GrowthDashboard();

  @override
  State<_GrowthDashboard> createState() => _GrowthDashboardState();
}

class _GrowthDashboardState extends State<_GrowthDashboard>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pulse = controller.value;

        return Container(
          height: 500,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _GrowthGridPainter()),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'DIGITAL PERFORMANCE',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(.2),
                            ),
                          ),
                          child: const Text(
                            'GROWTH',
                            style: TextStyle(
                              color: AppColors.primaryBright,
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Online visibility',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Track important digital signals in one place.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        const Expanded(
                          child: _GrowthMetric(
                            title: 'VISIBILITY',
                            value: '78%',
                            change: '+18%',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _GrowthMetric(
                            title: 'REACH',
                            value: '12.8K',
                            change: '+24%',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _GrowthMetric(
                            title: 'ENGAGEMENT',
                            value: '6.4%',
                            change: '+12%',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(.7),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Performance',
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Last 6 months',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: CustomPaint(
                                painter: _GrowthChartPainter(progress: pulse),
                                child: const SizedBox.expand(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ------------------------------------------------------------
// GROWTH METRIC
// ------------------------------------------------------------

class _GrowthMetric extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  const _GrowthMetric({
    required this.title,
    required this.value,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(.65),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: const TextStyle(
              color: Color(0xFF68DB87),
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// SERVICES
// ------------------------------------------------------------

class _GrowthServices extends StatelessWidget {
  const _GrowthServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _GrowthServiceCard(
          icon: Icons.search_rounded,
          title: 'Search Visibility',
          description: 'Improve the technical foundation and content structure of your website for search engines.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.location_on_rounded,
          title: 'Google Business',
          description: 'Strengthen your local online presence and make it easier for nearby customers to discover your business.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.share_rounded,
          title: 'Social Media',
          description: 'Create a consistent digital presence across relevant social platforms.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.analytics_rounded,
          title: 'Analytics & Insights',
          description: 'Track useful website and campaign signals to understand what is working.',
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// SERVICE CARD
// ------------------------------------------------------------

class _GrowthServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _GrowthServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_GrowthServiceCard> createState() => _GrowthServiceCardState();
}

class _GrowthServiceCardState extends State<_GrowthServiceCard> {
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
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: hovering ? AppColors.surfaceLight : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hovering
                ? AppColors.primary.withOpacity(.45)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: hovering
                    ? AppColors.primary.withOpacity(.15)
                    : AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: hovering
                    ? AppColors.primaryBright
                    : AppColors.textSecondary,
                size: 21,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      height: 1.45,
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
// MOBILE
// ------------------------------------------------------------

class _MobileMarketingLayout extends StatelessWidget {
  const _MobileMarketingLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _MobileGrowthVisual(),
        SizedBox(height: 20),
        _GrowthServiceCard(
          icon: Icons.search_rounded,
          title: 'Search Visibility',
          description: 'Improve the technical foundation and content structure of your website for search engines.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.location_on_rounded,
          title: 'Google Business',
          description: 'Strengthen your local online presence and make it easier for nearby customers to discover your business.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.share_rounded,
          title: 'Social Media',
          description: 'Create a consistent digital presence across relevant social platforms.',
        ),
        SizedBox(height: 12),
        _GrowthServiceCard(
          icon: Icons.analytics_rounded,
          title: 'Analytics & Insights',
          description: 'Track useful website and campaign signals to understand what is working.',
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// MOBILE VISUAL
// ------------------------------------------------------------

class _MobileGrowthVisual extends StatelessWidget {
  const _MobileGrowthVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up_rounded, color: AppColors.primaryBright),
              SizedBox(width: 10),
              Text(
                'Digital Performance',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Expanded(
                child: _GrowthMetric(
                  title: 'VISIBILITY',
                  value: '78%',
                  change: '+18%',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _GrowthMetric(
                  title: 'REACH',
                  value: '12.8K',
                  change: '+24%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            height: 190,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: CustomPaint(
              painter: _GrowthChartPainter(progress: 0),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// GRID PAINTER
// ------------------------------------------------------------

class _GrowthGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.30)
      ..strokeWidth = 1;

    const spacing = 40.0;

    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ------------------------------------------------------------
// CHART
// ------------------------------------------------------------

class _GrowthChartPainter extends CustomPainter {
  final double progress;

  _GrowthChartPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.border.withOpacity(.35)
      ..strokeWidth = 1;

    for (int i = 1; i < 5; i++) {
      final y = size.height * i / 5;

      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final linePaint = Paint()
      ..color = AppColors.primaryBright
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = AppColors.primary.withOpacity(.10)
      ..style = PaintingStyle.fill;

    final points = <Offset>[
      Offset(0, size.height * .78),
      Offset(size.width * .14, size.height * .72),
      Offset(size.width * .27, size.height * .74),
      Offset(size.width * .40, size.height * .56),
      Offset(size.width * .53, size.height * .61),
      Offset(size.width * .66, size.height * .39),
      Offset(size.width * .80, size.height * .29),
      Offset(size.width, size.height * (.18 - progress * .02)),
    ];

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(linePath(points), linePaint);

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);

    for (int i = 0; i < points.length; i++) {
      final point = points[i];

      canvas.drawCircle(
        point,
        i == points.length - 1 ? 5 : 3,
        Paint()..color = AppColors.primaryBright,
      );
    }
  }

  Path linePath(List<Offset> points) {
    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      final previous = points[i - 1];
      final current = points[i];

      final controlX = (previous.dx + current.dx) / 2;

      path.cubicTo(
        controlX,
        previous.dy,
        controlX,
        current.dy,
        current.dx,
        current.dy,
      );
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _GrowthChartPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
