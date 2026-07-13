import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Contact',
            title: "Let's build something great together.",
            description:
                "Have a project in mind or just want to say hello? Reach out through any of the channels below — I'm always happy to connect.",
          ),
          const SizedBox(height: 34),
          isMobile
              ? const _ContactMethods(crossAxisCount: 1)
              : const _ContactMethods(crossAxisCount: 2),
        ],
      ),
    );
  }
}

class _ContactMethods extends StatelessWidget {
  const _ContactMethods({required this.crossAxisCount});

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 16.0;
        final cardWidth = crossAxisCount == 1
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final method in contactMethods)
              SizedBox(
                width: cardWidth,
                child: _ContactCard(method: method),
              ),
          ],
        );
      },
    );
  }
}

class _ContactCard extends StatefulWidget {
  const _ContactCard({required this.method});

  final dynamic method;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _copied = false;

  Future<void> _launch() async {
    final url = widget.method.url as String?;
    if (url == null) return;
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.method.value as String));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final method = widget.method;
    final hasUrl = method.url != null;

    return GradientBorderCard(
      onTap: hasUrl ? _launch : null,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              method.icon as IconData,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.label as String,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  method.value as String,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: hasUrl ? AppColors.blue : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Copy button
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _copied
                ? const Icon(
                    Icons.check_circle_rounded,
                    key: ValueKey('check'),
                    size: 20,
                    color: AppColors.success,
                  )
                : IconButton(
                    key: const ValueKey('copy'),
                    tooltip: 'Copy',
                    onPressed: _copy,
                    icon: const Icon(
                      Icons.copy_rounded,
                      size: 18,
                      color: AppColors.textMuted,
                    ),
                  ),
          ),
          if (hasUrl)
            const Icon(
              Icons.open_in_new_rounded,
              size: 14,
              color: AppColors.textMuted,
            ),
        ],
      ),
    );
  }
}
