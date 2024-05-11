import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';

final serverData = [
  {
    "children": [
      {
        "children": [
          {
            "children": [],
            "id": 12,
            "pid": 1,
            "text": "Child title 12",
          }
        ],
        "id": 11,
        "pid": 1,
        "text": "Child title 11",
      },
    ],
    "id": 1,
    "pid": 0,
    "text": "Parent title 1",
  },
  {
    "children": [],
    "id": 2,
    "pid": 0,
    "text": "Parent title 2",
  },
  {
    "children": [],
    "id": 3,
    "pid": 0,
    "text": "Parent title 3",
  },
];

TreeViewModel mapServerDataToTreeData(Map data) {
  return TreeViewModel(
    title: data['text'],
    children: List.from(data['children'].map((x) => mapServerDataToTreeData(x))),
  );
}

List<TreeViewModel> treeData = List.generate(
  serverData.length,
  (index) => mapServerDataToTreeData(serverData[index]),
).toList();
