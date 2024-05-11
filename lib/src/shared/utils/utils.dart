import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';

class Utils {
  EdgeInsets getPaddingDefault({double? left, double? top, double? right, double? bottom}) {
    return EdgeInsets.fromLTRB(left ?? 15.0, top ?? 10.0, right ?? 15.0, bottom ?? 10.0);
  }

  AppBar getAppBar(void Function()? goBack) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Assets',
        style: TextStyles().appBarTitle(
          textColor: Colors.white,
          size: TextSize().big,
          weight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: goBack,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
