import 'package:flutter/material.dart';

class ColorHelper {
  // Cool-toned Primary Colors
  static const Color primary = Color(0xFF5A83A2); // Cool Blue
  static const Color primaryLight = Color(0xFF87A7C2);
  static const Color primaryDark = Color(0xFF2E5870);

  // Cool-toned Secondary Colors
  static const Color secondary = Color(0xFF497A6C); // Cool Green
  static const Color secondaryLight = Color(0xFF73A393);
  static const Color secondaryDark = Color(0xFF2A514B);

  // Cool-toned Accent Colors
  static const Color accent = Color(0xFF78909C); // Cool Grey-Blue
  static const Color accentLight = Color(0xFFA3B5C2);
  static const Color accentDark = Color(0xFF4A6A75);

  // Neutral Colors (Cool Tones)
  static const Color background = Color(0xFFC9D4DC); // Cool Gray
  static const Color surface = Color(0xFFE1E8ED); // Light Cool Gray
  static const Color error = Color(0xFFD16B6B); // Cool Red

  // Text Colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF2D2D2D); // Dark Gray
  static const Color onSurface = Color(0xFF2D2D2D);
  static const Color onError = Color(0xFFFFFFFF);

  // Shades of Background (Cool Tones)
  static Color gray100 = onBackground.withOpacity(0.1);
  static Color gray200 = onBackground.withOpacity(0.2);
  static Color gray300 = onBackground.withOpacity(0.3);
  static Color gray400 = onBackground.withOpacity(0.4);
  static Color gray500 = onBackground.withOpacity(0.5);
  static Color gray600 = onBackground.withOpacity(0.6);
  static Color gray700 = onBackground.withOpacity(0.7);
  static Color gray800 = onBackground.withOpacity(0.8);
  static Color gray900 = onBackground.withOpacity(0.9);

  // Additional Colors
  static const Color success = Color(0xFF669F8D); // Cool Green Success
  static const Color warning = Color(0xFFB88745); // Muted Cool Brown
  static const Color info = Color(0xFF5B8AA4); // Cool Blue Info
}
