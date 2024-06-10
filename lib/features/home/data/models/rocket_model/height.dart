class Height {
  double? meters;
  int? feet;

  Height({this.meters, this.feet});

  factory Height.fromJson(Map<String, dynamic> json) => Height(
        meters: (json['meters'] as num?)?.toDouble(),
        feet: (json['feet'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'meters': meters,
        'feet': feet,
      };
}
