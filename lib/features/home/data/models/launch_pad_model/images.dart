class Images {
  List<String>? large;

  Images({this.large});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large:
            (json['large'] as List<dynamic>?)?.map((e) => e as String).toList(),
      );

  Map<String, dynamic> toJson() => {
        'large': large,
      };
}
