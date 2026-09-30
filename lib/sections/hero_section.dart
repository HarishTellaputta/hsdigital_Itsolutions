import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';
import '../widgets/animated_glow.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 720),
      child: Stack(
        children: [
          const Positioned.fill(child: IgnorePointer(child: AnimatedGlow())),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mobile ? 24 : 70,
              vertical: mobile ? 55 : 80,
            ),
            child: mobile
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroContent(),
                      SizedBox(height: 70),
                      _HeroVisual(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 10, child: _HeroContent()),
                      SizedBox(width: 40),
                      Expanded(flex: 10, child: _HeroVisual()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Small badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary.withOpacity(0.20)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 14,
                color: AppColors.primary,
              ),
              SizedBox(width: 8),
              Text(
                'DIGITAL SOLUTIONS FOR MODERN BUSINESS',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Main SEO heading
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Website & Mobile\n',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: mobile ? 42 : 60,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                ),
              ),
              TextSpan(
                text: 'App Development\n',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: mobile ? 42 : 60,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                ),
              ),
              TextSpan(
                text: 'Company in ',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: mobile ? 42 : 60,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                ),
              ),
              TextSpan(
                text: 'Khammam',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: mobile ? 42 : 60,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                ),
              ),
              const TextSpan(
                text: '.',
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),

        const SizedBox(height: 26),

        const SizedBox(
          width: 570,
          child: Text(
            'HS Digital IT Solutions builds professional websites, '
            'mobile apps and custom software for businesses, schools '
            'and organizations in Khammam, Telangana and across India. '
            'We also provide web hosting and digital marketing solutions.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 17,
              height: 1.7,
            ),
          ),
        ),

        const SizedBox(height: 34),

        Wrap(
          spacing: 16,
          runSpacing: 14,
          children: [
            _PrimaryButton(
              text: 'Start Your Project',
              icon: Icons.arrow_forward_rounded,
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            _SecondaryButton(
              text: 'View Our Work',
              onTap: () {
                Navigator.pushNamed(context, '/portfolio');
              },
            ),
          ],
        ),

        const SizedBox(height: 44),

        // Location / business information
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 18,
          runSpacing: 8,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 7),
                Text(
                  'Khammam, Telangana',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.border,
                shape: BoxShape.circle,
              ),
            ),
            const Text(
              'Web • Mobile • Software • Growth',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          hovered ? 0 : 0,
          hovered ? -2 : 0,
          0,
        ),
        child: ElevatedButton.icon(
          onPressed: widget.onTap,
          icon: Icon(widget.icon, size: 17),
          label: Text(widget.text),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: hovered ? 10 : 0,
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 17),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _SecondaryButton({required this.text, required this.onTap});

  @override
  State<_SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<_SecondaryButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          foregroundColor: hovered
              ? AppColors.primaryBright
              : AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 7),
            const Icon(Icons.arrow_forward_rounded, size: 17),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HERO VISUAL
// ============================================================

class _HeroVisual extends StatefulWidget {
  const _HeroVisual();

  @override
  State<_HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<_HeroVisual>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final float = math.sin(_controller.value * math.pi);

        return SizedBox(
          height: 550,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background grid
              Positioned.fill(child: CustomPaint(painter: _GridPainter())),

              // Main dashboard
              Positioned(
                left: 35,
                right: 25,
                top: 60 + (float * -8),
                child: _DashboardMockup(),
              ),

              // Mobile app card
              Positioned(
                right: -5,
                top: 285 + (float * 10),
                child: const _FloatingServiceCard(
                  icon: Icons.phone_android_rounded,
                  title: 'Mobile Apps',
                  subtitle: 'Android & iOS',
                  width: 165,
                ),
              ),

              // Hosting card
              Positioned(
                left: -5,
                top: 235 + (float * 7),
                child: const _FloatingServiceCard(
                  icon: Icons.cloud_outlined,
                  title: 'Cloud Hosting',
                  subtitle: 'Deploy & Manage',
                  width: 165,
                ),
              ),

              // Marketing card
              Positioned(
                left: 40,
                bottom: 20 + (float * -8),
                child: const _FloatingServiceCard(
                  icon: Icons.trending_up_rounded,
                  title: 'Digital Growth',
                  subtitle: 'SEO & Marketing',
                  width: 170,
                ),
              ),

              // API badge
              Positioned(
                right: 60,
                top: 55 + (float * -12),
                child: _TinyBadge(
                  icon: Icons.code_rounded,
                  text: 'Custom Software',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================
// DASHBOARD MOCKUP
// ============================================================

class _DashboardMockup extends StatelessWidget {
  const _DashboardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.10),
            blurRadius: 50,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: Column(
        children: [
          // Browser bar
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                _dot(),
                _dot(),
                _dot(),
                const SizedBox(width: 18),
                Expanded(
                  child: Container(
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Business Dashboard',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      _MetricCard(
                        title: 'Revenue',
                        value: '₹48.5K',
                        icon: Icons.currency_rupee_rounded,
                      ),
                      const SizedBox(width: 10),
                      _MetricCard(
                        title: 'Visitors',
                        value: '12.8K',
                        icon: Icons.people_outline_rounded,
                      ),
                      const SizedBox(width: 10),
                      _MetricCard(
                        title: 'Growth',
                        value: '+28%',
                        icon: Icons.trending_up_rounded,
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Expanded(
                    child: Row(
                      children: [
                        Expanded(flex: 7, child: _ChartCard()),
                        const SizedBox(width: 12),
                        Expanded(flex: 3, child: _ProgressCard()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: 7,
      height: 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
        color: AppColors.textSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}

// ============================================================
// METRIC
// ============================================================

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primaryBright),
            const SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CHART
// ============================================================

class _ChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: CustomPaint(painter: _ChartPainter(), size: Size.infinite),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withOpacity(0.22),
          AppColors.primary.withOpacity(0.01),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final points = [
      Offset(0, size.height * .75),
      Offset(size.width * .12, size.height * .62),
      Offset(size.width * .23, size.height * .68),
      Offset(size.width * .35, size.height * .42),
      Offset(size.width * .48, size.height * .55),
      Offset(size.width * .60, size.height * .28),
      Offset(size.width * .72, size.height * .38),
      Offset(size.width * .84, size.height * .17),
      Offset(size.width, size.height * .08),
    ];

    final linePath = Path();

    linePath.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      linePath.lineTo(points[i].dx, points[i].dy);
    }

    final fillPath = Path.from(linePath)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, linePaint);

    for (final point in points) {
      canvas.drawCircle(point, 3, Paint()..color = AppColors.primaryBright);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ============================================================
// PROGRESS
// ============================================================

class _ProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Growth',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
          ),
          Spacer(),
          Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                value: .78,
                strokeWidth: 5,
                backgroundColor: AppColors.border,
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
          ),
          Spacer(),
          Text(
            '78%',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FLOATING SERVICE CARD
// ============================================================

class _FloatingServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double width;

  const _FloatingServiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(.96),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.10),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: AppColors.primaryBright),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
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
// SMALL BADGE
// ============================================================

class _TinyBadge extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TinyBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(.95),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.primaryBright),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// GRID BACKGROUND
// ============================================================

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.25)
      ..strokeWidth = .5;

    const gap = 40.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
