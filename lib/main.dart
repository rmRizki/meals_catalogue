import 'package:flutter/material.dart';
import 'package:meals_catalogue/view/list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bahan Makanan',
      home: ListScreen(),
    );
  }
}


