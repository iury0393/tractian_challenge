class AssetModel {
  String id;
  String name;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;
  List<Object>? children;

  AssetModel({
    this.id = '',
    this.name = '',
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
    this.children,
  });

  AssetModel fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      sensorId: json['sensorId'],
      sensorType: json['sensorType'],
      status: json['status'],
      gatewayId: json['gatewayId'],
      locationId: json['locationId'],
      children: List.empty(growable: true),
    );
  }
}
