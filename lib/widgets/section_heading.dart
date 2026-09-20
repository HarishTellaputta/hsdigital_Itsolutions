import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';

class SectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? description;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    this.description,
    this.textAlign = TextAlign.left,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          eyebrow,
          textAlign: textAlign,
          style: const TextStyle(
            color: AppColors.primaryBright,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 760,
          ),
          child: Text(
            title,
            textAlign: textAlign,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.2,
            ),
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),
            child: Text(
              description!,
              textAlign: textAlign,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                height: 1.7,
              ),
            ),
          ),
        ],
      ],
    );
  }
}