import 'package:flutter/material.dart';

import 'gradient_border_card.dart';

/// A convenience wrapper that renders a [GradientBorderCard] with sensible
/// defaults, replacing the old opaque-border card everywhere in the app.
class PremiumCard extends StatelessWidget {
  const PremiumCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.onTap,
    this.isHighlighted = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return GradientBorderCard(
      padding: padding,
      onTap: onTap,
      isHighlighted: isHighlighted,
      child: child,
    );
  }
}
