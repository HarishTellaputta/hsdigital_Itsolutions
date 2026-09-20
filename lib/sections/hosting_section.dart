import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class HostingSection extends StatelessWidget {
  const HostingSection({super.key});

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
              const _HostingHeading(),
              SizedBox(height: mobile ? 50 : 70),
              mobile
                  ? const _MobileHostingLayout()
                  : const _DesktopHostingLayout(),
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

class _HostingHeading extends StatelessWidget {
  const _HostingHeading();

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
              'LAUNCH & SUPPORT',
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
          'We don’t stop at development.\nWe help you stay online.',
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
          'From domain configuration and deployment to updates and ongoing '
          'maintenance, we can help keep your digital product running smoothly.',
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

class _DesktopHostingLayout extends StatelessWidget {
  const _DesktopHostingLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 5, child: _HostingDashboard()),
        const SizedBox(width: 35),
        Expanded(
          flex: 4,
          child: Column(
            children: const [
              _HostingServiceCard(
                icon: Icons.language_rounded,
                title: 'Domain & DNS',
                description: 'Domain setup, DNS configuration and connection to your website.',
              ),
              SizedBox(height: 12),
              _HostingServiceCard(
                icon: Icons.cloud_upload_rounded,
                title: 'Hosting & Deployment',
                description: 'Deploy websites and applications to suitable hosting environments.',
              ),
              SizedBox(height: 12),
              _HostingServiceCard(
                icon: Icons.lock_rounded,
                title: 'SSL & Security',
                description: 'HTTPS configuration and essential deployment-level security setup.',
              ),
              SizedBox(height: 12),
              _HostingServiceCard(
                icon: Icons.build_circle_rounded,
                title: 'Maintenance & Updates',
                description: 'Content updates, technical fixes and ongoing improvements when required.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// HOSTING DASHBOARD VISUAL
// ------------------------------------------------------------
class _HostingDashboard extends StatelessWidget {
  const _HostingDashboard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _HostingGridPainter())),

          Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =========================
                  // HEADER
                  // =========================
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(width: 9),

                      const Text(
                        'HS CLOUD',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16351F),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 7,
                              color: Color(0xFF55D878),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'ONLINE',
                              style: TextStyle(
                                color: Color(0xFF75E994),
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // =========================
                  // TITLE
                  // =========================
                  const Text(
                    'Website infrastructure',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Everything connected and ready for launch.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // =========================
                  // INFRASTRUCTURE
                  // =========================
                  const _InfrastructureRow(
                    icon: Icons.language_rounded,
                    title: 'Domain',
                    value: 'Connected',
                    active: true,
                  ),

                  const SizedBox(height: 10),

                  const _InfrastructureRow(
                    icon: Icons.dns_rounded,
                    title: 'Hosting',
                    value: 'Running',
                    active: true,
                  ),

                  const SizedBox(height: 10),

                  const _InfrastructureRow(
                    icon: Icons.lock_rounded,
                    title: 'SSL',
                    value: 'Protected',
                    active: true,
                  ),

                  const SizedBox(height: 10),

                  const _InfrastructureRow(
                    icon: Icons.rocket_launch_rounded,
                    title: 'Deployment',
                    value: 'Live',
                    active: true,
                  ),

                  // IMPORTANT:
                  // Spacer removed because this Column
                  // is inside SingleChildScrollView.
                  const SizedBox(height: 20),

                  // =========================
                  // STATS
                  // =========================
                  Row(
                    children: [
                      Expanded(
                        child: _MiniHostingStat(
                          title: 'UPTIME',
                          value: '24/7',
                          icon: Icons.access_time_rounded,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _MiniHostingStat(
                          title: 'SSL',
                          value: 'HTTPS',
                          icon: Icons.verified_user_rounded,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _MiniHostingStat(
                          title: 'SUPPORT',
                          value: 'ON',
                          icon: Icons.support_agent_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// INFRASTRUCTURE ROW
// ------------------------------------------------------------

class _InfrastructureRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool active;

  const _InfrastructureRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(.65),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 19, color: AppColors.primaryBright),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(
            active ? Icons.check_circle_rounded : Icons.circle_outlined,
            size: 15,
            color: active ? const Color(0xFF62DC83) : AppColors.textSecondary,
          ),
          const SizedBox(width: 7),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// MINI STAT
// ------------------------------------------------------------

class _MiniHostingStat extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MiniHostingStat({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primaryBright),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 8,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
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

// ------------------------------------------------------------
// SERVICE CARD
// ------------------------------------------------------------

class _HostingServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _HostingServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_HostingServiceCard> createState() => _HostingServiceCardState();
}

class _HostingServiceCardState extends State<_HostingServiceCard> {
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
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_rounded,
              size: 16,
              color: hovering
                  ? AppColors.primaryBright
                  : AppColors.textSecondary,
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

class _MobileHostingLayout extends StatelessWidget {
  const _MobileHostingLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _MobileInfrastructureCard(),
        SizedBox(height: 20),
        _HostingServiceCard(
          icon: Icons.language_rounded,
          title: 'Domain & DNS',
          description:
              'Domain setup, DNS configuration and website connection.',
        ),
        SizedBox(height: 12),
        _HostingServiceCard(
          icon: Icons.cloud_upload_rounded,
          title: 'Hosting & Deployment',
          description: 'Deploy websites and applications to suitable hosting environments.',
        ),
        SizedBox(height: 12),
        _HostingServiceCard(
          icon: Icons.lock_rounded,
          title: 'SSL & Security',
          description: 'HTTPS configuration and essential deployment-level security setup.',
        ),
        SizedBox(height: 12),
        _HostingServiceCard(
          icon: Icons.build_circle_rounded,
          title: 'Maintenance & Updates',
          description: 'Content updates, technical fixes and ongoing improvements when required.',
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// MOBILE INFRASTRUCTURE
// ------------------------------------------------------------

class _MobileInfrastructureCard extends StatelessWidget {
  const _MobileInfrastructureCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(
                Icons.cloud_done_rounded,
                color: AppColors.primaryBright,
                size: 24,
              ),
              SizedBox(width: 12),
              Text(
                'Infrastructure',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          _InfrastructureRow(
            icon: Icons.language_rounded,
            title: 'Domain',
            value: 'Connected',
            active: true,
          ),
          SizedBox(height: 10),
          _InfrastructureRow(
            icon: Icons.dns_rounded,
            title: 'Hosting',
            value: 'Running',
            active: true,
          ),
          SizedBox(height: 10),
          _InfrastructureRow(
            icon: Icons.lock_rounded,
            title: 'SSL',
            value: 'Protected',
            active: true,
          ),
          SizedBox(height: 10),
          _InfrastructureRow(
            icon: Icons.rocket_launch_rounded,
            title: 'Deployment',
            value: 'Live',
            active: true,
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// GRID
// ------------------------------------------------------------

class _HostingGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.32)
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
