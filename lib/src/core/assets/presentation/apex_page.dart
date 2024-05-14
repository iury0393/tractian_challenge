import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tractian_challenge/src/core/assets/presentation/controller/company_info_controller.dart';
import 'package:tractian_challenge/src/core/assets/presentation/tree_data.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class ApexPage extends StatefulWidget {
  final Map<String, dynamic> args;
  const ApexPage(this.args, {super.key});

  @override
  State<ApexPage> createState() => _ApexPageState();
}

class _ApexPageState extends State<ApexPage> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();
  final CompanyInfoController _controller = CompanyInfoController();

  @override
  void initState() {
    super.initState();
    _controller.getLocations(widget.args['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.getAppBar(
        () => Navigator.pop(context),
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
        return TreeView(
          data: treeData,
        );
      }),
    );
  }
}
