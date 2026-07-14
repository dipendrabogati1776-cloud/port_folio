import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/models/portfolio_models.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/hover_lift.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Education',
            title: 'Academic background supporting practical mobile work.',
            description:
                'Placeholder academic details are included for now so the section is ready. Replace them with your real institution, degree, dates, score, coursework, or certifications.',
          ),
          const SizedBox(height: 34),
          if (isMobile)
            Column(
              children: [
                for (var index = 0; index < educationItems.length; index++) ...[
                  if (index > 0) const SizedBox(height: 18),
                  AnimatedReveal(
                    delay: Duration(milliseconds: 90 * index),
                    child: HoverLift(
                      child: GradientBorderCard(
                        child: _EducationCardContent(item: educationItems[index]),
                      ),
                    ),
                  ),
                ],
              ],
            )
          else
            LayoutBuilder(
              builder: (context, constraints) {
                const spacing = 18.0;
                final colWidth = (constraints.maxWidth - spacing) / 2;
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (var index = 0; index < educationItems.length; index++)
                      SizedBox(
                        width: colWidth,
                        child: AnimatedReveal(
                          delay: Duration(milliseconds: 90 * index),
                          child: HoverLift(
                            child: GradientBorderCard(
                              child: _EducationCardContent(item: educationItems[index]),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFF2A2A38)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.blue),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationCardContent extends StatelessWidget {
  const _EducationCardContent({required this.item});

  final EducationItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.blue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.school_rounded, color: AppColors.blue),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.degree,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.institution,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _MetaChip(
              icon: Icons.calendar_month_rounded,
              label: item.duration,
            ),
            _MetaChip(
              icon: Icons.location_on_outlined,
              label: item.location,
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          item.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (item.highlights.isNotEmpty) ...[
          const SizedBox(height: 14),
          for (final highlight in item.highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.success,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      highlight,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
