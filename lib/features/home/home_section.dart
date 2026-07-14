import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:port_folio/core/utils/app_images.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/animated_reveal.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.onViewProjects,
    required this.onDownloadResume,
  });

  final VoidCallback onViewProjects;
  final VoidCallback onDownloadResume;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      child: Stack(
        children: [
          const Positioned.fill(child: _SubtleAnimatedBackground()),
          SectionContainer(
            padding: EdgeInsets.fromLTRB(0, isMobile ? 128 : 150, 0, 72),
            child: isMobile
                ? Column(
                    children: [
                      _HeroCopy(
                        textTheme: textTheme,
                        centered: true,
                        onViewProjects: onViewProjects,
                        onDownloadResume: onDownloadResume,
                      ),
                      const SizedBox(height: 56),
                      const AnimatedReveal(
                        delay: Duration(milliseconds: 160),
                        child: _ProfilePlaceholder(),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _HeroCopy(
                          textTheme: textTheme,
                          centered: false,
                          onViewProjects: onViewProjects,
                          onDownloadResume: onDownloadResume,
                        ),
                      ),
                      const SizedBox(width: 56),
                      const Expanded(
                        flex: 4,
                        child: AnimatedReveal(
                          delay: Duration(milliseconds: 160),
                          child: _ProfilePlaceholder(),
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

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.textTheme,
    required this.centered,
    required this.onViewProjects,
    required this.onDownloadResume,
  });

  final TextTheme textTheme;
  final bool centered;
  final VoidCallback onViewProjects;
  final VoidCallback onDownloadResume;

  @override
  Widget build(BuildContext context) {
    return AnimatedReveal(
      child: Column(
        crossAxisAlignment: centered
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.purple.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: AppColors.purple.withValues(alpha: 0.32),
              ),
            ),
            child: Text(
              'Available for Mobile App Development',
              textAlign: TextAlign.center,
              style: textTheme.labelLarge?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Dipendra Bogati',
            textAlign: centered ? TextAlign.center : TextAlign.left,
            style: textTheme.displayLarge?.copyWith(
              fontSize: centered ? 40 : 72,
            ),
          ),
          const SizedBox(height: 16),
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.primaryGradient.createShader(bounds),
            child: Text(
              'Flutter & iOS Developer',
              textAlign: centered ? TextAlign.center : TextAlign.left,
              style: textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 22),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              'Professional iOS and Flutter developer with experience building and maintaining Android and iOS applications. Passionate about creating high-performance, user-friendly mobile apps with clean architecture, intuitive UI, and reliable production-ready solutions.',
              textAlign: centered ? TextAlign.center : TextAlign.left,
              style: textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 34),
          Wrap(
            alignment: centered ? WrapAlignment.center : WrapAlignment.start,
            spacing: 14,
            runSpacing: 14,
            children: [
              GradientButton(
                label: 'View Projects',
                icon: Icons.grid_view_rounded,
                onPressed: onViewProjects,
              ),
              GradientButton(
                label: 'Download Resume',
                icon: Icons.download_rounded,
                onPressed: onDownloadResume,
                outlined: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfilePlaceholder extends StatelessWidget {
  const _ProfilePlaceholder();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
        ),
        padding: const EdgeInsets.all(3),
        child: ClipOval(
          child: Image.asset(
            AppImages.my_image.value,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

class _SubtleAnimatedBackground extends StatefulWidget {
  const _SubtleAnimatedBackground();

  @override
  State<_SubtleAnimatedBackground> createState() =>
      _SubtleAnimatedBackgroundState();
}

class _SubtleAnimatedBackgroundState extends State<_SubtleAnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _BackgroundPainter(progress: _controller.value),
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  const _BackgroundPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.purple.withValues(alpha: 0.08);

    const spacing = 54.0;
    final offset = progress * spacing;

    for (double x = -spacing; x < size.width + spacing; x += spacing) {
      canvas.drawLine(Offset(x + offset, 0), Offset(x, size.height), paint);
    }

    final accentPaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              AppColors.purple.withValues(alpha: 0.14),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(
                size.width * (0.72 + math.sin(progress * math.pi * 2) * 0.04),
                size.height * 0.34,
              ),
              radius: size.shortestSide * 0.5,
            ),
          );
    canvas.drawRect(Offset.zero & size, accentPaint);

    final bluePaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              AppColors.blue.withValues(alpha: 0.08),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(
                size.width * (0.2 + math.cos(progress * math.pi * 2) * 0.04),
                size.height * 0.65,
              ),
              radius: size.shortestSide * 0.4,
            ),
          );
    canvas.drawRect(Offset.zero & size, bluePaint);
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
