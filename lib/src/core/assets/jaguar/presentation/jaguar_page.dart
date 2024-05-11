import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class JaguarPage extends StatefulWidget {
  const JaguarPage({super.key});

  @override
  State<JaguarPage> createState() => _JaguarPageState();
}

class _JaguarPageState extends State<JaguarPage> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.getAppBar(
        () => Navigator.pop(context),
      ),
      body: Text('Jaguar'),
    );
  }
}
