import 'package:go_router/go_router.dart';

import '../widgets/portfolio_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const PortfolioShell(),
    ),
  ],
);
