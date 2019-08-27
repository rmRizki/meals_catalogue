import 'package:flutter/material.dart';
import 'package:meals_catalogue/helper/flavors_config.dart';
import 'package:meals_catalogue/view/bottom_nav.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: Config.isDebug,
      showSemanticsDebugger: Config.isDebug,
      debugShowCheckedModeBanner: Config.debugBanner,
      showPerformanceOverlay: Config.isPerformance,
      theme: Config.themeData,
      title: 'Bahan Makanan',
      home: BottomNavigation(),
    );
  }
}
