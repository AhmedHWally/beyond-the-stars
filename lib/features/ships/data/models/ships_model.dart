class ShipsModel {
  String? type;
  List<String>? roles;
  int? massKg;
  int? yearBuilt;
  String? homePort;
  String? image;
  String? name;
  bool? active;
  String? id;

  ShipsModel({
    this.type,
    this.roles,
    this.massKg,
    this.yearBuilt,
    this.homePort,
    this.image,
    this.name,
    this.active,
    this.id,
  });

  factory ShipsModel.fromJson(Map<String, dynamic> json) => ShipsModel(
        type: json['type'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        massKg: (json['mass_kg'] as num?)?.toInt(),
        yearBuilt: (json['year_built'] as num?)?.toInt(),
        homePort: json['home_port'] as String?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        active: json['active'] as bool?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'roles': roles,
        'mass_kg': massKg,
        'year_built': yearBuilt,
        'home_port': homePort,
        'image': image,
        'name': name,
        'active': active,
        'id': id,
      };
}
