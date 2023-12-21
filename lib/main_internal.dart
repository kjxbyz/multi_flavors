import 'package:flutter/material.dart';

import 'app.dart';
import 'app_config.dart';

void main() {
  AppConfig.create(
    appName: "Internal Example",
    baseUrl: "https://api.example.com/internal",
    flavor: Flavor.internal,
  );

  runApp(const MyApp());
}
