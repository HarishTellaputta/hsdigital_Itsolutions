import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

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
          const _PortfolioHeading(),
          SizedBox(height: mobile ? 50 : 70),

          if (mobile)
            const Column(
              children: [
                _ProjectCard(
                  number: '01',
                  title: 'SmartKids',
                  category: 'School Management Platform',
                  description: 'A digital platform designed to simplify school administration, student management and communication.',
                  type: _ProjectType.school,
                  technologies: 'Flutter • Spring Boot • MySQL',
                ),
                SizedBox(height: 22),
                _ProjectCard(
                  number: '02',
                  title: 'Business Websites',
                  category: 'Web Design & Development',
                  description: 'Modern responsive websites designed to create a professional online presence for businesses.',
                  type: _ProjectType.website,
                  technologies: 'Flutter Web • Responsive UI',
                ),
                SizedBox(height: 22),
                _ProjectCard(
                  number: '03',
                  title: 'Business Applications',
                  category: 'Custom Software',
                  description: 'Custom dashboards and business applications built around specific workflows and requirements.',
                  type: _ProjectType.software,
                  technologies: 'Flutter • REST APIs • Backend',
                ),
              ],
            )
          else
            const Column(
              children: [
                _ProjectCard(
                  number: '01',
                  title: 'SmartKids',
                  category: 'School Management Platform',
                  description: 'A digital platform designed to simplify school administration, student management and communication.',
                  type: _ProjectType.school,
                  technologies: 'Flutter • Spring Boot • MySQL',
                  featured: true,
                ),
                SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ProjectCard(
                        number: '02',
                        title: 'Business Websites',
                        category: 'Web Design & Development',
                        description: 'Modern responsive websites designed to create a professional online presence for businesses.',
                        type: _ProjectType.website,
                        technologies: 'Flutter Web • Responsive UI',
                      ),
                    ),
                    SizedBox(width: 22),
                    Expanded(
                      child: _ProjectCard(
                        number: '03',
                        title: 'Business Applications',
                        category: 'Custom Software',
                        description: 'Custom dashboards and business applications built around specific workflows and requirements.',
                        type: _ProjectType.software,
                        technologies: 'Flutter • REST APIs • Backend',
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _PortfolioHeading extends StatelessWidget {
  const _PortfolioHeading();

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
            'SELECTED WORK',
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
          'Ideas turned into\ndigital products.',
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
            'A look at the kinds of digital products and solutions we build for businesses and organizations.',
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

enum _ProjectType { school, website, software }

class _ProjectCard extends StatefulWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final _ProjectType type;
  final String technologies;
  final bool featured;

  const _ProjectCard({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.type,
    required this.technologies,
    this.featured = false,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: hovered
                ? AppColors.primary.withOpacity(.42)
                : AppColors.border,
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.07),
                    blurRadius: 40,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.featured ? 28 : 24),
          child: widget.featured && !mobile
              ? Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: _ProjectVisual(
                        type: widget.type,
                        hovered: hovered,
                      ),
                    ),
                    const SizedBox(width: 45),
                    Expanded(
                      flex: 4,
                      child: _ProjectInfo(
                        number: widget.number,
                        title: widget.title,
                        category: widget.category,
                        description: widget.description,
                        technologies: widget.technologies,
                        hovered: hovered,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProjectVisual(type: widget.type, hovered: hovered),
                    const SizedBox(height: 25),
                    _ProjectInfo(
                      number: widget.number,
                      title: widget.title,
                      category: widget.category,
                      description: widget.description,
                      technologies: widget.technologies,
                      hovered: hovered,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final String technologies;
  final bool hovered;

  const _ProjectInfo({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              number,
              style: const TextStyle(
                color: AppColors.primaryBright,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 12),
            Container(height: 1, width: 35, color: AppColors.border),
          ],
        ),

        const SizedBox(height: 15),

        Text(
          category.toUpperCase(),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 27,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          description,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.65,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 7,
          runSpacing: 7,
          children: technologies
              .split(' • ')
              .map(
                (tech) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    tech,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 9,
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 22),

        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: hovered
                ? AppColors.primary.withOpacity(.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VIEW PROJECT',
                style: TextStyle(
                  color: hovered
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedPadding(
                duration: const Duration(milliseconds: 220),
                padding: EdgeInsets.only(left: hovered ? 5 : 0),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 15,
                  color: hovered
                      ? AppColors.primaryBright
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  final _ProjectType type;
  final bool hovered;

  const _ProjectVisual({required this.type, required this.hovered});

  @override
  Widget build(BuildContext context) {
    final height = Responsive.isMobile(context)
        ? 210.0
        : type == _ProjectType.school
        ? 330.0
        : 270.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF090D14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: hovered
              ? AppColors.primary.withOpacity(.25)
              : AppColors.border,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _ProjectGridPainter())),
            Center(
              child: _VisualContent(type: type, hovered: hovered),
            ),
          ],
        ),
      ),
    );
  }
}

class _VisualContent extends StatelessWidget {
  final _ProjectType type;
  final bool hovered;

  const _VisualContent({required this.type, required this.hovered});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _ProjectType.school:
        return const _SchoolDashboard();

      case _ProjectType.website:
        return const _WebsiteMockup();

      case _ProjectType.software:
        return const _SoftwareDashboard();
    }
  }
}

class _SchoolDashboard extends StatelessWidget {
  const _SchoolDashboard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 560,
      constraints: const BoxConstraints(maxWidth: 85 / 100 * 1000),
      height: 245,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 18),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.14),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 18,
                    color: AppColors.primaryBright,
                  ),
                ),
                const SizedBox(height: 25),
                _sideIcon(Icons.dashboard_rounded),
                _sideIcon(Icons.people_alt_outlined),
                _sideIcon(Icons.calendar_month_outlined),
                _sideIcon(Icons.menu_book_outlined),
                _sideIcon(Icons.settings_outlined),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'School Dashboard',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Row(
                    children: [
                      Expanded(
                        child: _DashMetric(value: '1,240', label: 'Students'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _DashMetric(value: '84', label: 'Teachers'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _DashMetric(value: '42', label: 'Classes'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: CustomPaint(
                              painter: _DashboardChartPainter(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.analytics_outlined,
                                color: AppColors.primaryBright,
                                size: 28,
                              ),
                            ),
                          ),
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

  Widget _sideIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Icon(icon, size: 16, color: AppColors.textSecondary),
    );
  }
}

class _DashMetric extends StatelessWidget {
  final String value;
  final String label;

  const _DashMetric({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 8),
          ),
        ],
      ),
    );
  }
}

