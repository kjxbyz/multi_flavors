import 'package:flutter/material.dart';

import 'app.dart';
import 'app_config.dart';

void main() {
  AppConfig.create(
    appName: "Dev Example",
    baseUrl: "https://dwirandyh.com",
    flavor: Flavor.internal,
  );

  runApp(const MyApp());
}
