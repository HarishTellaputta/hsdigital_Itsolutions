import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class NavbarSection extends StatelessWidget {
  const NavbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 60,
        vertical: 18,
      ),
      child: Row(
        children: [
          const _Logo(),

          const Spacer(),

          if (!mobile) ...[
            _NavItem(
              title: 'Home',
              onTap: () {},
            ),
            _NavItem(
              title: 'Services',
              onTap: () {},
            ),
            _NavItem(
              title: 'Work',
              onTap: () {},
            ),
            _NavItem(
              title: 'About',
              onTap: () {},
            ),
            _NavItem(
              title: 'Contact',
              onTap: () {},
            ),

            const SizedBox(width: 24),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Let's Talk →",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],

          if (mobile)
            const Icon(
              Icons.menu_rounded,
              color: AppColors.white,
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
                color: AppColors.white,
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

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}