import 'package:flutter/material.dart';

import '../../features/projects/models/project_item.dart';
import '../constants/section_ids.dart';
import '../models/portfolio_models.dart';

const navItems = [
  NavItem(label: 'Home', sectionId: PortfolioSectionId.home),
  NavItem(label: 'Education', sectionId: PortfolioSectionId.education),
  NavItem(label: 'Experience', sectionId: PortfolioSectionId.experience),
  NavItem(label: 'About', sectionId: PortfolioSectionId.about),
  NavItem(label: 'Skills', sectionId: PortfolioSectionId.skills),
  NavItem(label: 'Projects', sectionId: PortfolioSectionId.projects),
  NavItem(label: 'Resume', sectionId: PortfolioSectionId.resume),
  NavItem(label: 'Contact', sectionId: PortfolioSectionId.contact),
];

const resumeAssetPath = 'assets/resume/dipendra_bogati_resume.pdf';
const resumeFileName = 'dipendra_bogati_resume.pdf';

const aboutCards = [
  InfoCardData(
    title: 'Experience',
    description:
        '2+ years of professional experience developing Flutter and iOS applications, integrating APIs, managing production releases, and delivering reliable mobile solutions.',
    icon: Icons.auto_graph_rounded,
  ),

  InfoCardData(
    title: 'Passion',
    description:
        'Driven by crafting polished mobile applications that combine elegant design, excellent performance, and meaningful user experiences.',
    icon: Icons.favorite_border_rounded,
  ),

  InfoCardData(
    title: 'Development Philosophy',
    description:
        'Prioritize simplicity, scalability, and maintainability—building software that is easy to evolve while providing a seamless experience for users.',
    icon: Icons.psychology_alt_rounded,
  ),
];

const skillCategories = [
  SkillCategory(
    title: 'Languages',
    icon: Icons.code_rounded,
    skills: ['Dart', 'Swift', 'Kotlin', 'Java', 'C++'],
  ),
  SkillCategory(
    title: 'Frameworks & SDKs',
    icon: Icons.widgets_rounded,
    skills: ['Flutter', 'Firebase'],
  ),
  SkillCategory(
    title: 'Backend & APIs',
    icon: Icons.cloud_queue_rounded,
    skills: ['REST APIs', 'Firebase', 'Cloud Firestore', 'Google Drive API'],
  ),
  SkillCategory(
    title: 'State Management',
    icon: Icons.account_tree_rounded,
    skills: ['Riverpod', 'Bloc', 'Provider', 'ValueNotifier'],
  ),
  SkillCategory(
    title: 'Databases',
    icon: Icons.storage_rounded,
    skills: ['SQLite', 'Hive', 'Cloud Firestore'],
  ),
  SkillCategory(
    title: 'Tools',
    icon: Icons.build_rounded,
    skills: ['Git', 'Android Studio', 'Xcode', 'VS Code', 'Figma'],
  ),
  SkillCategory(
    title: 'Platforms',
    icon: Icons.devices_rounded,
    skills: ['Android', 'iOS', 'Web'],
  ),
];

const experienceItems = [
  ExperienceItem(
    company: 'GTS Infosoft LLP',
    role: 'Flutter Developer',
    duration: '22 Jan, 2024 - Present',
    description:
        'Developed and maintained cross-platform Flutter applications for Android and iOS, integrated REST APIs, implemented state management, optimized app performance, fixed production issues, and collaborated with designers and backend developers to deliver high-quality mobile solutions.',
  ),

  ExperienceItem(
    company: 'GTS Infosoft LLP',
    role: 'iOS Developer',
    duration: 'July, 2024 - Present',
    description:
        'Built and maintained iOS applications using Flutter with native iOS deployment, managed App Store releases, configured certificates and provisioning profiles, integrated platform-specific features, resolved iOS-specific issues, and ensured smooth app performance across Apple devices.',
  ),
];

const educationItems = [
  EducationItem(
    institution:
        'Jai Narain Vyas University / Lucky Institute Of Professional Studies',
    degree: 'Bachelor of Computer Applications (BCA)',
    duration: '2021 - 2024',
    location: 'Jodhpur, Rajasthan, India',
    description:
        'Studied computer science fundamentals with a focus on software development, object-oriented programming, data structures, databases, operating systems, computer networks, and mobile application development.',
    highlights: [
      'Focused on application development and software engineering principles.',
      'Built academic and personal software development projects.',
    ],
  ),

  EducationItem(
    institution: 'Kailali Model Secondary School',
    degree: 'Intermediate in Science (I.Sc.)',
    duration: '2017 - 2019',
    location: 'Dhangadhi, Kailali, Nepal',
    description:
        'Completed higher secondary education with a science specialization, building a strong foundation in mathematics, physics, computer science, and analytical problem-solving.',
    highlights: [
      'Science stream with Computer Science.',
      'Developed a strong foundation for higher studies in computing.',
    ],
  ),
];

