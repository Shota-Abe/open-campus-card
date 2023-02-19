import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'App/MyApp.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}