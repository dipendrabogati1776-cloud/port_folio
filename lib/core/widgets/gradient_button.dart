import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.outlined = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 10),
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: outlined ? null : AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        border: outlined
            ? Border.all(color: AppColors.purple.withValues(alpha: 0.45))
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: outlined ? AppColors.textPrimary : AppColors.background,
                fontWeight: FontWeight.w800,
              ),
              child: IconTheme(
                data: IconThemeData(
                  color: outlined ? AppColors.purple : AppColors.background,
                ),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
