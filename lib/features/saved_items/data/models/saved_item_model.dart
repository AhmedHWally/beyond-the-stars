class SavedItemModel {
  int? id;
  String title;
  String imageUrl;
  String type;
  String country;

  SavedItemModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.country,
    required this.type,
  });

  factory SavedItemModel.fromJson(Map<String, dynamic> json) => SavedItemModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      country: json['location'],
      type: json['type']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'image': imageUrl,
        'location': country,
      };
}
