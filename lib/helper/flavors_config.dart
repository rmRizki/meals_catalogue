import 'package:flutter/material.dart';

enum Flavor { DEVELOPMENT, PERFORMANCE, RELEASE, RELEASE_DARK }

class Config {
  static Flavor appFlavor;

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return true;
      default:
        return false;
    }
  }

  static bool get isPerformance {
    switch (appFlavor) {
      case Flavor.PERFORMANCE:
        return true;
      default:
        return false;
    }
  }

  static bool get debugBanner {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return true;
      case Flavor.PERFORMANCE:
        return true;
      default:
        return false;
    }
  }

  static ThemeData get themeData {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return ThemeData.light();
      case Flavor.RELEASE_DARK:
        return ThemeData.dark();
      default:
        return null;
    }
  }
}
