import 'images.dart';

class LaunchPadModel {
  Images? images;
  String? name;
  String? fullName;
  String? locality;
  String? region;
  int? launchAttempts;
  int? launchSuccesses;
  List<String>? launches;
  String? status;
  String? details;
  String? id;

  LaunchPadModel({
    this.images,
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.launchAttempts,
    this.launchSuccesses,
    this.launches,
    this.status,
    this.details,
    this.id,
  });

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) {
    return LaunchPadModel(
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      locality: json['locality'] as String?,
      region: json['region'] as String?,
      launchAttempts: (json['launch_attempts'] as num?)?.toInt(),
      launchSuccesses: (json['launch_successes'] as num?)?.toInt(),
      launches: (json['launches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      details: json['details'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'images': images?.toJson(),
        'name': name,
        'full_name': fullName,
        'locality': locality,
        'region': region,
        'launch_attempts': launchAttempts,
        'launch_successes': launchSuccesses,
        'launches': launches,
        'status': status,
        'details': details,
        'id': id,
      };
}
