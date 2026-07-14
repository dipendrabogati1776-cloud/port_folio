import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/hover_lift.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'About',
            title:
                'Building fast, intuitive, and reliable mobile applications.',
            description:
                'Flutter & iOS developer with professional experience building cross-platform mobile applications. I enjoy transforming ideas into polished products with clean architecture, smooth user experiences, and maintainable code.',
          ),
          const SizedBox(height: 34),
          if (isMobile)
            Column(
              children: [
                for (var index = 0; index < aboutCards.length; index++) ...[
                  if (index > 0) const SizedBox(height: 18),
                  AnimatedReveal(
                    delay: Duration(milliseconds: 90 * index),
                    child: HoverLift(
                      child: GradientBorderCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(aboutCards[index].icon,
                                color: AppColors.purple, size: 30),
                            const SizedBox(height: 20),
                            Text(
                              aboutCards[index].title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              aboutCards[index].description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
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
                final colCount = 3;
                final colWidth =
                    (constraints.maxWidth - spacing * (colCount - 1)) /
                        colCount;
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (var index = 0; index < aboutCards.length; index++)
                      SizedBox(
                        width: colWidth,
                        child: AnimatedReveal(
                          delay: Duration(milliseconds: 90 * index),
                          child: HoverLift(
                            child: GradientBorderCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(aboutCards[index].icon,
                                      color: AppColors.purple, size: 30),
                                  const SizedBox(height: 20),
                                  Text(
                                    aboutCards[index].title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    aboutCards[index].description,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
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
