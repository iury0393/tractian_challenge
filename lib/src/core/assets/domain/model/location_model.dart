class LocationModel {
  String id;
  String name;
  String? parentId;
  List<LocationModel>? children;

  LocationModel({
    this.id = '',
    this.name = '',
    this.parentId,
    this.children,
  });

  LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      children: List.empty(growable: true),
    );
  }
}
