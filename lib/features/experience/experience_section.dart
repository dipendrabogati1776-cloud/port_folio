import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Experience',
            title:
                'Developing native iOS and cross-platform Flutter applications.',
            description:
                'Professional experience as an iOS Developer, building and maintaining Flutter applications for Android and iOS, integrating APIs, optimizing performance, and delivering production-ready mobile solutions.',
          ),
          const SizedBox(height: 36),
          Column(
            children: [
              for (var index = 0; index < experienceItems.length; index++)
                AnimatedReveal(
                  delay: Duration(milliseconds: 110 * index),
                  child: _TimelineItem(
                    index: index,
                    isLast: index == experienceItems.length - 1,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.index, required this.isLast});

  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final item = experienceItems[index];

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple.withValues(alpha: 0.45),
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.purple.withValues(alpha: 0.4),
                          AppColors.blue.withValues(alpha: 0.15),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 22),
              child: GradientBorderCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          item.role,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Chip(
                          label: Text(item.duration),
                          backgroundColor: AppColors.purple.withValues(
                            alpha: 0.1,
                          ),
                          side: BorderSide(
                            color: AppColors.purple.withValues(alpha: 0.24),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.primaryGradient.createShader(bounds),
                      child: Text(
                        item.company,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
