import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/core/home/presentation/widgets/home_buttons_widget.dart';
import 'package:tractian_challenge/src/shared/routes/app_routes.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TRACTIAN',
          style: textStyles.appBarTitle(
            textColor: Colors.white,
            size: textSize.big,
            weight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: utils.getPaddingDefault(top: 25),
        child: Column(
          children: [
            HomeButtonsWidget(
              title: 'Jaguar Unit',
              callback: () => Navigator.pushNamed(context, AppRoutes.jaguar),
            ),
            const SizedBox(
              height: 25,
            ),
            HomeButtonsWidget(
              title: 'Tobias Unit',
              callback: () => Navigator.pushNamed(context, AppRoutes.tobias),
            ),
            const SizedBox(
              height: 25,
            ),
            HomeButtonsWidget(
              title: 'Apex Unit',
              callback: () => Navigator.pushNamed(context, AppRoutes.apex),
            ),
          ],
        ),
      ),
    );
  }
}
