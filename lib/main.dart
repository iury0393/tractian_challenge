import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/home/presentation/home_page.dart';
import 'package:tractian_challenge/src/shared/routes/app_routes.dart';

void main() {
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
      },
    );
  }
}
