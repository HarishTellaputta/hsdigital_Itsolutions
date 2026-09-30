import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class NavbarSection extends StatelessWidget {
  const NavbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 60, vertical: 18),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          const _Logo(),

          const Spacer(),

          if (!mobile) ...[
            _NavItem(
              title: 'Home',
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            _NavItem(
              title: 'Services',
              onTap: () {
                Navigator.pushNamed(context, '/website-development-khammam');
              },
            ),
            _NavItem(
              title: 'Work',
              onTap: () {
                Navigator.pushNamed(context, '/portfolio');
              },
            ),
            _NavItem(
              title: 'About',
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            _NavItem(
              title: 'Contact',
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),

            const SizedBox(width: 18),

            // Let's Talk button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Let's Talk →",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],

          if (mobile)
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(
                Icons.menu_rounded,
                color: AppColors.textPrimary,
                size: 23,
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // =========================
        // LOGO IMAGE
        // =========================
        Image.asset(
          'assets/images/hs_logo.png',
          width: 42,
          height: 42,
          fit: BoxFit.contain,
        ),

        const SizedBox(width: 12),

        // =========================
        // BRAND NAME + CAPTION
        // =========================
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HS DIGITAL IT SOLUTIONS',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              'Build. Launch. Grow.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 9.5,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() => _hovered = true);
        },
        onExit: (_) {
          setState(() => _hovered = false);
        },
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _hovered ? AppColors.primary : AppColors.textSecondary,
              fontSize: 14,
              fontWeight: _hovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
