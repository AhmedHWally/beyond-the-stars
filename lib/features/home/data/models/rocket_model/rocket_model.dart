import 'height.dart';
import 'mass.dart';

class RocketModel {
  Mass? mass;
  Height? height;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  RocketModel({
    this.mass,
    this.height,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        mass: json['mass'] == null
            ? null
            : Mass.fromJson(json['mass'] as Map<String, dynamic>),
        height: json['height'] == null
            ? null
            : Height.fromJson(json['height'] as Map<String, dynamic>),
        flickrImages: (json['flickr_images'] as List<dynamic>?)
            ?.map((image) => image as String)
            .toList(),
        name: json['name'] as String?,
        type: json['type'] as String?,
        active: json['active'] as bool?,
        costPerLaunch: (json['cost_per_launch'] as num?)?.toInt(),
        successRatePct: (json['success_rate_pct'] as num?)?.toInt(),
        firstFlight: json['first_flight'] as String?,
        country: json['country'] as String?,
        company: json['company'] as String?,
        wikipedia: json['wikipedia'] as String?,
        description: json['description'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mass': mass?.toJson(),
        'height': height?.toJson(),
        'flickr_images': flickrImages,
        'name': name,
        'type': type,
        'active': active,
        'cost_per_launch': costPerLaunch,
        'success_rate_pct': successRatePct,
        'first_flight': firstFlight,
        'country': country,
        'company': company,
        'wikipedia': wikipedia,
        'description': description,
        'id': id,
      };
}
