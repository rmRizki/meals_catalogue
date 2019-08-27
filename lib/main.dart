import 'package:flutter/material.dart';
import 'package:meals_catalogue/app_entry.dart';
import 'package:meals_catalogue/helper/flavors_config.dart';

void main() {
  Config.appFlavor = Flavor.RELEASE_LIGHT;
  runApp(MyApp());
}