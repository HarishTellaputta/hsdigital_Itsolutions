import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';

class AnimatedGlow extends StatefulWidget {
  const AnimatedGlow({super.key});

  @override
  State<AnimatedGlow> createState() => _AnimatedGlowState();
}

class _AnimatedGlowState extends State<AnimatedGlow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value * math.pi * 2;

        return Stack(
          children: [
            Positioned(
              top: 60 + math.sin(value) * 35,
              right: 50 + math.cos(value) * 30,
              child: _glow(
                AppColors.primary,
                190,
              ),
            ),
            Positioned(
              bottom: 50 + math.cos(value) * 30,
              left: 30 + math.sin(value) * 25,
              child: _glow(
                const Color(0xFF8B5CF6),
                160,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _glow(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 100,
            spreadRadius: 30,
          ),
        ],
      ),
    );
  }
}