import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_header.dart';
import 'models/project_item.dart';
import 'widgets/project_card.dart';

enum _ProjectFilter {
  all('All'),
  flutter('Flutter'),
  nativeIos('Native iOS'),
  solelyDeveloped('Solely Developed'),
  personalProducts('Personal Products'),
  releasedApps('Released Apps');

  const _ProjectFilter(this.label);

  final String label;
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final _searchController = TextEditingController();
  _ProjectFilter _selectedFilter = _ProjectFilter.all;
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProjectItem> get _filteredProjects {
    final normalizedQuery = _query.trim().toLowerCase();

    return projects.where((project) {
      final matchesFilter = switch (_selectedFilter) {
        _ProjectFilter.all => true,
        _ProjectFilter.flutter => project.platform == 'Flutter',
        _ProjectFilter.nativeIos => project.platform == 'Native iOS',
        _ProjectFilter.solelyDeveloped =>
          project.contributionLabel == 'Solely developed',
        _ProjectFilter.personalProducts =>
          project.ownershipLabel == 'Personal Product',
        _ProjectFilter.releasedApps =>
          project.appStoreUrl != null || project.googlePlayUrl != null,
      };

      if (!matchesFilter) return false;
      if (normalizedQuery.isEmpty) return true;

      final searchableText = [
        project.name,
        project.description,
        project.platform,
        project.role,
        if (project.contributionLabel != null) project.contributionLabel!,
        if (project.ownershipLabel != null) project.ownershipLabel!,
        ...project.technologies,
        ...project.responsibilities,
        ...project.features,
      ].join(' ').toLowerCase();

      return searchableText.contains(normalizedQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final featuredProject = projects.firstWhere(
      (project) => project.isFeatured,
    );
    final filteredProjects = _filteredProjects;
    final showFeatured = filteredProjects.contains(featuredProject);
    final flutterProjects = filteredProjects
        .where(
          (project) => project.platform == 'Flutter' && !project.isFeatured,
        )
        .toList();
    final iosProjects = filteredProjects
        .where((project) => project.platform == 'Native iOS')
        .toList();
    final hasResults =
        showFeatured || flutterProjects.isNotEmpty || iosProjects.isNotEmpty;

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Projects',
            title: 'Mobile applications built with Flutter and iOS.',
            description:
                "Explore the apps I've developed professionally and personally, including production releases, cross-platform solutions, and native iOS projects.",
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final filter in _ProjectFilter.values)
                _ProjectFilterChip(
                  label: filter.label,
                  selected: _selectedFilter == filter,
                  onSelected: () => setState(() => _selectedFilter = filter),
                ),
            ],
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Search projects, technologies, roles, or features',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _query.isEmpty
                  ? Icon(
                      Icons.tune_rounded,
                      color: AppColors.textSecondary.withValues(alpha: 0.7),
                    )
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _query = '');
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
            ),
          ),
          const SizedBox(height: 26),
          if (!hasResults)
            const _EmptyProjectsState()
          else ...[
            if (showFeatured) ...[
              AnimatedReveal(
                child: ProjectCard(project: featuredProject, featured: true),
              ),
              const SizedBox(height: 42),
            ],
            if (flutterProjects.isNotEmpty) ...[
              _ProjectGroup(
                title: 'Flutter Applications',
                projects: flutterProjects,
                isMobile: isMobile,
              ),
              const SizedBox(height: 42),
            ],
            if (iosProjects.isNotEmpty)
              _ProjectGroup(
                title: 'Native iOS Applications',
                projects: iosProjects,
                isMobile: isMobile,
              ),
          ],
        ],
      ),
    );
  }
}

class _ProjectGroup extends StatelessWidget {
  const _ProjectGroup({
    required this.title,
    required this.projects,
    required this.isMobile,
  });

  final String title;
  final List<ProjectItem> projects;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isMobile
                ? constraints.maxWidth
                : (constraints.maxWidth - 20) / 2;

            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (var index = 0; index < projects.length; index++)
                  SizedBox(
                    width: cardWidth,
                    child: AnimatedReveal(
                      delay: Duration(milliseconds: 80 * index),
                      child: ProjectCard(project: projects[index]),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ProjectFilterChip extends StatelessWidget {
  const _ProjectFilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected,
      onSelected: (_) => onSelected(),
      label: Text(label),
      backgroundColor: AppColors.surfaceHigh,
      selectedColor: AppColors.purple.withValues(alpha: 0.18),
      side: BorderSide(color: selected ? AppColors.purple.withValues(alpha: 0.5) : const Color(0xFF2A2A38)),
    );
  }
}

class _EmptyProjectsState extends StatelessWidget {
  const _EmptyProjectsState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF2A2A38)),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.search_off_rounded,
            color: AppColors.purple,
            size: 34,
          ),
          const SizedBox(height: 12),
          Text(
            'No matching projects',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            'Try a different filter or search term.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
