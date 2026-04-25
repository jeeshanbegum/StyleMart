import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF755B00);
  static const Color primaryContainer = Color(0xFFC9A84C);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF503D00);
  static const Color primaryFixed = Color(0xFFFFE08F);
  static const Color primaryFixedDim = Color(0xFFE6C364);
  static const Color onPrimaryFixed = Color(0xFF241A00);
  static const Color onPrimaryFixedVariant = Color(0xFF584400);

  // Secondary
  static const Color secondary = Color(0xFF5D5C74);
  static const Color secondaryContainer = Color(0xFFE2E0FC);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF63627A);
  static const Color secondaryFixed = Color(0xFFE2E0FC);
  static const Color secondaryFixedDim = Color(0xFFC6C4DF);
  static const Color onSecondaryFixed = Color(0xFF1A1A2E);
  static const Color onSecondaryFixedVariant = Color(0xFF45455B);

  // Tertiary
  static const Color tertiary = Color(0xFF5E5E5E);
  static const Color tertiaryContainer = Color(0xFFACABAB);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFF3F4040);

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Surface
  static const Color surface = Color(0xFFFCF9F8);
  static const Color surfaceBright = Color(0xFFFCF9F8);
  static const Color surfaceDim = Color(0xFFDCD9D9);
  static const Color surfaceContainer = Color(0xFFF0EDED);
  static const Color surfaceContainerLow = Color(0xFFF6F3F2);
  static const Color surfaceContainerHigh = Color(0xFFEAE7E7);
  static const Color surfaceContainerHighest = Color(0xFFE5E2E1);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFE5E2E1);
  static const Color surfaceTint = Color(0xFF755B00);
  static const Color onSurface = Color(0xFF1C1B1B);
  static const Color onSurfaceVariant = Color(0xFF4D4637);

  // Background
  static const Color background = Color(0xFFFCF9F8);
  static const Color onBackground = Color(0xFF1C1B1B);

  // Outline
  static const Color outline = Color(0xFF7E7665);
  static const Color outlineVariant = Color(0xFFD0C5B2);

  // Inverse
  static const Color inverseSurface = Color(0xFF313030);
  static const Color inverseOnSurface = Color(0xFFF3F0EF);
  static const Color inversePrimary = Color(0xFFE6C364);

  // Additional custom colors used in design
  static const Color gold = Color(0xFFC9A84C);
  static const Color darkNavy = Color(0xFF1A1A2E);
  static const Color iconGray = Color(0xFF5E5E5E);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        onPrimary: AppColors.onPrimary,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondary: AppColors.onSecondary,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiary: AppColors.onTertiary,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        errorContainer: AppColors.errorContainer,
        onError: AppColors.onError,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        inversePrimary: AppColors.inversePrimary,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headlineLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w800,
          color: AppColors.onSurface,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 6,
          color: AppColors.darkNavy,
        ),
        bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          color: AppColors.onSurface,
        ),
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          color: AppColors.onSurface,
        ),
        bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          color: AppColors.tertiary,
        ),
        labelSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          letterSpacing: 2,
          color: AppColors.tertiary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 6,
          color: AppColors.darkNavy,
        ),
        iconTheme: const IconThemeData(color: AppColors.iconGray),
      ),
    );
  }
}
