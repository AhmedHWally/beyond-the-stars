import 'links.dart';

class CompanyInfoModel {
  String? name;
  int? founded;
  int? employees;
  String? ceo;
  int? vehicles;
  String? summary;
  Links? links;

  CompanyInfoModel({
    this.name,
    this.founded,
    this.employees,
    this.ceo,
    this.vehicles,
    this.summary,
    this.links,
  });

  factory CompanyInfoModel.fromJson(Map<String, dynamic> json) =>
      CompanyInfoModel(
        name: json['name'] as String?,
        founded: (json['founded'] as num?)?.toInt(),
        employees: (json['employees'] as num?)?.toInt(),
        ceo: json['ceo'] as String?,
        vehicles: (json['vehicles'] as num?)?.toInt(),
        summary: json['summary'] as String?,
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'founded': founded,
        'employees': employees,
        'ceo': ceo,
        'vehicles': vehicles,
        'summary': summary,
        'links': links?.toJson(),
      };
}
