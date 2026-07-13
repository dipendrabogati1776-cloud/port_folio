import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFF050505);
  static const backgroundAlt = Color(0xFF0A0A0A);
  static const surface = Color(0xFF0E0E10);
  static const surfaceHigh = Color(0xFF141418);
  static const surfaceSoft = Color(0xFF191920);

  static const textPrimary = Color(0xFFF8F7FF);
  static const textSecondary = Color(0xFFC6C3D7);
  static const textMuted = Color(0xFF8D89A3);

  static const purple = Color(0xFF8F5BFF);
  static const blue = Color(0xFF38BDF8);
  static const red = Color(0xFFFF4D6D);
  static const success = Color(0xFF40DFA2);

  static const primaryGradient = LinearGradient(
    colors: [purple, blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const brandGradient = LinearGradient(
    colors: [purple, red],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardBorderGradient = LinearGradient(
    colors: [Color(0xBB8F5BFF), Color(0x9938BDF8), Color(0x668F5BFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
