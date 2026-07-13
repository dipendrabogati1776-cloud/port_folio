import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/resume_downloader.dart';
import '../../core/widgets/gradient_border_card.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/section_container.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: GradientBorderCard(
        isHighlighted: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 24,
              runSpacing: 18,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 680),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resume',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Download a focused Flutter and iOS developer resume built from the current portfolio projects, experience, skills, contact details, and academic section.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                GradientButton(
                  label: 'Download Resume',
                  icon: Icons.download_rounded,
                  onPressed: () => _download(context),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _ResumePill(
                  icon: Icons.phone_iphone_rounded,
                  label: 'Flutter + iOS',
                ),
                _ResumePill(
                  icon: Icons.work_outline_rounded,
                  label: '2+ years experience',
                ),
                _ResumePill(icon: Icons.apps_rounded, label: 'Production apps'),
                _ResumePill(
                  icon: Icons.school_rounded,
                  label: 'Education included',
                ),
              ],
            ),
            const SizedBox(height: 26),
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 760;

                return Flex(
                  direction: isCompact ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: isCompact ? FlexFit.loose : FlexFit.tight,
                      child: _ResumePreviewColumn(
                        title: 'Included',
                        items: const [
                          'Professional summary',
                          'Technical skills',
                          'GTS Infosoft LLP experience',
                          'Featured Flutter and iOS projects',
                        ],
                      ),
                    ),
                    SizedBox(
                      width: isCompact ? 0 : 18,
                      height: isCompact ? 18 : 0,
                    ),
                    Flexible(
                      fit: isCompact ? FlexFit.loose : FlexFit.tight,
                      child: _ResumePreviewColumn(
                        title: 'Academic',
                        items: [
                          for (final item in educationItems)
                            '${item.degree} · ${item.institution}',
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _download(BuildContext context) async {
    try {
      await downloadResume(
        assetPath: resumeAssetPath,
        fileName: resumeFileName,
      );
    } on UnsupportedError catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Download is unavailable.')),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resume could not be downloaded.')),
      );
    }
  }
}

class _ResumePill extends StatelessWidget {
  const _ResumePill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.purple.withValues(alpha: 0.24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.blue, size: 17),
          const SizedBox(width: 7),
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

class _ResumePreviewColumn extends StatelessWidget {
  const _ResumePreviewColumn({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh.withValues(alpha: 0.68),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF2A2A38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
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
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