class _WebsiteMockup extends StatelessWidget {
  const _WebsiteMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(.08), blurRadius: 35),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                _dot(),
                const SizedBox(width: 5),
                _dot(),
                const SizedBox(width: 5),
                _dot(),
                const Spacer(),
                Container(
                  width: 100,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const Spacer(),
                      _navLine(),
                      _navLine(),
                      _navLine(),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130,
                              height: 14,
                              color: AppColors.textPrimary.withOpacity(.85),
                            ),
                            const SizedBox(height: 9),
                            Container(
                              width: 170,
                              height: 6,
                              color: AppColors.border,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 130,
                              height: 6,
                              color: AppColors.border,
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: 60,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 105,
                        height: 90,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.10),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.language_rounded,
                          size: 34,
                          color: AppColors.primaryBright,
                        ),
                      ),
                    ],
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

  Widget _navLine() {
    return Container(
      width: 25,
      height: 5,
      margin: const EdgeInsets.only(left: 8),
      color: AppColors.border,
    );
  }
}

class _SoftwareDashboard extends StatelessWidget {
  const _SoftwareDashboard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.dashboard_customize_rounded,
                size: 17,
                color: AppColors.primaryBright,
              ),
              const SizedBox(width: 8),
              Container(width: 100, height: 7, color: AppColors.border),
              const Spacer(),
              Container(
                width: 45,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.13),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _box(80),
                      const SizedBox(height: 8),
                      _box(55),
                      const SizedBox(height: 8),
                      _box(70),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomPaint(painter: _DashboardChartPainter()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: 25,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: AppColors.border),
        ),
      ),
    );
  }
}

class _ProjectGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(.25)
      ..strokeWidth = .5;

    const gap = 35.0;

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

class _DashboardChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, size.height * .78);
    path.lineTo(size.width * .15, size.height * .62);
    path.lineTo(size.width * .28, size.height * .68);
    path.lineTo(size.width * .42, size.height * .40);
    path.lineTo(size.width * .57, size.height * .48);
    path.lineTo(size.width * .72, size.height * .22);
    path.lineTo(size.width * .86, size.height * .32);
    path.lineTo(size.width, size.height * .10);

    canvas.drawPath(path, paint);

    final dot = Paint()..color = AppColors.primaryBright;

    canvas.drawCircle(Offset(size.width, size.height * .10), 3.5, dot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
