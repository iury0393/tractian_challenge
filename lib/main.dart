import 'package:flutter/material.dart';
import 'package:tractian_challenge/dependency_injection.dart';
import 'package:tractian_challenge/src/core/assets/presentation/apex_page.dart';
import 'package:tractian_challenge/src/core/assets/presentation/jaguar_page.dart';
import 'package:tractian_challenge/src/core/assets/presentation/tobias_page.dart';
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
        AppRoutes.jaguar: (context) => JaguarPage(
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
            ),
        AppRoutes.tobias: (context) => TobiasPage(
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
            ),
        AppRoutes.apex: (context) => ApexPage(
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
            ),
      },
    );
  }
}
