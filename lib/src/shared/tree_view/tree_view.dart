import 'package:flutter/material.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view_node.dart';
import 'package:tractian_challenge/src/shared/utils/text_styles.dart';
import 'package:tractian_challenge/src/shared/utils/utils.dart';

class TreeView extends StatefulWidget {
  final List<TreeViewModel> data;

  const TreeView({
    super.key,
    required this.data,
  });

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  final TextStyles textStyles = TextStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();
  List<TreeViewModel> _renderList = [];
  final List<bool> _selectedFilters = <bool>[false, false];

  List<TreeViewModel> _filter(String val, List<TreeViewModel> list) {
    List<TreeViewModel> tempNodes = [];

    for (int i = 0; i < list.length; i++) {
      TreeViewModel tempNode = TreeViewModel.from(list[i]);
      if (tempNode.children.isNotEmpty) {
        tempNode.children = _filter(val, tempNode.children);
      }
      if (tempNode.title.contains(RegExp(val, caseSensitive: false)) ||
          tempNode.children.isNotEmpty) {
        tempNodes.add(tempNode);
      }
    }
    return tempNodes;
  }

  void _onChange(String val) {
    _renderList = widget.data;
    if (val.isNotEmpty) {
      _renderList = _filter(val, _renderList);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _renderList = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: utils.getPaddingDefault(),
            child: TextField(
              onChanged: _onChange,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Search'),
            ),
          ),
          ToggleButtons(
            onPressed: (index) {
              setState(() {
                _selectedFilters[index] = !_selectedFilters[index];
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.blue[700],
            selectedColor: Colors.white,
            fillColor: Colors.blue[200],
            color: Colors.blue[400],
            constraints: const BoxConstraints(
              minHeight: 50.0,
              minWidth: 120.0,
            ),
            isSelected: _selectedFilters,
            children: utils.toggles,
          ),
          ...List.generate(
            _renderList.length,
            (int index) {
              return TreeNode(
                data: _renderList[index],
              );
            },
          )
        ],
      ),
    );
  }
}
