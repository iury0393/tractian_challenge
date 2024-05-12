import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';

class TreeNode extends StatefulWidget {
  final TreeViewModel data;

  const TreeNode({
    super.key,
    required this.data,
  });

  @override
  State<TreeNode> createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);

  List<TreeNode> _geneTreeNodes(List list) {
    return List.generate(list.length, (int index) {
      return TreeNode(
        data: list[index],
      );
    });
  }

  @override
  initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (_isExpanded) {
      _rotationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RotationTransition(
                  turns: _turnsTween.animate(_rotationController),
                  child: IconButton(
                    iconSize: 16,
                    icon: const Icon(Icons.expand_more),
                    onPressed: () => toggleExpansion(),
                  ),
                ),
                Image.asset(widget.data.prefix),
                Row(
                  children: [
                    Text(
                      widget.data.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    widget.data.suffix ?? const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _rotationController,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(children: _geneTreeNodes(widget.data.children)),
          ),
        )
      ],
    );
  }

  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
      _rotationController.forward();
    } else {
      _rotationController.reverse();
    }
    setState(() {});
  }
}
