import 'package:flutter/material.dart';

import '../constants/section_ids.dart';

class NavItem {
  const NavItem({required this.label, required this.sectionId});

  final String label;
  final PortfolioSectionId sectionId;
}

class InfoCardData {
  const InfoCardData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class SkillCategory {
  const SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  final String title;
  final IconData icon;
  final List<String> skills;
}

class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
  });

  final String company;
  final String role;
  final String duration;
  final String description;
}

class EducationItem {
  const EducationItem({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.location,
    required this.description,
    this.highlights = const [],
  });

  final String institution;
  final String degree;
  final String duration;
  final String location;
  final String description;
  final List<String> highlights;
}

class ContactMethod {
  const ContactMethod({
    required this.label,
    required this.value,
    required this.icon,
    this.url,
  });

  final String label;
  final String value;
  final IconData icon;

  /// If set, tapping the card opens this URL. If null, card is copy-only.
  final String? url;
}
