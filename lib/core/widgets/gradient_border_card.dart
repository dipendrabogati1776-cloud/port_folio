import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class GradientBorderCard extends StatelessWidget {
  const GradientBorderCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(18),
    this.margin,
    this.radius = 22,
    this.borderWidth = 1,
    this.gradient = AppColors.primaryGradient,
    this.innerColor = AppColors.surface,
    this.isHighlighted = false,
    this.width,
    this.height,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final double borderWidth;
  final Gradient gradient;
  final Color innerColor;
  final bool isHighlighted;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          if (isHighlighted)
            BoxShadow(
              color: AppColors.purple.withValues(alpha: 0.24),
              blurRadius: 26,
              spreadRadius: -8,
            ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth),
        padding: padding,
        decoration: BoxDecoration(
          color: innerColor.withValues(alpha: isHighlighted ? 0.96 : 0.92),
          borderRadius: BorderRadius.circular(radius - borderWidth),
        ),
        child: child,
      ),
    );

    if (onTap == null) {
      return card;
    }

    return _Pressable(onTap: onTap!, child: card);
  }
}

class _Pressable extends StatefulWidget {
  const _Pressable({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.985 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
