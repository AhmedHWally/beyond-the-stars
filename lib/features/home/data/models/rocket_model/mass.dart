class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: (json['kg'] as num?)?.toInt(),
        lb: (json['lb'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'kg': kg,
        'lb': lb,
      };
}
