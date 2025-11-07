import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFb71b4d);
  static const primaryGradientStart = Color(0xFFb71b4d);
  static const primaryGradientEnd = Color.fromARGB(255, 209, 42, 95);
  static const scaffoldBg = Color(0xFFF6F6F7);
  static const cardBg = Colors.white;
  static const border = Color(0xFFE0DFDF);
  static const accent = Color(0xFF4B4B4B);
  static const muted = Color(0xFF9E9E9E);
  static const link = Color(0xFF8E0030);
}

class AppGradients {
  static const red = LinearGradient(
    colors: [AppColors.primaryGradientStart, AppColors.primaryGradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppTextStyles {
  static const loginButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const smallMuted = TextStyle(fontSize: 12, color: AppColors.muted);

  static const sectionTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const body = TextStyle(fontSize: 14, color: AppColors.accent);

  static final textTheme = Typography.material2018().black.apply(
    bodyColor: AppColors.accent,
    displayColor: AppColors.accent,
  );
}
