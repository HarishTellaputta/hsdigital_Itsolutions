import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool outlined;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.outlined = false,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = _hovered
        ? AppColors.primary
        : AppColors.border;

    if (widget.outlined) {
      return MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withOpacity(0.08)
                : Colors.transparent,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: _content(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.primaryBright
              : AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 24,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: _content(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content({required Color color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        if (widget.icon != null) ...[
          const SizedBox(width: 8),
          Icon(
            widget.icon,
            size: 17,
            color: color,
          ),
        ],
      ],
    );
  }
}