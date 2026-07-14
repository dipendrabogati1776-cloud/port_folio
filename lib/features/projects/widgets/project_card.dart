import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/gradient_border_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/hover_lift.dart';
import '../models/project_item.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project, this.featured = false});

  final ProjectItem project;
  final bool featured;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return HoverLift(
      child: GradientBorderCard(
        padding: const EdgeInsets.all(0),
        isHighlighted: widget.featured,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ScreenshotCarousel(
                screenshots: project.screenshots,
                icon: project.icon,
              ),
              Padding(
                padding: EdgeInsets.all(widget.featured ? 26 : 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.purple.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(project.icon, color: AppColors.purple),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            project.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        if (project.isFeatured) ...[
                          const SizedBox(width: 12),
                          const _FeaturedBadge(),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _MetaChip(
                          icon: Icons.devices_rounded,
                          label: project.platform,
                        ),
                        _MetaChip(
                          icon: Icons.badge_outlined,
                          label: project.role,
                        ),
                        if (project.contributionLabel != null)
                          _MetaChip(
                            icon: Icons.verified_rounded,
                            label: project.contributionLabel!,
                          ),
                        if (project.ownershipLabel != null)
                          _MetaChip(
                            icon: Icons.workspace_premium_rounded,
                            label: project.ownershipLabel!,
                          ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      project.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (project.downloads != null ||
                        project.reviews != null ||
                        project.ratings != null) ...[
                      const SizedBox(height: 14),
                      _StatsRow(project: project),
                    ],
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final tech in project.technologies)
                          Chip(
                            label: Text(tech),
                            backgroundColor: AppColors.surfaceHigh,
                            side: const BorderSide(color: Color(0xFF2A2A38)),
                          ),
                      ],
                    ),
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: _ProjectDetails(project: project),
                      ),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 220),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        GradientButton(
                          label: _expanded ? 'Show Less' : 'Read More',
                          icon: _expanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          onPressed: () =>
                              setState(() => _expanded = !_expanded),
                          outlined: true,
                        ),
                        if (project.appStoreUrl != null)
                          IconButton.filledTonal(
                            tooltip: 'App Store',
                            onPressed: () => _openUrl(project.appStoreUrl!),
                            icon: const Icon(Icons.apple_rounded),
                          ),
                        if (project.googlePlayUrl != null)
                          IconButton.filledTonal(
                            tooltip: 'Google Play',
                            onPressed: () => _openUrl(project.googlePlayUrl!),
                            icon: const Icon(Icons.shop_rounded),
                          ),
                        if (project.websiteUrl != null)
                          IconButton.filledTonal(
                            tooltip: 'Website',
                            onPressed: () => _openUrl(project.websiteUrl!),
                            icon: const Icon(Icons.language_rounded),
                          ),
                        if (project.githubUrl != null)
                          IconButton.filledTonal(
                            tooltip: 'GitHub',
                            onPressed: () => _openUrl(project.githubUrl!),
                            icon: const Icon(Icons.code_rounded),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _FeaturedBadge extends StatelessWidget {
  const _FeaturedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.purple.withValues(alpha: 0.2),
            AppColors.blue.withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.purple.withValues(alpha: 0.4)),
      ),
      child: ShaderMask(
        shaderCallback: (bounds) =>
            AppColors.primaryGradient.createShader(bounds),
        child: Text(
          'Featured',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
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

class _ScreenshotCarousel extends StatefulWidget {
  const _ScreenshotCarousel({required this.screenshots, required this.icon});

  final List<String> screenshots;
  final IconData icon;

  @override
  State<_ScreenshotCarousel> createState() => _ScreenshotCarouselState();
}

class _ScreenshotCarouselState extends State<_ScreenshotCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shots = widget.screenshots;

    if (shots.isEmpty) {
      return _ScreenshotCarouselPlaceholder(icon: widget.icon);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final carouselHeight = constraints.maxWidth < 400 ? 200.0 : 280.0;
        return SizedBox(
          height: carouselHeight,
          child: Stack(
            children: [
              // Dark gradient background
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.surface, AppColors.surfaceHigh],
                    ),
                  ),
                ),
              ),
              PageView.builder(
                controller: _pageController,
                itemCount: shots.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        shots[i],
                        fit: BoxFit.contain,
                        errorBuilder: (_, e, s) =>
                            _ScreenshotCarouselPlaceholder(icon: widget.icon),
                      ),
                    ),
                  );
                },
              ),
              // Dot indicators
              if (shots.length > 1)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < shots.length; i++) ...[
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          width: i == _currentPage ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: i == _currentPage
                                ? AppColors.purple
                                : AppColors.textMuted.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        if (i < shots.length - 1) const SizedBox(width: 5),
                      ],
                    ],
                  ),
                ),
              // Left/right tap zones
              if (shots.length > 1) ...[
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 60,
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: 60,
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage < shots.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ScreenshotCarouselPlaceholder extends StatelessWidget {
  const _ScreenshotCarouselPlaceholder({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxWidth < 400 ? 200.0 : 280.0;
        return SizedBox(
          height: h,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.surface, AppColors.surfaceHigh],
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Icon(
                      icon,
                      size: 74,
                      color: AppColors.purple.withValues(alpha: 0.35),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 14,
                  child: Row(
                    children: [
                      for (var i = 0; i < 3; i++)
                        Expanded(
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(right: i == 2 ? 0 : 6),
                            decoration: BoxDecoration(
                              gradient:
                                  i == 0 ? AppColors.primaryGradient : null,
                              color: i == 0
                                  ? null
                                  : AppColors.textMuted.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        if (project.downloads != null)
          _StatChip(
            icon: Icons.download_rounded,
            label: project.downloads!,
            sublabel: 'Downloads',
            iconColor: AppColors.blue,
          ),
        if (project.reviews != null)
          _StatChip(
            icon: Icons.rate_review_rounded,
            label: project.reviews!,
            sublabel: 'Reviews',
            iconColor: AppColors.purple,
          ),
        if (project.ratings != null)
          _StatChip(
            icon: Icons.star_rounded,
            label: project.ratings!,
            sublabel: 'Rating',
            iconColor: const Color(0xFFFBBC04),
          ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String sublabel;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2A38)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              Text(
                sublabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailList(title: 'My Role', values: project.responsibilities),
        const SizedBox(height: 14),
        _DetailList(title: 'Features', values: project.features),
      ],
    );
  }
}

class _DetailList extends StatelessWidget {
  const _DetailList({required this.title, required this.values});

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final value in values)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 15,
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
