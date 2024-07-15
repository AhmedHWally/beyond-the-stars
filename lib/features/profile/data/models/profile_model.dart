class ProfileModel {
  final String name;
  final String image;
  final String id;

  const ProfileModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'id': id,
    };
  }
}
