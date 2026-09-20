import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';
import '../widgets/primary_button.dart';
import '../widgets/responsive_container.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF05070B),
      child: Column(
        children: [
          _FooterCta(
            onStartProject: () {
              _showMessage(
                context,
                'Scroll to Contact section to start your project.',
              );
            },
          ),

          const Divider(height: 1, color: AppColors.border),

          ResponsiveContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 55 : 70),
              child: isMobile
                  ? const _MobileFooterContent()
                  : const _DesktopFooterContent(),
            ),
          ),

          const Divider(height: 1, color: AppColors.border),

          ResponsiveContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: isMobile
                  ? const _MobileCopyright()
                  : const _DesktopCopyright(),
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

class _FooterCta extends StatelessWidget {
  final VoidCallback onStartProject;

  const _FooterCta({required this.onStartProject});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return ResponsiveContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isMobile ? 65 : 90),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 28 : 50),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CustomPaint(painter: _FooterCtaPainter()),
                ),
              ),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ctaText(),
                        const SizedBox(height: 28),
                        PrimaryButton(
                          text: 'Start a Project',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: onStartProject,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _ctaText()),
                        const SizedBox(width: 40),
                        PrimaryButton(
                          text: 'Start a Project',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: onStartProject,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ctaText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'READY TO BUILD?',
          style: TextStyle(
            color: AppColors.primaryBright,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Let’s turn your idea into something real.',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            height: 1.2,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Websites, mobile apps, custom software and digital solutions '
          'built around your business needs.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// DESKTOP FOOTER
// ============================================================

class _DesktopFooterContent extends StatelessWidget {
  const _DesktopFooterContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _BrandColumn()),

        const SizedBox(width: 50),

        Expanded(
          flex: 2,
          child: _FooterLinkColumn(
            title: 'Company',
            links: ['Home', 'About', 'Our Work', 'Process', 'Contact'],
          ),
        ),

        Expanded(
          flex: 2,
          child: _FooterLinkColumn(
            title: 'Services',
            links: [
              'Web Development',
              'Mobile Apps',
              'Custom Software',
              'Hosting',
              'Digital Growth',
            ],
          ),
        ),

        Expanded(flex: 3, child: _ContactColumn()),
      ],
    );
  }
}

// ============================================================
// MOBILE FOOTER
// ============================================================

class _MobileFooterContent extends StatelessWidget {
  const _MobileFooterContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BrandColumn(),

        const SizedBox(height: 45),

        _FooterLinkColumn(
          title: 'Company',
          links: ['Home', 'About', 'Our Work', 'Process', 'Contact'],
        ),

        const SizedBox(height: 35),

        _FooterLinkColumn(
          title: 'Services',
          links: [
            'Web Development',
            'Mobile Apps',
            'Custom Software',
            'Hosting',
            'Digital Growth',
          ],
        ),

        const SizedBox(height: 35),

        _ContactColumn(),
      ],
    );
  }
}

// ============================================================
// BRAND
// ============================================================

class _BrandColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFF7C5CFF)],
                ),
              ),
              child: const Center(
                child: Text(
                  'HS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              'DIGITAL SOLUTIONS',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 22),

        const Text(
          'Build. Launch. Grow.',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Digital solutions for businesses that want to build, '
          'launch and grow with technology.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// FOOTER LINKS
// ============================================================

class _FooterLinkColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterLinkColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),

        const SizedBox(height: 20),

        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                link,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CONTACT
// ============================================================

class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GET IN TOUCH',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),

        const SizedBox(height: 20),

        const _FooterContactItem(
          icon: Icons.phone_outlined,
          text: '+91 9010737075',
        ),

        const SizedBox(height: 14),

        const _FooterContactItem(
          icon: Icons.location_on_outlined,
          text:
              'Vijayanagara Colony,\n'
              'Near RestInt Hotel,\n'
              'Khammam, Telangana',
        ),

        const SizedBox(height: 22),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 7, color: Colors.greenAccent),
              SizedBox(width: 8),
              Text(
                'Available for new projects',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CONTACT ITEM
// ============================================================

class _FooterContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FooterContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primaryBright, size: 18),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.55,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// COPYRIGHT
// ============================================================

class _DesktopCopyright extends StatelessWidget {
  const _DesktopCopyright();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '© 2026 HS Digital Solutions. All rights reserved.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),

        Row(
          children: const [
            Text(
              'Build. Launch. Grow.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}

class _MobileCopyright extends StatelessWidget {
  const _MobileCopyright();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '© 2026 HS Digital Solutions. All rights reserved.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
        SizedBox(height: 8),
        Text(
          'Build. Launch. Grow.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
      ],
    );
  }
}

// ============================================================
// CTA BACKGROUND
// ============================================================

class _FooterCtaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.border.withOpacity(0.35)
      ..strokeWidth = 1;

    const spacing = 35.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final glowPaint = Paint()
      ..color = AppColors.primary.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 55);

    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.35),
      100,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
