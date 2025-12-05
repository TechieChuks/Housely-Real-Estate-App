import 'package:flutter/material.dart';

/// App-wide color design tokens.
/// Each color group contains shades (25–900) matching your style guide.
class AppColors {
  AppColors._(); // private constructor

  // -----------------------------
  // Base Colors
  // -----------------------------
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF0B1327);

  // -----------------------------
  // Gray Scale
  // -----------------------------
  static const Map<int, Color> gray = {
    25: Color(0xFFF6F6F6),
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF2F4F7),
    200: Color(0xFFE4E7EC),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(0xFF667085),
    600: Color(0xFF475467),
    700: Color(0xFF344054),
    800: Color(0xFF1D2939),
    900: Color(0xFF101828),
  };

  // -----------------------------
  // Primary Brand Colors
  // -----------------------------
  static const Map<int, Color> primary = {
    25: Color(0xFFFCFAFF),
    50: Color(0xFFF9F5FF),
    100: Color(0xFFF4EBFF),
    200: Color(0xFFE9D7FE),
    300: Color(0xFFD6BBFB),
    400: Color(0xFFB692F6),
    500: Color(0xFF9E77ED),
    600: Color(0xFF7F56D9),
    700: Color(0xFF6941C6),
    800: Color(0xFF53389E),
    900: Color(0xFF42307D),
  };

  // -----------------------------
  // Error Colors
  // -----------------------------
  static const Map<int, Color> error = {
    25: Color(0xFFFFFBFA),
    50: Color(0xFFFEF3F2),
    100: Color(0xFFFEE4E2),
    200: Color(0xFFFECDCA),
    300: Color(0xFFFDA29B),
    400: Color(0xFFF97066),
    500: Color(0xFFF04438),
    600: Color(0xFFD92D20),
    700: Color(0xFFB42318),
    800: Color(0xFF912018),
    900: Color(0xFF7A271A),
  };

  // -----------------------------
  // Success Colors
  // -----------------------------
  static const Map<int, Color> success = {
    25: Color(0xFFF6FEF9),
    50: Color(0xFFECFDF3),
    100: Color(0xFFD1FADF),
    200: Color(0xFFA6F4C5),
    300: Color(0xFF6CE9A6),
    400: Color(0xFF32D583),
    500: Color(0xFF12B76A),
    600: Color(0xFF039855),
    700: Color(0xFF027A48),
    800: Color(0xFF05603A),
    900: Color(0xFF054F31),
  };

  // -----------------------------
  // Warning Colors
  // -----------------------------
  static const Map<int, Color> warning = {
    25: Color(0xFFFFFEF8),
    50: Color(0xFFFEFCEA),
    100: Color(0xFFFEEFC7),
    200: Color(0xFFFEDF89),
    300: Color(0xFFFEC84B),
    400: Color(0xFFFDB022),
    500: Color(0xFFF79009),
    600: Color(0xFFDC6803),
    700: Color(0xFFB54708),
    800: Color(0xFF93370D),
    900: Color(0xFF7A2E0E),
  };

  // -----------------------------
  // Convenience getters (optional)
  // -----------------------------
  static Color get primaryColor => primary[600]!;
  static Color get background => gray[25]!;
  static Color get textPrimary => gray[900]!;
  static Color get textSecondary => gray[700]!;

  // --------------------------------------------------
  // Secondary Gray Families
  // --------------------------------------------------

  /// Gray Neutral
  static const Map<int, Color> grayNeutral = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD2D6DB),
    400: Color(0xFF9DA4AE),
    500: Color(0xFF6C737F),
    600: Color(0xFF4D5761),
    700: Color(0xFF384250),
    800: Color(0xFF1F2A37),
    900: Color(0xFF111927),
  };

  /// Gray Blue
  static const Map<int, Color> grayBlue = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF8F9FC),
    100: Color(0xFFEAECF5),
    200: Color(0xFFC8CCE5),
    300: Color(0xFFA4AADB),
    400: Color(0xFF717BBC),
    500: Color(0xFF4E5BA6),
    600: Color(0xFF3E4784),
    700: Color(0xFF363F72),
    800: Color(0xFF293056),
    900: Color(0xFF101323),
  };

  /// Gray Cool
  static const Map<int, Color> grayCool = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF9F9FB),
    100: Color(0xFFF1F1F5),
    200: Color(0xFFDCDFEA),
    300: Color(0xFFB9C0D4),
    400: Color(0xFF7D89B0),
    500: Color(0xFF5D6B98),
    600: Color(0xFF4A5578),
    700: Color(0xFF404968),
    800: Color(0xFF30374F),
    900: Color(0xFF111322),
  };

  /// Gray Modern
  static const Map<int, Color> grayModern = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF8FAFC),
    100: Color(0xFFEFF2F6),
    200: Color(0xFFE3E8EF),
    300: Color(0xFFC7CDD3),
    400: Color(0xFF9AA4B2),
    500: Color(0xFF69758A),
    600: Color(0xFF4B5565),
    700: Color(0xFF364152),
    800: Color(0xFF202939),
    900: Color(0xFF121926),
  };

  /// Gray True
  static const Map<int, Color> grayTrue = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFE5E5E5),
    300: Color(0xFFD6D6D6),
    400: Color(0xFFA3A3A3),
    500: Color(0xFF737373),
    600: Color(0xFF525252),
    700: Color(0xFF424242),
    800: Color(0xFF292929),
    900: Color(0xFF141414),
  };

  /// Gray Warm
  static const Map<int, Color> grayWarm = {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFFAF9F9),
    100: Color(0xFFF5F5F4),
    200: Color(0xFFE7E5E4),
    300: Color(0xFFD7D3D0),
    400: Color(0xFFA9A29D),
    500: Color(0xFF79716B),
    600: Color(0xFF57534E),
    700: Color(0xFF44403C),
    800: Color(0xFF292524),
    900: Color(0xFF1C1917),
  };
}
