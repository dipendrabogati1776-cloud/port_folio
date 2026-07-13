import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/hover_lift.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Skills',
            title: 'Technologies I use to build modern mobile applications.',
            description:
                'A strong foundation in Flutter, Dart, Firebase, REST APIs, state management, and native iOS development, with a focus on building scalable, maintainable, and production-ready mobile applications.',
          ),
          const SizedBox(height: 34),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: isMobile ? 1.7 : 1.35,
            ),
            itemCount: skillCategories.length,
            itemBuilder: (context, index) {
              final category = skillCategories[index];
              return AnimatedReveal(
                delay: Duration(milliseconds: 65 * index),
                child: HoverLift(
                  child: GradientBorderCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(category.icon, color: AppColors.purple),
                            const SizedBox(width: 12),
                            Text(
                              category.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final skill in category.skills)
                              Chip(
                                label: Text(skill),
                                backgroundColor: AppColors.surfaceHigh,
                                side: const BorderSide(
                                  color: Color(0xFF2A2A38),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
