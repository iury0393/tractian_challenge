import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tractian_challenge/src/core/home/presentation/controller/home_controller.dart';
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
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.getCompanies();
  }

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
      body: Observer(builder: (_) {
        if (_controller.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (_controller.error) {
          return Center(
            child: Text(
              'BAD REQUEST',
              style: textStyles.paragraph(
                textSize.big,
                color: Colors.red,
                weight: FontWeight.bold,
              ),
            ),
          );
        }
        return Padding(
          padding: utils.getPaddingDefault(top: 25),
          child: Column(
            children: [
              HomeButtonsWidget(
                title: '${_controller.jaguarData.name} Unit',
                callback: () => Navigator.pushNamed(context, AppRoutes.jaguar),
              ),
              const SizedBox(
                height: 25,
              ),
              HomeButtonsWidget(
                title: '${_controller.tobiasData.name} Unit',
                callback: () => Navigator.pushNamed(context, AppRoutes.tobias),
              ),
              const SizedBox(
                height: 25,
              ),
              HomeButtonsWidget(
                title: '${_controller.apexData.name} Unit',
                callback: () => Navigator.pushNamed(context, AppRoutes.apex),
              ),
            ],
          ),
        );
      }),
    );
  }
}
