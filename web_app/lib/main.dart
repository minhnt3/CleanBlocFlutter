import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BuildConfig.flavor = Flavor.staging;
  runApp(App());
}
