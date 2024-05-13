class HomeModel {
  String? id;
  String? name;

  HomeModel({
    this.id,
    this.name,
  });

  HomeModel fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
