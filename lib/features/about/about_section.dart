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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: isMobile ? 1.7 : 1.1,
            ),
            itemCount: aboutCards.length,
            itemBuilder: (context, index) {
              final card = aboutCards[index];
              return AnimatedReveal(
                delay: Duration(milliseconds: 90 * index),
                child: HoverLift(
                  child: GradientBorderCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(card.icon, color: AppColors.purple, size: 30),
                        const SizedBox(height: 20),
                        Text(
                          card.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            card.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
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
