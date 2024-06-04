class UserModel {
  final String name;
  final String image;
  final String id;

  const UserModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
