import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/core/assets/apex/presentation/tree_data.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class ApexPage extends StatefulWidget {
  const ApexPage({super.key});

  @override
  State<ApexPage> createState() => _ApexPageState();
}

class _ApexPageState extends State<ApexPage> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.getAppBar(
        () => Navigator.pop(context),
      ),
      body: TreeView(
        data: treeData,
      ),
    );
  }
}
