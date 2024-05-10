import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';

class HomeButtonsWidget extends StatelessWidget {
  final String title;
  final void Function()? callback;
  HomeButtonsWidget({
    super.key,
    required this.title,
    required this.callback,
  });
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.blue,
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          100,
        ),
      ),
      icon: const Icon(
        Icons.auto_awesome_motion,
        color: Colors.white,
      ),
      label: Text(
        title,
        style: textStyles.paragraph(
          textSize.large,
          color: Colors.white,
        ),
      ),
    );
  }
}
