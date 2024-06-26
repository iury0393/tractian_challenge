import 'package:flutter/material.dart';
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
                    "name": "MOTOR RT COAL AF01 1",
                    "parentId": "656a07c3f2d4a1001e2144c5",
                    "sensorId": "FIJ309",
                    "sensorType": "vibration",
                    "status": "operating",
                    "gatewayId": "FRH546",
                  },
                  {
                    "id": "656a07cdc50ec9001e84167b",
                    "name": "MOTOR RT COAL AF01 2",
                    "parentId": "656a07c3f2d4a1001e2144c5",
                    "sensorId": "FIJ309",
                    "sensorType": "energy",
                    "status": "operating",
                    "gatewayId": "FRH546",
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
    "name": "Fan - External 1",
    "parentId": null,
    "sensorId": "MTC052",
    "sensorType": "energy",
    "status": "operating",
    "gatewayId": "QHI640",
    "locationId": null,
  },
  {
    "id": "656734821f4664001f296974",
    "name": "Fan - External 2",
    "parentId": null,
    "sensorId": "MTC052",
    "sensorType": "vibration",
    "status": "alert",
    "gatewayId": "QHI640",
    "locationId": null,
  },
  {
    "id": "656734821f4664001f296975",
    "name": "Fan - External 3",
    "parentId": null,
    "sensorId": "MTC052",
    "sensorType": "vibration",
    "status": "alert",
    "gatewayId": "QHI640",
    "locationId": null,
  },
];

TreeViewModel mapServerDataToTreeData(Map data) {
  return TreeViewModel(
    title: data['name'],
    children: data['children'] != null
        ? List.from(data['children'].map((x) => mapServerDataToTreeData(x)))
        : [],
    prefix: getPrefix(data),
    suffix: getSuffix(data),
    hasStatus: data['status'] != null && (data['status'] as String) == 'alert' ? true : false,
    hasSensorType:
        data['sensorType'] != null && (data['sensorType'] as String) == 'energy' ? true : false,
  );
}

List<TreeViewModel> treeData = List.generate(
  serverData.length,
  (index) => mapServerDataToTreeData(serverData[index]),
).toList();

Icon? getSuffix(Map data) {
  if (data['status'] != null && (data['status'] as String) == 'alert') {
    return const Icon(Icons.error, color: Colors.red);
  } else if (data['sensorType'] != null && (data['sensorType'] as String) == 'energy') {
    return const Icon(Icons.bolt, color: Colors.blue);
  } else {
    return null;
  }
}

String getPrefix(Map data) {
  if (data['sensorType'] != null) {
    return 'assets/component.png';
  } else if (data['locationId'] != null) {
    return 'assets/asset.png';
  } else {
    return 'assets/location.png';
  }
}
