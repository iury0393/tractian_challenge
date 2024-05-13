import 'package:flutter/material.dart';
import 'package:tractian_challenge/dependency_injection.dart';
import 'package:tractian_challenge/src/core/assets/apex/presentation/apex_page.dart';
import 'package:tractian_challenge/src/core/assets/jaguar/presentation/jaguar_page.dart';
import 'package:tractian_challenge/src/core/assets/tobias/presentation/tobias_page.dart';
import 'package:tractian_challenge/src/core/home/presentation/home_page.dart';
import 'package:tractian_challenge/src/shared/routes/app_routes.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.jaguar: (context) => const JaguarPage(),
        AppRoutes.tobias: (context) => const TobiasPage(),
        AppRoutes.apex: (context) => const ApexPage(),
      },
    );
  }
}
