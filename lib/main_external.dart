import 'package:flutter/material.dart';

import 'app.dart';
import 'app_config.dart';

void main() {
  AppConfig.create(
    appName: "External Example",
    baseUrl: "https://api.example.com/external",
    flavor: Flavor.external,
  );

  runApp(const MyApp());
}
