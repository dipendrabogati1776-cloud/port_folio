import 'package:flutter/material.dart';

class ProjectItem {
  const ProjectItem({
    required this.name,
    required this.description,
    required this.platform,
    required this.role,
    required this.icon,
    required this.technologies,
    required this.responsibilities,
    required this.features,
    this.isFeatured = false,
    this.contributionLabel,
    this.ownershipLabel,
    this.screenshots = const [],
    this.appStoreUrl,
    this.googlePlayUrl,
    this.websiteUrl,
    this.githubUrl,
    this.downloads,
    this.reviews,
    this.ratings,
  });

  final String name;
  final String description;
  final String platform;
  final String role;
  final IconData icon;
  final List<String> technologies;
  final List<String> responsibilities;
  final List<String> features;
  final bool isFeatured;
  final String? contributionLabel;
  final String? ownershipLabel;
  final List<String> screenshots;
  final String? appStoreUrl;
  final String? googlePlayUrl;
  final String? websiteUrl;
  final String? githubUrl;
  final String? downloads;
  final String? reviews;
  final String? ratings;
}
