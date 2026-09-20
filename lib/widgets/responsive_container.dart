import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double maxWidth;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.maxWidth = 1200,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final horizontalPadding = width < 600
        ? 20.0
        : width < 1000
            ? 32.0
            : 48.0;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
          child: child,
        ),
      ),
    );
  }
}