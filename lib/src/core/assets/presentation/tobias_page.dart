import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class TobiasPage extends StatefulWidget {
  final Map<String, dynamic> args;
  const TobiasPage(this.args, {super.key});

  @override
  State<TobiasPage> createState() => _TobiasPageState();
}

class _TobiasPageState extends State<TobiasPage> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  @override
  void initState() {
    super.initState();
    print(widget.args["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.getAppBar(
        () => Navigator.pop(context),
      ),
      body: Text('Tobias'),
    );
  }
}