const projects = [
  ProjectItem(
    name: 'PaathBook Bhasa',
    description:
        'A reading-first language learning product designed around stories, vocabulary, conversation practice, and contextual discovery instead of quiz-heavy lessons.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.menu_book_rounded,
    technologies: [
      'Flutter',
      'Riverpod',
      'Localization',
      'Offline Dictionary',
      'AI Fallback',
    ],
    responsibilities: [
      'Designed the Flutter application structure for a personal product in active development.',
      'Built the foundation for reading, vocabulary, stories, and conversation-focused learning flows.',
      'Planned offline-first dictionary behavior, word normalization, localization, and gamified progress.',
    ],
    features: [
      'Reading-first language acquisition experience',
      'Multi-language learning support',
      'Offline dictionary with normalized word lookup',
      'AI-assisted dictionary fallback',
      'Vocabulary, stories, conversations, and gamification',
    ],
    isFeatured: true,
    contributionLabel: 'Solely developed',
    ownershipLabel: 'Personal Product',
    screenshots: [
      'assets/bhasa/bhasa_home.jpg',
      'assets/bhasa/bhasa_dictionary.jpg',
      'assets/bhasa/bhasa_game_home.jpg',
      'assets/bhasa/bhasa_levels.jpg',
      'assets/bhasa/bhasa_sheet.jpg',
    ],
  ),
  ProjectItem(
    name: 'Khoj Samachar',
    description:
        'A modern news application for verified breaking updates, Nepal-focused reporting, global affairs, sports, business, politics, and analysis in a fast mobile experience.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.newspaper_rounded,
    downloads: "250K+",
    reviews: "13.2k",
    ratings: "4.9",
    technologies: [
      'Flutter',
      'Dart',
      'News Feed',
      'Push Notifications',
      'Method Channels',
      'Native Android',
      'Content Platform',
    ],
    responsibilities: [
      'Solely developed the Flutter mobile application for Android and iOS release.',
      'Wrote native Android code for a home-screen widget that displays calendar event details and refreshes automatically every day at 00:01.',
      'Built a custom native notification view for a persistent, non-dismissible notification experience.',
      'Handled notification scheduling through Flutter method channels without relying on a notification package.',
    ],
    features: [
      'Verified breaking news and Nepal news coverage',
      'International news, politics, business, diplomacy, and global affairs',
      'Sports updates and in-depth analysis',
      'Fast mobile-first reading interface',
      'Android and iOS availability',
    ],
    contributionLabel: 'Solely developed',
    screenshots: [
      'assets/khoj_samachar/home.jpg',
      'assets/khoj_samachar/calendar.jpg',
      'assets/khoj_samachar/expense.jpg',
      'assets/khoj_samachar/videos.jpg',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id6741786030',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.roshan.shrestha.roshan',
  ),
  ProjectItem(
    name: 'WikiBG',
    description:
        'A verification-first biography and documentation app that brings editorially reviewed WikiBG content into a clean mobile reading experience.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.fact_check_rounded,
    downloads: "3K+",
    technologies: [
      'Flutter',
      'Dart',
      'Content Platform',
      'Editorial Workflow',
      'Web Integration',
    ],
    responsibilities: [
      'Solely developed the mobile app experience connected to the official WikiBG platform.',
      'Presented reviewed biography and documentation content in a mobile-friendly format.',
      'Focused on clarity, navigation, and trustworthy content consumption across platforms.',
    ],
    features: [
      'Verification-first biography content',
      'Editorially reviewed documentation',
      'Official website integration',
      'Mobile-friendly reading experience',
      'Android and iOS availability',
    ],
    contributionLabel: 'Solely developed',
    screenshots: ['assets/wiki_bg/featured.jpg', 'assets/wiki_bg/tools.jpg'],
    appStoreUrl: 'https://apps.apple.com/app/id6759668747',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.wikibg.app',
  ),
  ProjectItem(
    name: 'PaathBook',
    description:
        'A privacy-focused educational app for Nepali GK, grammar, quizzes, bilingual learning, and lightweight PDF utilities for students and self-learners.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    downloads: "2.6K+",
    reviews: "56",
    ratings: "5.0",
    icon: Icons.cast_for_education_rounded,
    technologies: [
      'Flutter',
      'Dart',
      'Bilingual Content',
      'Quiz Experience',
      'PDF Tools',
      'Firebase',
      'SQLite',
      'Method Channels',
    ],
    responsibilities: [
      'Solely developed the personal Flutter product for Android and iOS release.',
      'Implemented native notification scheduling through method channels without a notification package.',
      'Handled notification tap events and deep-link redirection from native code back into Flutter.',
      'Built a Firebase-to-local-database sync strategy where content is served from SQLite and Firebase is fetched only when new data is available.',
      'Reduced backend reads and billing cost by making local data the primary source for the app experience.',
    ],
    features: [
      'Nepali GK and educational content',
      'GK and grammar quizzes',
      'Nepali and English bilingual support',
      'Clean interface with no login requirement',
      'Privacy-focused learning experience',
      'PDF scan, compress, edit, combine, image-to-PDF, extraction, and text tools',
    ],
    contributionLabel: 'Solely developed',
    ownershipLabel: 'Personal Product',
    screenshots: [
      'assets/paathbook/home.jpg',
      'assets/paathbook/doc_studio.jpg',
      'assets/paathbook/quiz.jpg',
      'assets/paathbook/samanya_gyan.jpg',
      'assets/paathbook/meaning_bottom_sheet.jpeg',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id6760779307',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.paathbook.app',
  ),
  ProjectItem(
    name: 'EventLocal',
    description:
        'A professional event networking app for conferences and corporate events, helping attendees discover schedules, connect with participants, and stay updated in real time.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.event_available_rounded,
    technologies: ['Flutter', 'Dart', 'Push Notifications', 'Realtime Chat'],
    responsibilities: [
      'Implemented mobile event experiences for attendee access, networking, and engagement.',
      'Supported real-time communication, event information, and contact exchange workflows.',
      'Worked on polished Flutter screens suitable for live conference usage.',
    ],
    features: [
      'Event invitations and live event information',
      'Participant networking and contact exchange',
      'Built-in chat and notifications',
      'Speaker and exhibitor information',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id874271741',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.event.local',
  ),
  ProjectItem(
    name: 'The Academix',
    description:
        'An education platform that brings institutional learning resources, virtual classrooms, attendance, assessments, and secure academic collaboration into one mobile experience.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.school_rounded,
    technologies: [
      'Flutter',
      'Google Meet',
      'Zoom',
      'Google Drive',
      'Cloud Services',
    ],
    responsibilities: [
      'Developed Flutter features for academic workflows across students and institutions.',
      'Integrated classroom, assessment, attendance, and collaboration-oriented experiences.',
      'Helped organize complex education features into a cohesive mobile interface.',
    ],
    features: [
      'Course management and learning resources',
      'Live classes with Google Meet and Zoom support',
      'QR-based attendance',
      'Online assessments',
      'Google Drive integration and secure cloud infrastructure',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id6502640514',
  ),
  ProjectItem(
    name: 'DartsKey',
    description:
        'An advanced darts companion app combining AI-assisted score capture, multiplayer play, performance tracking, and synchronized game experiences.',
    platform: 'Flutter',
    role: 'Flutter Developer',
    icon: Icons.sports_score_rounded,
    technologies: [
      'Flutter',
      'AI Camera Scoring',
      'Bluetooth',
      'Realtime Sync',
      'Subscriptions',
      'In-App Purchase',
      'Game Logic',
    ],
    responsibilities: [
      'Implemented in-app purchase flows for premium access and monetized features.',
      'Wrote core darts game logic for scoring, match flow, and gameplay rules.',
      'Contributed to real-time synchronization and analytics-focused user flows.',
      'Supported premium app functionality and performance-sensitive game interactions.',
    ],
    features: [
      'AI camera scoring',
      'Online and Bluetooth multiplayer',
      'AI opponent and multiple game modes',
      'Match statistics',
      'Premium subscription support',
      'Real-time synchronization',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id6780764437',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.key.darts.app',
  ),
  ProjectItem(
    name: 'Timelee',
    description:
        'A native iOS productivity app for flexible reminders, task planning, calendar-aware scheduling, and smart everyday automation.',
    platform: 'Native iOS',
    role: 'iOS Developer',
    icon: Icons.alarm_rounded,
    technologies: [
      'iOS',
      'Swift',
      'Local Notifications',
      'Location Monitoring',
      'Offline Sync',
      'In-App Purchase',
    ],
    responsibilities: [
      'Built reminder workflows using local notifications, including standard reminders and location-based reminders.',
      'Implemented location monitoring to trigger reminders when users enter or exit selected locations.',
      'Managed daily, weekly, and intra-day repeating reminder schedules.',
      'Implemented subscription plans and one-time token purchase flows.',
      'Built an offline-first local storage model with server synchronization when internet connectivity becomes available.',
    ],
    features: [
      'Smart reminders and calendar synchronization',
      'Medication management',
      'Location-based reminders',
      'Team collaboration',
      'Shopping lists',
      'Multiple notification methods',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id6740476818',
  ),
  ProjectItem(
    name: 'ScanPix',
    description:
        'A native iOS document scanner that turns a phone into a portable capture tool for documents, IDs, passports, PDFs, and business records.',
    platform: 'Native iOS',
    role: 'iOS Developer',
    icon: Icons.document_scanner_rounded,
    technologies: [
      'iOS',
      'Swift',
      'PDF',
      'Edge Detection',
      'Offline Sync',
      'In-App Purchase',
    ],
    responsibilities: [
      'Built a professional document scanner with edge detection, capture enhancement, and basic editing tools.',
      'Added background removal and password-protected file handling for document workflows.',
      'Implemented in-app purchase flows for premium scanner functionality.',
      'Built offline-first local storage with server synchronization whenever connectivity is available.',
    ],
    features: [
      'Document, ID, and passport scanning',
      'Automatic scan enhancement',
      'PDF generation',
      'Cloud backup',
      'Printing support',
      'Scan templates',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id1281894975',
  ),
  ProjectItem(
    name: 'Bender',
    description:
        'A native iOS social and dating app built around location-based discovery, secure communication, profiles, and travel-aware matching.',
    platform: 'Native iOS',
    role: 'iOS Developer',
    icon: Icons.people_alt_rounded,
    technologies: ['iOS', 'Swift', 'Location Services', 'Realtime Messaging'],
    responsibilities: [
      'Implemented in-app purchase flows for premium dating and social features.',
      'Implemented native iOS social discovery and messaging workflows.',
      'Built location-aware product features for search, profiles, and user interaction.',
      'Supported secure communication patterns and profile management experiences.',
    ],
    features: [
      'Live location and travel mode',
      'Advanced search filters',
      'Real-time messaging',
      'Profile management',
      'Media sharing',
      'User verification',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id1563347365',
  ),
  ProjectItem(
    name: 'Coaching Zone',
    description:
        'A native iOS sports coaching platform that helps coaches plan training sessions with structured plans, exercise libraries, and professional video content.',
    platform: 'Native iOS',
    role: 'iOS Developer',
    icon: Icons.sports_rounded,
    technologies: [
      'iOS',
      'Swift',
      'Video Content',
      'Team Management',
      'In-App Purchase',
    ],
    responsibilities: [
      'Implemented in-app purchase flows for premium coaching content and subscription access.',
      'Developed native iOS features for planning, organizing, and managing coaching sessions.',
      'Supported exercise-library and professional-video workflows for coach-led training.',
      'Contributed to team and content-management experiences.',
    ],
    features: [
      'Training plans and session organization',
      'Exercise library',
      'Professional coaching videos',
      'Team management',
      'Custom coaching content',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id1579274298',
  ),
  ProjectItem(
    name: 'Food Dudes',
    description:
        'A native iOS food delivery platform connecting restaurants and customers through discovery, ordering, menu management, and delivery tracking.',
    platform: 'Native iOS',
    role: 'iOS Developer',
    icon: Icons.delivery_dining_rounded,
    technologies: ['iOS', 'Swift', 'Maps', 'Payments', 'Push Notifications'],
    responsibilities: [
      'Developed native iOS features for ordering, restaurant discovery, and delivery flows.',
      'Contributed to customer-facing marketplace screens and operational food-delivery workflows.',
      'Supported multi-location ordering and tracking-oriented app behavior.',
    ],
    features: [
      'Restaurant discovery',
      'Online ordering',
      'Menu management',
      'Delivery tracking',
      'Multi-location support',
    ],
    appStoreUrl: 'https://apps.apple.com/app/id1180442819',
  ),
];

const contactMethods = [
  ContactMethod(
    label: 'Email',
    value: 'dipendrabogati1776@gmail.com',
    icon: Icons.mail_outline_rounded,
    url: 'mailto:dipendrabogati1776@gmail.com',
  ),
  ContactMethod(
    label: 'Phone',
    value: '+91 9057241670',
    icon: Icons.phone_outlined,
    url: 'https://wa.me/919057241670',
  ),
  ContactMethod(
    label: 'LinkedIn',
    value: 'linkedin.com/in/dipendrabogati',
    icon: Icons.work_outline_rounded,
    url: 'https://www.linkedin.com/in/dipendrabogati/',
  ),
  ContactMethod(
    label: 'GitHub',
    value: 'github.com/Dipendrabogati',
    icon: Icons.code_rounded,
    url: 'https://github.com/Dipendrabogati',
  ),
  ContactMethod(
    label: 'Location',
    value: 'Jodhpur, India · Doti, Nepal',
    icon: Icons.location_on_outlined,
  ),
];
