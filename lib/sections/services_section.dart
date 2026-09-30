import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 70,
        vertical: mobile ? 80 : 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const _SectionIntro(),
          const SizedBox(height: 70),

          if (mobile)
            const Column(
              children: [
                _ServicePanel(
                  number: '01',
                  title: 'Web Development',
                  description: 'Modern, responsive websites designed to turn visitors into customers.',
                  icon: Icons.language_rounded,
                  visualType: _VisualType.web,
                ),
                SizedBox(height: 20),
                _ServicePanel(
                  number: '02',
                  title: 'Mobile Applications',
                  description: 'Flutter applications for Android, iOS and modern business workflows.',
                  icon: Icons.phone_android_rounded,
                  visualType: _VisualType.mobile,
                ),
                SizedBox(height: 20),
                _ServicePanel(
                  number: '03',
                  title: 'Custom Software',
                  description: 'Business software, dashboards and management systems built around your workflow.',
                  icon: Icons.dashboard_customize_rounded,
                  visualType: _VisualType.software,
                ),
                SizedBox(height: 20),
                _ServicePanel(
                  number: '04',
                  title: 'Cloud & Hosting',
                  description: 'Domain, hosting, SSL, deployment and reliable website infrastructure.',
                  icon: Icons.cloud_outlined,
                  visualType: _VisualType.cloud,
                ),
                SizedBox(height: 20),
                _ServicePanel(
                  number: '05',
                  title: 'Digital Growth',
                  description: 'SEO, Google Business, analytics and digital strategies to help businesses grow.',
                  icon: Icons.trending_up_rounded,
                  visualType: _VisualType.growth,
                ),
              ],
            )
          else
            const Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServicePanel(
                        number: '01',
                        title: 'Web Development',
                        description: 'Modern, responsive websites designed to turn visitors into customers.',
                        icon: Icons.language_rounded,
                        visualType: _VisualType.web,
                      ),
                    ),
                    SizedBox(width: 22),
                    Expanded(
                      child: _ServicePanel(
                        number: '02',
                        title: 'Mobile Applications',
                        description: 'Flutter applications for Android, iOS and modern business workflows.',
                        icon: Icons.phone_android_rounded,
                        visualType: _VisualType.mobile,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServicePanel(
                        number: '03',
                        title: 'Custom Software',
                        description: 'Business software, dashboards and management systems built around your workflow.',
                        icon: Icons.dashboard_customize_rounded,
                        visualType: _VisualType.software,
                      ),
                    ),
                    SizedBox(width: 22),
                    Expanded(
                      child: _ServicePanel(
                        number: '04',
                        title: 'Cloud & Hosting',
                        description: 'Domain, hosting, SSL, deployment and reliable website infrastructure.',
                        icon: Icons.cloud_outlined,
                        visualType: _VisualType.cloud,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                _ServicePanel(
                  number: '05',
                  title: 'Digital Growth',
                  description: 'SEO, Google Business, analytics and digital strategies to help businesses grow.',
                  icon: Icons.trending_up_rounded,
                  visualType: _VisualType.growth,
                  wide: true,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _SectionIntro extends StatelessWidget {
  const _SectionIntro();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

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
            'OUR DIGITAL SERVICES',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.primary,
            ),
          ),
        ),

        const SizedBox(height: 22),

        Text(
          'Digital solutions built\nfor businesses in Khammam.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: mobile ? 34 : 52,
            height: 1.08,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
          ),
        ),

        const SizedBox(height: 20),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: const Text(
            'We provide website development, mobile app development, '
            'custom software, cloud hosting and digital marketing '
            'services for businesses in Khammam, Telangana and across India.',
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

enum _VisualType { web, mobile, software, cloud, growth }

class _ServicePanel extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;
  final _VisualType visualType;
  final bool wide;

  const _ServicePanel({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.visualType,
    this.wide = false,
  });

  @override
  State<_ServicePanel> createState() => _ServicePanelState();
}

class _ServicePanelState extends State<_ServicePanel> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        height: widget.wide ? 360 : 390,
        decoration: BoxDecoration(
          color: hovered ? AppColors.surfaceLight : AppColors.surface,
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
                    blurRadius: 40,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: CustomPaint(painter: _PanelGridPainter(active: hovered)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.number,
                        style: TextStyle(
                          color: AppColors.primaryBright.withOpacity(.7),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: hovered
                              ? AppColors.primary.withOpacity(.15)
                              : AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Icon(
                          widget.icon,
                          color: AppColors.primaryBright,
                          size: 21,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  _ServiceVisual(type: widget.visualType, hovered: hovered),

                  const SizedBox(height: 28),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.6,
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

class _ServiceVisual extends StatelessWidget {
  final _VisualType type;
  final bool hovered;

  const _ServiceVisual({required this.type, required this.hovered});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _VisualType.web:
        return const _BrowserVisual();

      case _VisualType.mobile:
        return const _PhoneVisual();

      case _VisualType.software:
        return const _SoftwareVisual();

      case _VisualType.cloud:
        return const _CloudVisual();

      case _VisualType.growth:
        return const _GrowthVisual();
    }
  }
}

class _BrowserVisual extends StatelessWidget {
  const _BrowserVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: const Color(0xFF090D14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                _dot(),
                const SizedBox(width: 4),
                _dot(),
                const SizedBox(width: 4),
                _dot(),
                const Spacer(),
                Container(
                  width: 100,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                          width: 90,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          height: 7,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 7,
                          width: 110,
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 18,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(.18),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              width: 45,
                              height: 18,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceLight,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
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
      width: 5,
      height: 5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _PhoneVisual extends StatelessWidget {
  const _PhoneVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Center(
        child: Container(
          width: 72,
          height: 118,
          decoration: BoxDecoration(
            color: const Color(0xFF090D14),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(.12),
                blurRadius: 25,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Speaker
                Container(
                  width: 25,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                const SizedBox(height: 9),

                // App header
                Container(
                  height: 27,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.16),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.dashboard_rounded,
                    size: 15,
                    color: AppColors.primaryBright,
                  ),
                ),

                const SizedBox(height: 7),

                // Text lines
                _phoneLine(42),

                const SizedBox(height: 4),

                _phoneLine(32),

                const SizedBox(height: 7),

                // Small cards
                Row(
                  children: [
                    Expanded(child: _smallBox()),
                    const SizedBox(width: 5),
                    Expanded(child: _smallBox()),
                  ],
                ),

                const SizedBox(height: 7),

                // Bottom indicator
                Container(
                  height: 4,
                  width: 18,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneLine(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _smallBox() {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _SoftwareVisual extends StatelessWidget {
  const _SoftwareVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF090D14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.bar_chart_rounded,
                        size: 15,
                        color: AppColors.primaryBright,
                      ),
                      const SizedBox(width: 6),
                      Container(width: 45, height: 5, color: AppColors.border),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    child: CustomPaint(
                      painter: _MiniChartPainter(),
                      size: const Size(double.infinity, 45),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _dataBox('98%', Icons.speed_rounded),
              const SizedBox(height: 8),
              _dataBox('24K', Icons.people_alt_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dataBox(String text, IconData icon) {
    return Container(
      width: 75,
      height: 44,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: AppColors.primaryBright),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _CloudVisual extends StatelessWidget {
  const _CloudVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 210,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
              color: const Color(0xFF090D14),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _server(Icons.dns_outlined, 'SERVER'),
              const SizedBox(width: 20),
              const Icon(
                Icons.sync_alt_rounded,
                color: AppColors.primaryBright,
                size: 20,
              ),
              const SizedBox(width: 20),
              _server(Icons.cloud_outlined, 'CLOUD'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _server(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primaryBright, size: 27),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 8,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _GrowthVisual extends StatelessWidget {
  const _GrowthVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          Expanded(
            child: CustomPaint(
              painter: _GrowthChartPainter(),
              size: const Size(double.infinity, 125),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(.15),
                width: 8,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+28%',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'GROWTH',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 8,
                    letterSpacing: 1,
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

class _PanelGridPainter extends CustomPainter {
  final bool active;

  _PanelGridPainter({required this.active});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(active ? .45 : .20)
      ..strokeWidth = .5;

    const gap = 45.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PanelGridPainter oldDelegate) {
    return oldDelegate.active != active;
  }
}

class _MiniChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, size.height * .8);
    path.lineTo(size.width * .2, size.height * .6);
    path.lineTo(size.width * .35, size.height * .7);
    path.lineTo(size.width * .52, size.height * .35);
    path.lineTo(size.width * .68, size.height * .48);
    path.lineTo(size.width * .82, size.height * .20);
    path.lineTo(size.width, size.height * .28);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _GrowthChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, size.height * .78);
    path.lineTo(size.width * .14, size.height * .68);
    path.lineTo(size.width * .28, size.height * .72);
    path.lineTo(size.width * .42, size.height * .48);
    path.lineTo(size.width * .56, size.height * .55);
    path.lineTo(size.width * .70, size.height * .27);
    path.lineTo(size.width * .84, size.height * .36);
    path.lineTo(size.width, size.height * .10);

    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = AppColors.primaryBright;

    canvas.drawCircle(Offset(size.width, size.height * .10), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
