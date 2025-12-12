/// Global spacing tokens for layout consistency.
/// NEVER use raw numbers like 8, 12, 24 in widgets.
/// Always use LayoutTokens.xx.
library;

class LayoutTokens {
  LayoutTokens._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Helper for common screen paddings
class ScreenPadding {
  ScreenPadding._();

  static const double horizontal = 24;
  static const double vertical = 16;
}
