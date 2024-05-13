import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';

class TreeViewFilter {
  List<TreeViewModel> filter(String val, List<TreeViewModel> list) {
    List<TreeViewModel> tempNodes = [];

    for (int i = 0; i < list.length; i++) {
      TreeViewModel tempNode = TreeViewModel.from(list[i]);
      if (tempNode.children.isNotEmpty) {
        tempNode.children = filter(val, tempNode.children);
      }
      if (tempNode.title.contains(RegExp(val, caseSensitive: false)) ||
          tempNode.children.isNotEmpty) {
        tempNodes.add(tempNode);
      }
    }
    return tempNodes;
  }

  List<TreeViewModel> filterSensor(List<TreeViewModel> list) {
    List<TreeViewModel> tempNodes = [];

    for (int i = 0; i < list.length; i++) {
      TreeViewModel tempNode = TreeViewModel.from(list[i]);
      if (tempNode.children.isNotEmpty) {
        tempNode.children = filterSensor(tempNode.children);
      }
      if (tempNode.hasSensorType || tempNode.children.isNotEmpty) {
        tempNodes.add(tempNode);
      }
    }
    return tempNodes;
  }

  List<TreeViewModel> filterStatus(List<TreeViewModel> list) {
    List<TreeViewModel> tempNodes = [];

    for (int i = 0; i < list.length; i++) {
      TreeViewModel tempNode = TreeViewModel.from(list[i]);
      if (tempNode.children.isNotEmpty) {
        tempNode.children = filterStatus(tempNode.children);
      }
      if (tempNode.hasStatus || tempNode.children.isNotEmpty) {
        tempNodes.add(tempNode);
      }
    }
    return tempNodes;
  }
}
