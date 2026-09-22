import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 85 : 120,
      ),
      color: AppColors.surface,
      child: Column(
        children: [
          const _AboutHeader(),
          SizedBox(height: mobile ? 55 : 75),

          if (mobile)
            const Column(
              children: [_AboutContent(), SizedBox(height: 45), _FounderCard()],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: _AboutContent()),
                SizedBox(width: 80),
                Expanded(flex: 9, child: _FounderCard()),
              ],
            ),
        ],
      ),
    );
  }
}

class _AboutHeader extends StatelessWidget {
  const _AboutHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary.withOpacity(.20)),
          ),
          child: const Text(
            'ABOUT HS DIGITAL SOLUTIONS',
            style: TextStyle(
              color: AppColors.primaryBright,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technology should make\nbusiness simpler.',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: mobile ? 34 : 50,
            height: 1.08,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'HS Digital Solutions helps businesses turn ideas into practical digital products. We focus on building technology that is useful, scalable and easy to manage.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'From a business website to a complete mobile application or custom management system, we work closely with businesses to understand their requirements and build solutions around them.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 35),

        const Row(
          children: [
            _ValueItem(
              icon: Icons.lightbulb_outline_rounded,
              title: 'Practical',
              subtitle: 'Solutions',
            ),
            SizedBox(width: 18),
            _ValueItem(
              icon: Icons.code_rounded,
              title: 'Modern',
              subtitle: 'Technology',
            ),
            SizedBox(width: 18),
            _ValueItem(
              icon: Icons.support_agent_rounded,
              title: 'Long-term',
              subtitle: 'Support',
            ),
          ],
        ),
      ],
    );
  }
}

class _ValueItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ValueItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: AppColors.primaryBright),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FounderCard extends StatefulWidget {
  const _FounderCard();

  @override
  State<_FounderCard> createState() => _FounderCardState();
}

class _FounderCardState extends State<_FounderCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: hovered
                ? AppColors.primary.withOpacity(.45)
                : AppColors.border,
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.08),
                    blurRadius: 45,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FounderVisual(),

            const SizedBox(height: 28),

            const Text(
              'Founder',
              style: TextStyle(
                color: AppColors.primaryBright,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Syamalatha Tellaputta',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Founder & Technology Solutions',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),

            const SizedBox(height: 20),

            Container(height: 1, color: AppColors.border),

            const SizedBox(height: 18),

            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 17,
                  color: AppColors.primaryBright,
                ),
                SizedBox(width: 8),
                Text(
                  'Khammam, Telangana',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Row(
              children: [
                Icon(
                  Icons.business_center_outlined,
                  size: 17,
                  color: AppColors.primaryBright,
                ),
                SizedBox(width: 8),
                Text(
                  'Web • Mobile • Software',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
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

class _FounderVisual extends StatelessWidget {
  const _FounderVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(.16),
            AppColors.surfaceLight,
            AppColors.background,
          ],
        ),
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _FounderGridPainter())),

          Center(
            child: Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surfaceLight,
                border: Border.all(
                  color: AppColors.primary.withOpacity(.45),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.18),
                    blurRadius: 35,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'HS',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -2,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 20,
            left: 20,
            child: _FloatingLabel(icon: Icons.web_rounded, text: 'WEB'),
          ),

          Positioned(
            top: 20,
            right: 20,
            child: _FloatingLabel(
              icon: Icons.phone_android_rounded,
              text: 'APP',
            ),
          ),

          Positioned(
            bottom: 20,
            left: 35,
            child: _FloatingLabel(icon: Icons.code_rounded, text: 'SOFTWARE'),
          ),

          Positioned(
            bottom: 20,
            right: 35,
            child: _FloatingLabel(
              icon: Icons.trending_up_rounded,
              text: 'GROWTH',
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingLabel extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FloatingLabel({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(.88),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.primaryBright),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: .7,
            ),
          ),
        ],
      ),
    );
  }
}

class _FounderGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.35)
      ..strokeWidth = .5;

    const spacing = 32.0;

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
