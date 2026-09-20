import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';

class ServiceCard extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.surfaceLight
                : AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withOpacity(0.55)
                  : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.08),
                      blurRadius: 30,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.18),
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      color: AppColors.primaryBright,
                      size: 21,
                    ),
                  ),
                  Text(
                    widget.number,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text(
                widget.title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 22),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _hovered ? 1 : 0.65,
                child: Row(
                  children: [
                    const Text(
                      'Explore',
                      style: TextStyle(
                        color: AppColors.primaryBright,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 7),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(
                        left: _hovered ? 4 : 0,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: AppColors.primaryBright,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}