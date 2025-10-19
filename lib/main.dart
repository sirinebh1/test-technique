import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'features/watch/presentation/bindings/watch_binding.dart';
import 'features/watch/presentation/screens/watch_home_screen.dart';

void main() {
  runApp(const WatchApp());
}

class WatchApp extends StatelessWidget {
  const WatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Watch Store",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialBinding: WatchBinding(),
      home: const WatchHomeScreen(),
    );
  }
}
