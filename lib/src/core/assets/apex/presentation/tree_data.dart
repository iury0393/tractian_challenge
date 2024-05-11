import 'package:tractian_challenge/src/shared/tree_view/tree_view_model.dart';

final serverData = [
  {
    "id": "65674204664c41001e91ecb4",
    "name": "PRODUCTION AREA - RAW MATERIAL",
    "parentId": null,
    "children": [
      {
        "id": "60fc7c4595ad84001e95bfbd",
        "name": "CHARCOAL STORAGE SECTOR",
        "parentId": "65674204664c41001e91ecb4",
        "children": [
          {
            "id": "656a07bbf2d4a1001e2144c2",
            "name": "CONVEYOR BELT ASSEMBLY",
            "locationId": "656a07b3f2d4a1001e2144bf",
            "children": [
              {
                "id": "656a07c3f2d4a1001e2144c5",
                "name": "MOTOR TC01 COAL UNLOADING AF02",
                "parentId": "656a07bbf2d4a1001e2144c2",
                "children": [
                  {
                    "id": "656a07cdc50ec9001e84167b",
                    "name": "MOTOR RT COAL AF01",
                    "parentId": "656a07c3f2d4a1001e2144c5",
                    "sensorId": "FIJ309",
                    "sensorType": "vibration",
                    "status": "operating",
                    "gatewayId": "FRH546",
                    "children": [],
                  },
                ],
              },
            ],
          }
        ],
      },
    ],
  },
  {
    "id": "656734821f4664001f296973",
    "name": "Fan - External",
    "parentId": null,
    "sensorId": "MTC052",
    "sensorType": "energy",
    "status": "operating",
    "gatewayId": "QHI640",
    "locationId": null,
    "children": [],
  },
];

TreeViewModel mapServerDataToTreeData(Map data) {
  return TreeViewModel(
    title: data['name'],
    children: List.from(data['children'].map((x) => mapServerDataToTreeData(x))),
    prefix: 'assets/component.png',
    hasChildren: (data['children'] as List).isNotEmpty ? true : false,
    suffix: false,
  );
}

List<TreeViewModel> treeData = List.generate(
  serverData.length,
  (index) => mapServerDataToTreeData(serverData[index]),
).toList();
