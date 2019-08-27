import 'package:flutter/material.dart';
import 'package:meals_catalogue/view/bottom_nav.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bahan Makanan',
      home: BottomNavigation(),
    );
  }
}