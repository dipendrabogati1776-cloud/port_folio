import 'package:flutter/material.dart';

import '../../features/about/about_section.dart';
import '../../features/contact/contact_section.dart';
import '../../features/education/education_section.dart';
import '../../features/experience/experience_section.dart';
import '../../features/home/home_section.dart';
import '../../features/projects/projects_section.dart';
import '../../features/resume/resume_section.dart';
import '../../features/skills/skills_section.dart';
import '../constants/section_ids.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import 'responsive_layout.dart';

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    for (final id in PortfolioSectionId.values) id: GlobalKey(),
  };

  Future<void> _scrollTo(PortfolioSectionId id) async {
    final context = _sectionKeys[id]?.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 720),
      curve: Curves.easeInOutCubic,
      alignment: 0.03,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final useDrawerNavigation = !ResponsiveLayout.isDesktop(context);

    return Scaffold(
      endDrawer: useDrawerNavigation
          ? _MobileDrawer(
              onNavigate: (id) {
                Navigator.of(context).pop();
                _scrollTo(id);
              },
            )
          : null,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.home],
                      child: HomeSection(
                        onViewProjects: () =>
                            _scrollTo(PortfolioSectionId.projects),
                        onDownloadResume: () =>
                            _scrollTo(PortfolioSectionId.resume),
                      ),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.education],
                      child: const EducationSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.experience],
                      child: const ExperienceSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.about],
                      child: const AboutSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.skills],
                      child: const SkillsSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.projects],
                      child: const ProjectsSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.resume],
                      child: const ResumeSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[PortfolioSectionId.contact],
                      child: const ContactSection(),
                    ),
                    _Footer(
                      onBackToTop: () => _scrollTo(PortfolioSectionId.home),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _TopNavigation(isMobile: useDrawerNavigation, onNavigate: _scrollTo),
        ],
      ),
    );
  }
}

class _TopNavigation extends StatelessWidget {
  const _TopNavigation({required this.isMobile, required this.onNavigate});

  final bool isMobile;
  final ValueChanged<PortfolioSectionId> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: AppColors.background.withValues(alpha: 0.88),
          border: Border(
            bottom: BorderSide(color: AppColors.purple.withValues(alpha: 0.18)),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    const _Logo(),
                    const SizedBox(width: 24),
                    if (isMobile) const Spacer(),
                    if (isMobile)
                      Builder(
                        builder: (context) => IconButton(
                          tooltip: 'Menu',
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          icon: const Icon(Icons.menu_rounded),
                        ),
                      )
                    else
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 6,
                              children: [
                                for (final item in navItems)
                                  TextButton(
                                    onPressed: () => onNavigate(item.sectionId),
                                    child: Text(item.label),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'DB',
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text('Dipendra Bogati', style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.onNavigate});

  final ValueChanged<PortfolioSectionId> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Padding(padding: EdgeInsets.all(12), child: _Logo()),
            const SizedBox(height: 18),
            for (final item in navItems)
              ListTile(
                title: Text(item.label),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                onTap: () => onNavigate(item.sectionId),
              ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.onBackToTop});

  final VoidCallback onBackToTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 34),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.purple.withValues(alpha: 0.18)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Wrap(
            spacing: 18,
            runSpacing: 14,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '© 2026 Portfolio. All rights reserved.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Wrap(
                spacing: 8,
                children: [
                  IconButton(
                    tooltip: 'LinkedIn',
                    onPressed: () {},
                    icon: const Icon(Icons.work_outline_rounded),
                  ),
                  IconButton(
                    tooltip: 'GitHub',
                    onPressed: () {},
                    icon: const Icon(Icons.code_rounded),
                  ),
                  IconButton(
                    tooltip: 'Back to top',
                    onPressed: onBackToTop,
                    icon: const Icon(Icons.keyboard_arrow_up_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
