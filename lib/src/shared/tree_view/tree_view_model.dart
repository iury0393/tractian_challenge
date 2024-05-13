import 'package:flutter/material.dart';

class TreeViewModel {
  String title;
  List<TreeViewModel> children;
  bool hasStatus;
  bool hasSensorType;
  String prefix;
  Icon? suffix;

  TreeViewModel({
    required this.title,
    required this.children,
    required this.prefix,
    this.suffix,
    this.hasStatus = false,
    this.hasSensorType = false,
  });

  TreeViewModel.from(TreeViewModel other)
      : this(
          title: other.title,
          children: other.children,
          prefix: other.prefix,
          suffix: other.suffix,
          hasStatus: other.hasStatus,
          hasSensorType: other.hasSensorType,
        );
}
